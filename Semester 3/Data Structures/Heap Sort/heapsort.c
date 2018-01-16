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

int left(int i);
int right(int i);
void max_heapify(int A[], int i, int arr_size);
void swap(int A[], int n, int m);
void build_max_heap(int A[], int arr_size);
void heapsort(int A[], int arr_size);
void print_array(int A[], int arr_size);

int main(int argc, char **argv)
{
	int arr[]={38, 5, 20, 17, 13, 2, 5, 14, 12, 6, 7, 1, 45, 53};
	int arr_size = sizeof(arr)/sizeof(arr[0]); // Find size of array. More info on: https://stackoverflow.com/questions/37538/how-do-i-determine-the-size-of-my-array-in-c
	print_array(arr, arr_size); // Print unsorted-array
	heapsort(arr, arr_size);
	print_array(arr, arr_size); // Print sorted-array
	return 0;
}

int left(int i){ return 2*(i + 1) - 1; }
int right(int i){ return 2*(i + 1); }

/*
 * 
 */
void max_heapify(int A[], int i, int arr_size){
	int l = left(i);
	int r = right(i);
	int max;
	
	// If left-'node' is in the array and bigger than our top-'node'.
	if(( l <= arr_size-1) && (A[l] > A[i]))
		max = l;
	else 
		max = i;
	
	// If right-'node' is in the array and bigger than our max-'node'.
	if(( r <= arr_size-1) && (A[r] > A[max])); 
		max = r;
	printf("HEY!");
	if(max != i){
		swap(A, i, max); // Set top-'node' as our max-'node'
		max_heapify(A, max, arr_size); // Continue max_heapify on the subtree bellow the node we exchanged
	}
}

void swap(int A[], int n, int m){
	int tmp = A[n];
	A[n] = A[m];
	A[m] = tmp;
}

/*
 * Convert any array to a max-heap
 */
void build_max_heap(int A[], int arr_size){
	int i;
	for(i=(arr_size/2)-1; i>=0; i--)
		max_heapify(A, i, arr_size);
}

/*
 * Sort the array using the max-heap's properties.
 * This will create an ascending order array.
 */
void heapsort(int A[], int arr_size){
	build_max_heap(A, arr_size);
	int i;
	for(i = arr_size-1; i > 0; i--){
		swap(A, 0, i); // Place the A[0] to the last place of our table, thus creating an ascending order array.
		max_heapify(A, 0, i); // max-heapify the reset of the table to maintain the max-heap's properties
	}
}

void print_array(int A[], int arr_size){
	int i;
	for(i=0; i<arr_size; i++) 
		printf("%d ", A[i]);
	printf("\n");
}
