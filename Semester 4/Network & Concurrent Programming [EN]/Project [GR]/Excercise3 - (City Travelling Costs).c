#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <pthread.h>
#include <string.h>
#include <semaphore.h>
#include <math.h>


#define CITIES 10
#define REPEATS 10 // How many times consumers will repeat the process?
#define RANDOM_MIN 10
#define RANDOM_MAX 99
#define READABILITY_WAIT 0

typedef struct params{
	int thread_id;
}params;

int random_num(int min, int max);
void print_table(size_t height, size_t width, int table[height][width]);
void *thread_producer(void *arg);
void *thread_consumer(void *arg);

pthread_mutex_t work_mutex;

int distance[CITIES][CITIES], // Using GLOBAL tables only to make it more readable.
	gas_price[CITIES][CITIES];

int cons_repeats[CITIES]; // 'Dirty way' to synchronize producers & consumers 

void die(char *errno){
	perror(errno);
	exit(EXIT_FAILURE);
}

int main(int argc, char **argv)
{
	srand(time(NULL)); // Assign a seed based on time to create random values later.
	
	size_t i,j;
	pthread_t consumers[CITIES];
	pthread_t producers[CITIES];
		
	if(pthread_mutex_init(&work_mutex, NULL) != 0) die("pthread_mutex_init");
	pthread_mutex_lock(&work_mutex); // Lock mutex until all threads have been created.
	
	/** Fill distance table **/
	for(i=0;i<CITIES;i++)
		for(j=0;j<i;j++)
			distance[i][j] = distance[j][i] = ( i != j ? random_num(10, 99) : 0); 
		
	
	printf("City Distances: \n");
	printf("===================================\n");
	print_table(CITIES, CITIES, distance);
	printf("\n\nGas Prices: \n");
	printf("====================\n");
	print_table(CITIES, CITIES, gas_price);
	printf("\n");
	
	sleep(READABILITY_WAIT); // Sleep to give some time for the user to read the random values.
	
	/** Create Producer & Consumer Threads **/
	for(i=0;i<CITIES;i++){
		params *par = malloc(sizeof(params));
		par->thread_id = i;
		
		cons_repeats[i] = REPEATS; // Initialize 'Pseudo-Sync between Producer/Consumer' 
		
		pthread_create(&producers[i], NULL, thread_producer, (void *)par);
		pthread_create(&consumers[i], NULL, thread_consumer, (void *)par);
	
	}
	
	pthread_mutex_unlock(&work_mutex); // Unlock mutex since all threads have been created.
	
	
	for(i=0;i<CITIES;i++){
		pthread_join(producers[i], NULL);
		printf("Producer %lu joined.\n", i);
		
		pthread_join(consumers[i], NULL);
		printf("Consumer %lu joined.\n", i);
	}
	
	return 0;
}


int random_num(int min, int max){
	return min + rand()%(max-min) + 1;
}

void print_table(size_t height, size_t width, int table[height][width]){
	size_t i,j;
	for(i=0;i<height;i++){
		for(j=0;j<width;j++){
			printf("%d ", table[i][j]);
		}
		printf("\n");
	}
	printf("\n");
}

void *thread_producer(void *arg){
	params *par = (params*) arg;
	int city = par->thread_id;
	int reps_left = REPEATS; 
	int old_price = 0;
	
	do{
		pthread_mutex_lock(&work_mutex);
		
		/** 
		 *  Use the pseudo-synchronization to make sure that
		 *  the producer doesn't change the price more than
		 *  one time without the consumer updating his results.
		 *  This way we can make sure that if we change the price
		 *  N times, it will also be updated N times.
		 **/
		if(cons_repeats[city] > reps_left){
			pthread_mutex_unlock(&work_mutex);
			continue;
		}
		
		/** Generate a new price (different than the old) **/
		int new_price;
		do{
			new_price = random_num(1, 10);	
		}while(new_price == old_price);
		old_price = new_price;
		reps_left--;
		
		printf("======[PRODUCER]======\n");
		printf("City ID: %d\n", city);
		printf("Repeats left: %d\n", reps_left);
		printf("Gas price changed from %d to: %d\n", gas_price[city][city], new_price);
		printf("======================\n");
		
		gas_price[city][city] = new_price;
		
		sleep(READABILITY_WAIT); // Sleep to give some time for the user to read the random values.
		
		pthread_mutex_unlock(&work_mutex);
		
	}while(reps_left>0);
	pthread_exit(NULL);
}

void *thread_consumer(void *arg){
	params *par = (params*) arg;
	int city = par->thread_id;
	int old_price = 0;
	
	do{
		pthread_mutex_lock(&work_mutex);
		
		int i;
		int g_price = gas_price[city][city];
		
		if(g_price == 0){
			printf("======[CONSUMER]======\n");
			printf("City %d skipped (Gas price not set yet)\n", city);
			printf("======================\n");
			pthread_mutex_unlock(&work_mutex);
			sleep(1); // Sleep to allow another thread to take over.
			continue;
		}
		
		if(g_price == old_price){
			printf("======[CONSUMER]======\n");
			printf("City %d skipped (Gas price hasn't changed yet)\n", city);
			printf("%d\n", cons_repeats[city]);
			printf("======================\n");
			pthread_mutex_unlock(&work_mutex);
			sleep(1); // Sleep to allow another thread to take over.
			continue;
		}
		
		
		old_price = g_price; // Update old_price for next iteration.
		cons_repeats[city]--;
		
		float avg = 0.0f, var = 0.0f;
		int max = 0;
		int max_id;
		
		printf("======[CONSUMER]======\n");
		printf("City ID: %d\n", city);
		printf("Repeats left: %d\n", cons_repeats[city]);
		printf("Gas Prices: ");
		for(i=0;i<CITIES;i++){
			if(i != city) {
				gas_price[city][i] = g_price * distance[city][i]; // Calculate gas_prices (City Gas price * distance to City X)
				avg += gas_price[city][i];
				
				if(gas_price[city][i] > max){ // Find maximum gas_price to a city
					max = gas_price[city][i];
					max_id = i;
				}
			}
			printf("%d ", gas_price[city][i]); 
		}
		printf("\n");


		avg /= CITIES;
		
		/** Calculate Var **/
		for(i=0;i<CITIES;i++)
			var += pow((gas_price[city][i] - avg), 2);
		var /= CITIES;
		
		printf("Var: %.2f\n", var);
		printf("Avg: %.2f\n", avg);
		printf("Max Travel Cost: %d (From %d To %d)\n", max, city, max_id);
		printf("======================\n");
		
		sleep(READABILITY_WAIT); // Sleep to give some time for the user to read the random values.
		
		pthread_mutex_unlock(&work_mutex);
	}while(cons_repeats[city] > 0);
	pthread_exit(NULL);
}
