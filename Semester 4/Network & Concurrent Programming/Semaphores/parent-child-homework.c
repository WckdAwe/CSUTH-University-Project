#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/shm.h>
#include <sys/sem.h>
#include <sys/types.h>
#include <sys/wait.h>

#define BUF_SIZE 5 
#define SHARED_MEM_SIZE (BUF_SIZE+1)*sizeof(int)

#define DEBUG 0// 1: True || 0: False
#define NUM_TESTS 15 // Number of tests to run. Requires DEBUG = 1! 


/* shared memory segment will be organized as follows:
 * n = BUF_SIZE
 * elems = elements left to be processed [Allowed values: 0 (empty) - BUF_SIZE (full)]
   0                                                   n-1 n
  ------------------------------------------------------------
  |                                                       |  |
  ------------------------------------------------------------
   ^                                                       ^
  buffer                                                   elems
*/
   
union semun {
	int val;
	struct semid_ds *buf;
	unsigned short *array;
};

static int set_semvalue(void);
static void del_semvalue(void);
static int semaphore_p(void);
static int semaphore_v(void);

void exec_child();
void exec_parent();

void die(char *error){
	perror(error);
	exit(EXIT_FAILURE);
}

static int sem_id; // Semaphore ID
static int shm_id; // Shared Memory ID

int main(int argc, char **argv)
{
	key_t sem_key = ftok(argv[0], 0);
	key_t shm_key = ftok(argv[0], 1);
	
	if(sem_key == -1) die("ftok");
	if(shm_key == -1) die("ftok");
	
	if(DEBUG){
		printf("[Console] Semaphore Key: %d\n", sem_key);	
		printf("[Console] Shared memory Key: %d\n", shm_key);
		
		fflush(stdout); // Flush STDOUT so generated_key isn't double-printed due to fork()
	}
	
	if((sem_id = semget(sem_key, 1, 0666 | IPC_CREAT)) == -1) die("semget");
	if((shm_id = shmget(shm_key, SHARED_MEM_SIZE, 0644 | IPC_CREAT)) == -1) die("shmget");
	
	set_semvalue(); // Initiate 'Binary' semaphore. Default Value: 1 (Resource Available)
	
	pid_t pid = fork();
	switch(pid){
		case -1:
			die("fork");
		case 0:
			exec_child();
			break;
		default:
			exec_parent();
			break;
	}
	
	wait(&pid); // Wait for child to finish Calculations.
	
	printf("[Parent] Homework done. You can go play outside now!\n");
	if(DEBUG) printf("[Parent] Semaphore Final Value: %d\n", semctl(sem_id, 0, GETVAL));
	
	/* Clean-up */
	del_semvalue();
	shmctl (shm_id, IPC_RMID, 0);
	return 0;
}

void exec_child(){
	int *data;
	int pos = 0;
	int sum = 0;
	
	if((data = shmat(shm_id, (void *)0, 0)) == (int *)-1) die("shmat"); // Try to attach memory
	
	while(1){
		if(!data[BUF_SIZE]) continue; // Check if there is input to calculate
		
		while(!semaphore_p()) sleep(1); // START-CRITICAL
		int data_val = data[(pos++)%BUF_SIZE];
		if(DEBUG){
			printf("\n");
			printf("[Child] Reading Value: %d\n", data_val);
			printf("[Child] Semaphore Value: %d\n", semctl(sem_id, 0, GETVAL));
			sleep(1);
		}
		
		sum += data_val;
		data[BUF_SIZE]--;
		semaphore_v(); // END-CRITICAL || Release Resources
		
		if(data_val == 0) break;
	}
	
	printf("[Child] =======================\n");
	printf("[Child] All values have been read\n");
	printf("[Child] Sum: %d\n", sum);
	
	if(DEBUG) printf("[Child] Semaphore Value: %d\n", semctl(sem_id, 0, GETVAL));
	
	if((shmdt(data)) == -1) die("shmdt"); // Detach Memory Segment
		
	exit(EXIT_SUCCESS);
}

void exec_parent(){
	int *data;
	int pos = 0;
	
	if((data = (int *) shmat(shm_id, (void *)0, 0)) == (int *)-1) die("shmat"); // Try to attach memory
	
	data[BUF_SIZE] = 0; // Initiate 'elems' in BUFFER
	
	int num=-1;
	while(num != 0){ // Choosing exit at 0 because 0^2 = 0 => Doesn't affect the sum!
		if(!DEBUG){
			printf("[Console] Give me a number (%d): ", pos);
			scanf("%d", &num);
		}else{
			if(num == -1) num = 0;
			if(++num == NUM_TESTS+1) num = 0;
		}
		
		int data_sqr = num*num; 
		
		// Wait until there are available resources;
		while(1){
			int allocated = semaphore_p(); // Is Resource Allocated?
			if(!allocated){
				sleep(1);
				continue;
			}
			if(data[BUF_SIZE] == BUF_SIZE){ // IMPORTANT: If allocated, but buffer is full, deallocate.
				semaphore_v();
				continue;
			}else{
				data[(pos++)%BUF_SIZE] = data_sqr;
				data[BUF_SIZE]++; // IsEmpty = False;
				semaphore_v();
				break;
			}
		}
	}
	
	if((shmdt(data)) == -1) die("shmdt"); // Detach Memory Segment
	
	if(DEBUG) printf("[Parent] exec_parent finished!\n");
}

static int set_semvalue(void)
{
	union semun sem_union;
	sem_union.val = 1;
	if (semctl(sem_id, 0, SETVAL, sem_union) == -1) return(0);
	return(1);
}

static void del_semvalue(void)
{
	union semun sem_union;
	if (semctl(sem_id, 0, IPC_RMID, sem_union) == -1)
		fprintf(stderr, "Failed to delete semaphore\n");
}

static int semaphore_p(void)
{
	struct sembuf sem_b;
	sem_b.sem_num = 0;
	sem_b.sem_op = -1; /* P() */
	sem_b.sem_flg = SEM_UNDO;
	if (semop(sem_id, &sem_b, 1) == -1) {
		fprintf(stderr, "semaphore_p failed\n");
		return(0);
	}
	return(1);
}

static int semaphore_v(void)
{
	struct sembuf sem_b;
	sem_b.sem_num = 0;
	sem_b.sem_op = 1; /* V() */
	sem_b.sem_flg = SEM_UNDO;
	if (semop(sem_id, &sem_b, 1) == -1) {
		fprintf(stderr, "semaphore_v failed\n");
		return(0);
	}
	return(1);
}
