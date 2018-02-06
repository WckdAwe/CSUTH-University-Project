#include <unistd.h>
#include <sys/types.h>
#include <errno.h>
#include <stdio.h>
#include <sys/wait.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
	pid_t childpid;
	int retval, status;
	
	childpid = fork();
	if (childpid >= 0){
		if (childpid == 0){
			printf("CHILD: I am the child process!\n");
			printf("CHILD: Here's my PID: %d\n", getpid());
			printf("CHILD: My parent's PID is: %d\n", getppid());
			printf("CHILD: The value of my copy of childpid is: %d\n", childpid);
			printf("CHILD: Sleeping for 1 second...\n");
			sleep(1);
			printf("CHILD: Enter an exit value (0 to 255): ");
			scanf(" %d", &retval);
			printf("CHILD: Goodbye!\n");
			exit(retval);
		}else{
			printf("PARENT: I am the parent process!\n");
			printf("PARENT: Here's my PID: %d\n", getpid());
			printf("PARENT: The value of my copy of childpid is %d\n", childpid);
			printf("PARENT: I will now wait for my child to exit.\n");
			wait(&status); /* wait for child to exit, and store its status */
			printf("PARENT: Child's exit code is: %d\n", WEXITSTATUS(status));
			printf("PARENT: Goodbye!\n");
			exit(0);
		}
	}else{
		perror("fork");
		exit(0);
	}
	return 0;
}

