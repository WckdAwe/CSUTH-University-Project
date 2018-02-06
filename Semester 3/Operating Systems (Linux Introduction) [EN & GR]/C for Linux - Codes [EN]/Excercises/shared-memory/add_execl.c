#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/shm.h>
#include <sys/stat.h>

int main(int argc, char **argv)
{
	int x1 = strtol(argv[1], NULL, 10);
	int x2 = strtol(argv[2], NULL, 10);
	printf("%d + %d = %d (Using Args)\n", x1, x2, x1+x2);
	return 0;
}

