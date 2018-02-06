/*
 * Excercise: Create a 4x10 Matrix (table) and a function where each thread
 * 			  calculates the sum of a line.
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <pthread.h>
#include <time.h>

#define NUM_OF_THREADS 4

int matrix[4][10];

void *calc_sum(void *thread_id){
	int tid = *((int *)thread_id);
	int j;
	int *sum = malloc(sizeof(int));
	*sum = 0;
	for(j=0;j<10;j++)
		*sum += matrix[tid][j];
	printf("Line %d , sum = %d\n", tid, *sum);
	free(thread_id);
	pthread_exit(sum);
}

void print_table(){
	int i,j;
	for(i=0;i<4;i++){
		for(j=0;j<10;j++)
			printf("%d ", matrix[i][j]);
		printf("\n");
	}
}

int main(int argc, char **argv)
{
	pthread_t pthreads[NUM_OF_THREADS];
	int i, j;
	
	srand(time(NULL));
	
	for(i=0;i<4;i++)
		for(j=0;j<10;j++)
			matrix[i][j] = rand()%20;
			
	print_table();
	
	int t, sum, result = 0;
	void *thread_result;
	for(t=0; t<NUM_OF_THREADS; t++){
		int *arg = malloc(sizeof(int));
		*arg = t;
		if(pthread_create(&pthreads[t], NULL, calc_sum, arg)) free(arg);
	}
	
	for(t=0; t<NUM_OF_THREADS; t++){
		pthread_join(pthreads[t], &thread_result);
		sum +=  *((int *)thread_result);
	}
	printf("Final sum: %d", sum);
	return 0;
}

