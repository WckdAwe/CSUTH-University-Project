#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
	pid_t pid;
	char *message;
	int n;
	printf("Fork program starting\n");
	pid = fork();
	switch(pid){
		case -1:
			perror("fork failed");
			exit(1);
		case 0:
			message = "This is the child!";
			n = 5;
			break;
		default:
			message = "This is the parent!";
			n = 3;
			break;
	}
	printf("%s . My n is equal to %d\n", message, n);
	return 0;
}

