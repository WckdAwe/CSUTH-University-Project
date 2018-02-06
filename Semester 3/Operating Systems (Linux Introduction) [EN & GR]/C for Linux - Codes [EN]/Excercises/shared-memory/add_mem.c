#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/shm.h>
#include <sys/stat.h>

#define SIZE 10 

int main(int argc, char **argv)
{
	int seg_id = strtol(argv[1], NULL, 10);
	int nums = strtol(argv[2], NULL, 10);
	int *sm = (int *)shmat(seg_id, NULL, 0);
	int i, sum=0;
	for(i=0;i<nums;i++){
		printf("%d", sm[i]);
		if(i != nums-1) printf(" + ");
		sum += sm[i];
	}
	printf(" = %d (Using mem)\n", sum); 
	return 0;
}

