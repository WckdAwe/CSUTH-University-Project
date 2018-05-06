#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <pthread.h>
#include <string.h>
#include <semaphore.h>


#define THREADS_NUM 20
#define MAX_FILE_NAME_CHARS 256 // Maximum characters allowed for filename/path
#define WRITE_DELAY 1
#define RANDOM_MIN 1
#define RANDOM_MAX 200

typedef struct params{
	int thread_id;
	char *path;
	int *terminate;
}params;


int random_num(int min, int max);
void *thread_function(void* arg);

pthread_mutex_t work_mutex;


void die(char *errno){
	perror(errno);
	exit(EXIT_FAILURE);
}

/*
 * Known bugs: 
 *   - 'Case Conflict' if 2 or more files with the same name but different capitalization are entered:
 * 	     Example -> 'hey.txt' and 'HEY.TXT'
 * 	   In this case we will ignore this bug since we do not expect the user to do something like that.
 * Help:
 *   - To write on a different path (other than local, like '/user/hey.txt') you will need to execute 
 *     with super user permissions (sudo)
 */
 
int main(int argc, char **argv)
{
	srand(time(NULL)); // Assign a seed based on time to create random values later.
	
	pthread_t threads[THREADS_NUM];
	int i, term_seq = 0; // Terminate program execution when 'term_seq' is set to 1. 
	
	/** Read a local file's name or a path to a file **/
	char file_name[MAX_FILE_NAME_CHARS];
	printf("Enter a filename (MAX %d Chars): ", MAX_FILE_NAME_CHARS);
	scanf("%s", file_name);
	
	/** Create an empty file if it doesn't exist, otherwise empty its content **/ 	
	FILE *fp = fopen(file_name, "w");
	fclose(fp);
	
	printf("File '%s' was created & cleaned.\n", file_name);
	
	
	if(pthread_mutex_init(&work_mutex, NULL) != 0) die("pthread_mutex_init");
	pthread_mutex_lock(&work_mutex); // Lock mutex until all threads have been created.
	
	/** Create Threads || Assign the path_name to each thread **/
	for(i=0;i<THREADS_NUM;i++){
		params *par = malloc(sizeof(params));
		par->thread_id = i;
		par->path = file_name;
		par->terminate = &term_seq;
		
		if(pthread_create(&threads[i], NULL, thread_function, (void *)par) != 0) die("pthread_create");
	}
	
	pthread_mutex_unlock(&work_mutex); // Unlock mutex since all threads have been created.
	
	/** Accept any console input until it matches the word 'end' **/
	char msg[4];
	do{
		scanf("%3s", msg);
		if(strcmp(msg, "end") == 0){ // If user enters 'end' in the console, terminate threads.
			term_seq = 1;
			break;
		}
	}while(1);
	
	/** Await thread termination **/
	for(i=0;i<THREADS_NUM;i++){
		printf("Thread %d joined.\n", i);
		pthread_join(threads[i], NULL);
	}
	
	pthread_mutex_destroy(&work_mutex); // Destroy mutex since it is no longer required.
	
	
	/** Read final file's contents to verify that everything worked correctly **/
	printf("================\n");
	printf("Reading file '%s': \n", file_name);
	fp = fopen(file_name, "r");
	char c;
	while ((c = getc(fp)) != EOF)
        putchar(c);
    fclose(fp);

	return 0;
}


int random_num(int min, int max){
	return min + rand()%(max-min) + 1;
}

void *thread_function(void* arg){
	params *par = (params *) arg;
	while(1){
		pthread_mutex_lock(&work_mutex);
		if(*(par->terminate) == 1){ // Termination sequence was given
			pthread_mutex_unlock(&work_mutex);
			break;
		}
		
		FILE *file = fopen(par->path, "a"); // Open file to append a random number
		if(!file) die("fopen");
		
		int rnd_num = random_num(RANDOM_MIN, RANDOM_MAX);
		fprintf(file, "%d, ", rnd_num); // Append the random number
		
		printf("Thread %d wrote on '%s': %d .\n", par->thread_id, par->path, rnd_num);
		fclose(file);
		
		sleep(WRITE_DELAY); // Sleep thread to read easier the output messages and delay the writing process.
		
		pthread_mutex_unlock(&work_mutex); 
		sleep(1); // Sleep this thread to 'emulate' busy and allow another thread to take over!
	}
	
	pthread_exit(NULL);
}
