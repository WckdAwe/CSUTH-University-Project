/* MIT License
 *
 * Copyright (c) 2018 Dimitriadis Vasileios ( Wicked™ | wckdawe.com )
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */


#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/sem.h>
#include <time.h>

#define NUM_STRINGS 10
#define TOTAL_TESTS 5

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

static int msgs_sent = TOTAL_TESTS;
static int sem_id;
static char* strings[] = {
		"Hello there random guy!",
		"Just another random message",
		"Yeah... more randomness",
		"Something is wrong here",
		"42! It's all about that number",
		"Lorem Ipsum",
		"And that's about it",
		"Pretty much just a bunch of random strings",
		"One Console. Multiple Strings of Randomness",
		"Here is just another string",
	};
static int rnd(int min, int max){
	return min + rand()%(max-min);
}

int main(int argc, char *argv[])
{
	key_t key = ftok(argv[0], 0);
		
	sem_id = semget(key, 1, 0666 | IPC_CREAT);
	
	
	pid_t pid = fork();
	srand(time(NULL) + (unsigned int)getpid());
	set_semvalue();
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
	wait(&pid);
	del_semvalue();
}

void exec_child(){
	while(1){
		while(!semaphore_p()){
			sleep(1);
			continue;
		}
		printf("[Child] %s \n", strings[rnd(0, NUM_STRINGS-1)]); 
		msgs_sent--;
		if(msgs_sent == 0){
			semaphore_v();
			exit(EXIT_SUCCESS);
		}
		semaphore_v();
	}
}

void exec_parent(){
	while(1){
		while(!semaphore_p()){
			sleep(1);
			continue;
		}
		printf("[Parent] %s \n", strings[rnd(0, NUM_STRINGS-1)]); 
		msgs_sent--;
		if(msgs_sent == 0){
			semaphore_v();
			break;
		}
		semaphore_v();
	}
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
