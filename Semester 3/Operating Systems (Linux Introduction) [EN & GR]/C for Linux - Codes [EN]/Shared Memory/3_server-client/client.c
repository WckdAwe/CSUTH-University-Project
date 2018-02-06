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
	int shmid;
	key_t key;
	char *shm, *s;
	key = 5678;
	
	if ((shmid = shmget(key, MAXSIZE, 0666)) < 0){
		die("shmget");
	}
	
	if ((shm = shmat(shmid, NULL, 0)) == (char *) -1){
		die("shmat");
	}
	
	//Now read what the server put in the memory.
	for (s = shm; *s != '\0'; s++)
	putchar(*s);
	putchar('\n');
	
	/*
	*Change the first character of the
	*segment to '*', indicating we have read
	*the segment.
	*/
	*shm = '*';
	exit(0);
}
