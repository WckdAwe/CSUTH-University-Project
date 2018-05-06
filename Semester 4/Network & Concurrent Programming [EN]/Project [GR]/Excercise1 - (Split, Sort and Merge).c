#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <pthread.h>


/*
 * All STATIC variables are used only in main for easy configuration.
 * No STATIC variables (other than DEBUG) are used outside of main.
 */

#define DEBUG 0

#define THREADS_NUM 10
#define TABLE_SIZE 1000
#define TABLE_SIZE_PER_THREAD TABLE_SIZE/THREADS_NUM // The result of this division MUST be an integer! 
#define RANDOM_MIN 1
#define RANDOM_MAX 200

int random_num(int min, int max);
void *thread_insertion_sort(void *arg);
int *merge(int *left, size_t l_len, int *right, size_t r_len);
void insertion_sort(int table[], size_t size);
void print_table(int table[], size_t);

typedef struct params{
	int thread_id;
	int *table;
	size_t size;
}params;

void die(char *errno){
	perror(errno);
	exit(EXIT_FAILURE);
}

int main(int argc, char **argv)
{
	srand(time(NULL)); // Assign a seed based on time to create random values later.
	
	int table[TABLE_SIZE];
	int *output_table;
	size_t output_size = 0;
	
	pthread_t threads[THREADS_NUM];
	
	/** Randomly assign values (between RANDOM_MIN & RANDOM_MAX) to table **/
	int i; 
	for(i=0;i<TABLE_SIZE;i++)
		table[i] = random_num(RANDOM_MIN, RANDOM_MAX);
	
	printf("Initial Table: \n");
	print_table(table, TABLE_SIZE);
	
	/** Thread Creation || Split main table to multiple subtables **/
	for(i=0;i<THREADS_NUM;i++){
		params *par = (params *)malloc(sizeof(params));
		int *sub_table = table + (i * TABLE_SIZE_PER_THREAD); // sub_table points to the 0th, 100th, 200th, .. 900th element
		
		par->thread_id = i; // thread_id is used only for debugging purposes 
		par->table = sub_table;
		par->size = TABLE_SIZE_PER_THREAD;  
		
		if(pthread_create(&threads[i], NULL, thread_insertion_sort, (void *)par) != 0) die("pthread_create");
	}
	
	/** Thread Join || Waiting for every thread to finish **/
	for(i=0;i<THREADS_NUM;i++)
		if(pthread_join(threads[i], NULL) != 0) die("pthread_join");
	
	/** Merge sub_tables **/
	for(i=0;i<THREADS_NUM;i++){
		int *sub_table = table + (i * TABLE_SIZE_PER_THREAD); // sub_table points to the 0th, 100th, 200th, .. 900th element
		output_table = merge(output_table, output_size, sub_table, TABLE_SIZE_PER_THREAD);
		output_size += TABLE_SIZE_PER_THREAD; // increase output_table size for the next iteration merging.
	}
	
	printf("\nMerged Table:\n");
	printf("==================\n");
	print_table(output_table, output_size);
	return 0;
}


int random_num(int min, int max){
	return min + rand()%(max-min) + 1;
}

/*
 * Possible bug:
 *  - Due to continuous reallocations of l_table without freeing its old contents afterwards
 *    we are creating a Memory Leak. 
 */
int *merge(int *l_table, size_t l_len, int *r_table, size_t r_len){
	int *output = malloc((l_len + r_len)*sizeof(int));
	if(!output) die("malloc");
	
	size_t r_pos = 0;
	size_t l_pos = 0;
	size_t o_pos = 0;
	
	/** Merge the 2 sorted tables until one of them is empty **/
	while(r_pos < r_len && l_pos < l_len){
		if(r_table[r_pos] < l_table[l_pos])
			output[o_pos++] = r_table[r_pos++];
		else
			output[o_pos++] = l_table[l_pos++];
	}
	
	/** Then, add the rest of the elements to the output table **/
	while(r_pos < r_len)
		output[o_pos++] = r_table[r_pos++];
	while(l_pos < l_len)
		output[o_pos++] = l_table[l_pos++];
		
	return output;
}

void *thread_insertion_sort(void *arg){
	params *par;
	par = (params *)arg;
	
	if(DEBUG){
		printf("==================\nTable: ");
		print_table(par->table, par->size);
	}
	
	insertion_sort(par->table, par->size);
	
	if(DEBUG){
		printf("Sorted: ");
		print_table(par->table, par->size);
		printf("Memory Location: %p\n", par->table);
		printf("Table Size: %lu\n", par->size);
		printf("Thread ID: %d\n==================\n", par->thread_id);
	}
	
	free(arg); // Disallocate space to avoid Memory Leaks.
	
	pthread_exit(NULL);
}

void insertion_sort(int table[], size_t size){
	int i,j,tmp;
	for(i=1;i<size;i++){
		for(j=i-1;j>=0;j--){
			if(table[j]>table[j+1]){
				tmp = table[j];
				table[j] = table[j+1];
				table[j+1] = tmp;
			}
		}
	}
}

void print_table(int table[], size_t size){
	int i;
	for(i=0;i<size;i++)
		printf("%d ", table[i]);
	printf("\n");
}
