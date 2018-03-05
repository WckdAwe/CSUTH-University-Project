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
 
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

#define SIZE 10
int main(int argc, char **argv)
{
	pid_t children[10];
	int i;
	for(i=0;i<SIZE;i++){
		children[i] = fork();
		if(children[i] < 0) perror("Error");
		else if(children[i] == 0){
			printf("Child %d here. Doing some random stuff\n", getpid());
			sleep(2);
			exit(0);
		}else{
			kill(children[i], 1);
		} 
	}
	
	int n=SIZE;
	int status;
	while(n>0){
		pid_t pid = wait(&status);
		if(WIFEXITED(status))
			printf("[%d] Child exited\n", pid);
		else
			printf("Exited abno\n");
		n--;
	}
	
	printf("Parent here! I got sick with all these kids dying around here.\nI'm out!\n");
	return 0;
}

