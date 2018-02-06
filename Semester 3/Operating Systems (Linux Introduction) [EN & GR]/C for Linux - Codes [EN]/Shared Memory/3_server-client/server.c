#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#define MAXSIZE 27

void die(char *s)
{
	perror(s);
	exit(1);
}

int main()
{
	char c;
	int shmid;
	key_t key;
	char *shm, *s;
	key = 5678;
	
	if ((shmid = shmget(key, MAXSIZE, IPC_CREAT | 0666)) < 0)
		die("shmget");
	if ((shm = shmat(shmid, NULL, 0)) == (char *) -1)
		die("shmat");
		
	/*
	 *  Put some things into the memory for the
	 * other process to read.
	 * 
	 */
	s = shm;
	for (c = 'a'; c <= 'z'; c++){
		*(s++) = c;
	}
	
	/*
	* Wait until the other process
	* changes the first character of our memory
	* to '*', indicating that it has read what
	* we put there.
	*/
	while (*shm != '*'){
		sleep(1);
	}
	
	exit(0);
}
