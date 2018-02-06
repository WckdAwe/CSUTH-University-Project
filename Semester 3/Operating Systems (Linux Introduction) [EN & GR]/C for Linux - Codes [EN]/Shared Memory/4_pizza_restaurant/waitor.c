#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/shm.h>

void die(char *s)
{
	perror(s);
	exit(1);
}

int main(int argc, char **argv)
{
	int key = 1234;
	int shmid;
	int *pizza;
	
	if((shmid = shmget(key, sizeof(int), IPC_CREAT | 0666)) < 0)
		die("shmget");
		
	if((pizza = shmat(shmid, NULL, 0)) < 0)
		die("shmat");
		
		
	while(1){
		(*pizza)--;
		printf("Waitor delivered a pizza! (%d)\n", *pizza);
		
		sleep(2);
		if(pizza < 0)
			break;
	}
	printf("Mamma mia! We are out of pizza!\n");
	
	shmctl(shmid, IPC_RMID, (struct shmid_ds*) 0);
	return 0;
}

