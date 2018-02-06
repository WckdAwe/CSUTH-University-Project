#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <pthread.h>

#define SIZE 10

int A[SIZE][SIZE];
int B[SIZE][SIZE];
int RESULT[SIZE][SIZE];

void fill_table(int table[SIZE][SIZE]);
void print_table(int table[SIZE][SIZE]);
void *add_matrix_1(void *args);
void *add_matrix_2(void *args);

int main(int argc, char **argv)
{
	pthread_t thread1, thread2;
	pthread_create(&thread1, NULL, add_matrix_1, NULL);
	pthread_create(&thread2, NULL, add_matrix_2, NULL);
	fill_table(A);
	fill_table(B);
	pthread_join(thread1, NULL);
	pthread_join(thread2, NULL);
	
	print_table(A);
	print_table(B);
	print_table(RESULT);
	return 0;
}

void *add_matrix_1(void *args){
	int i,j;
	for(i=0;i<SIZE/2;i++)
		for(j=0;j<SIZE;j++)
			RESULT[i][j] = A[i][j] + B[i][j];
}

void *add_matrix_2(void *args){
	int i,j;
	for(i=SIZE/2;i<SIZE;i++)
		for(j=0;j<SIZE;j++)
			RESULT[i][j] = A[i][j] + B[i][j];
}

void fill_table(int table[SIZE][SIZE]){
	int i,j;
	for(i=0;i<SIZE;i++)
		for(j=0;j<SIZE;j++)
			table[i][j] = rand()%(SIZE+1);
}

void print_table(int table[SIZE][SIZE]){
	int i,j;
	printf("====================\n");
	for(i=0;i<SIZE;i++){
		for(j=0;j<SIZE;j++)
			printf("%d ", table[i][j]);
		printf("\n");
	}
	printf("====================\n");
}
