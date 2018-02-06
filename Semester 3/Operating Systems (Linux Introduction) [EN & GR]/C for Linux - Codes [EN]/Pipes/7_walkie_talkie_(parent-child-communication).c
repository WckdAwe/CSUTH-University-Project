#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>

int main(int argc, char **argv)
{
	int file_descriptor[2];
	pid_t pid;
	char buffer[BUFSIZ + 1];
	
	if(pipe(file_descriptor) == 0){
		pid = fork();
		if(pid == -1) exit(EXIT_FAILURE);
		if(pid == 0){
			while(1){
				read(file_descriptor[0], buffer, BUFSIZ);
				printf("(Child) Read: %s\n", buffer);
			}
		}else{
			char *str = malloc(50);
			while(1){
				printf("(Parent) Type: ");
				scanf("%49s", str);
				fflush(stdin);
				write(file_descriptor[1], str, sizeof(str));
				sleep(1);
			}
		}
	}
	return 0;
}

