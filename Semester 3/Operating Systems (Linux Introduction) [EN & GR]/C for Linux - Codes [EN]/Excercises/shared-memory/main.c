#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/shm.h>
#include <sys/stat.h>
#include <time.h>

int main(int argc, char **argv)
{
	pid_t pid;
	int segment_id;
	int *sm;
	
	segment_id = shmget(IPC_PRIVATE, 10*sizeof(int), S_IRUSR | S_IWUSR);
	sm = (int *)shmat(segment_id, NULL, 0);
	int i;
	
	char par1[10], par2[10];
	for(i=0;i<10;i++){
		if(fork() == 0){
			srand(time(NULL) ^ (getpid()<<16));
			if(i%2 == 0){ //Memory Addition (add_mem.c)
				for(i=0;i<10;i++)
					sm[i] = rand()%10;
				sprintf(par1, "%d", segment_id);
				sprintf(par2, "%d", 10);
				execl("add_mem", "add_mem", par1, par2, NULL);
			}else{ //Arg Addition(add_excl.c)
				sprintf(par1, "%d", rand()%20);
				sprintf(par2, "%d", rand()%20);
				execl("add_execl", "add_execl", par1, par2, NULL);
			}
			shmdt(sm);
			shmctl(segment_id, IPC_RMID, 0);
		}
	}
	return 0;
}

