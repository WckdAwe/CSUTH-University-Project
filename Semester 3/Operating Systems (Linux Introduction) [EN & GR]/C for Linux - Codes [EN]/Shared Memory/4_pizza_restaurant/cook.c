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
		
	int pizza_in_stock = 10;
	while(pizza_in_stock > 0){
		(*pizza)++;
		printf("Cook added a pizza! (%d)(%d)\n", *pizza, pizza_in_stock);
		sleep(1);
		pizza_in_stock--;
	}
	
	printf("Cook: I am out of pizza! Bye\n");
	
	shmctl(shmid, IPC_RMID, (struct shmid_ds*) 0);
	return 0;
}

