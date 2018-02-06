#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdlib.h>

void fork1();
void fork2();
void fork3();
void fork4();
void fork5();
void fork6();
void fork7();
int main(int argc, char **argv)
{
	fork7();
	return 0;
}

void fork1()
{
	int x = 1;
	pid_t pid = fork();
	if (pid == 0) {
		printf("Child has x = %d\n", ++x);
	}else{
		printf("Parent has x = %d\n", --x);
	}
	printf("Bye from process %d with x = %d\n", getpid(), x);
}

void fork2()
{
	printf("L0\n");
	fork();
	printf("L1\n");
	fork();
	printf("Bye\n");
}

void fork3()
{
	printf("L0\n");
	fork();
	printf("L1\n");
	fork();
	printf("L2\n");
	fork();
	printf("Bye\n");
}
void fork4()
{
	printf("L0\n");
	if (fork() != 0) {
		printf("L1\n");
		if (fork() != 0) {
			printf("L2\n");
			fork();
		}
	}
	printf("Bye\n");
}

void fork5()
{
	printf("L0\n");
	if (fork() == 0) {
		printf("L1\n");
		if (fork() == 0) {
			printf("L2\n");
			fork();
		}
	}
	printf("Bye\n");
}

/*
* fork6 - Demonstration of zombies.
* Run in background and then perform ps
*/
void fork6()
{
	if (fork() == 0) {
		/* Child */
		printf("Terminating Child, PID = %d\n", getpid());
		exit(0);
	} else {
		printf("Running Parent, PID = %d\n", getpid());
		while (1); /* Infinite loop */
	}
}

/*
* fork7 - Demonstration of nonterminating child.
* Child still running even though parent terminated
* Must kill explicitly
*/
void fork7(){
	if (fork() == 0) {
		/* Child */
		printf("Running Child, PID = %d\n", getpid());
		while (1); /* Infinite loop */
	} else {
		printf("Terminating Parent, PID = %d\n", getpid());
		exit(0);
	}
}
