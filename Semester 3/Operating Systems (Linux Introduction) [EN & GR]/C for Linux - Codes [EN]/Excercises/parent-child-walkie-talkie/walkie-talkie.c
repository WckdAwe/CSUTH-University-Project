/*
 * Excercise: Create 2 processes, parent & child, that exchange
 * 			  messages using pipes, anonymously.
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <string.h>

#define MSGLEN 64

int main(int argc, char **argv)
{
	int fd[2];
	pid_t pid;
	char message[MSGLEN];
	
	int pipe_res = pipe(fd);
	if(pipe_res == 0){
		pid = fork();
		if(pid < 0) exit(EXIT_FAILURE);
		if(pid == 0){
			while(1){
				memset(message, '\0', sizeof(message));
				printf("(Child) Type: ");
				scanf("%s", message);
				write(fd[1], message, strlen(message));
				sleep(1);
			}
		}else{
			while(1){
				memset(message, 0, sizeof(message));
				read(fd[0], message, sizeof(message));
				printf("(Parent) Received: %s\n", message);
			}
		}
	}
	return 0;
}

