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
#define SIZE 10

typedef struct cqueue{
	int front, rear;
	int arr[SIZE];
}cqueue_t;


void init_cqueue(cqueue_t *cq);
int is_full(cqueue_t *cq);
int is_empty(cqueue_t *cq);
int first(cqueue_t *cq);
int last(cqueue_t *cq);
int enqueue(cqueue_t *cq, int value);
int dequeue(cqueue_t *cq);
int size(cqueue_t *cq);
void print_cqueue(cqueue_t *cq);


int main(){
	cqueue_t cq;
	init_cqueue(&cq);
	print_cqueue(&cq);
	enqueue(&cq, 12);
	enqueue(&cq, 6);
	enqueue(&cq, 3);
	enqueue(&cq, 15);
	enqueue(&cq, 2);
	enqueue(&cq, 9);
	enqueue(&cq, 8);
	enqueue(&cq, 7);
	print_cqueue(&cq);
	dequeue(&cq);
	dequeue(&cq);
	print_cqueue(&cq);
	enqueue(&cq, 17);
	enqueue(&cq, 37);
	enqueue(&cq, 27);
	enqueue(&cq, 57);
	enqueue(&cq, 67);
	enqueue(&cq, 77);
	enqueue(&cq, 22);
	enqueue(&cq, 13);
	enqueue(&cq, 5);
	print_cqueue(&cq);
	printf("Size: %d\n", size(&cq));
	printf("Is full: %s\n", is_full(&cq) ? "Yes" : "No");
	printf("Is empty: %s\n", is_empty(&cq) ? "Yes" : "No");
}

void init_cqueue(cqueue_t *cq)
{ 
	cq->front = cq->rear = -1; 
}

int is_full(cqueue_t *cq) 
{ 
	//Case 1: rear is exactly behind front. Case 2: front is 0 and rear rixed maxed size (similar to normal queue) 
	return (cq->rear == cq->front-1) || (cq->front == 0 && cq->rear == SIZE-1); 
}

int is_empty(cqueue_t *cq) 
{ 
	return cq->front == -1; 
}

int first(cqueue_t *cq){
	if(is_empty(cq)) return -1;
	return cq->arr[cq->front];
}

int last(cqueue_t *cq){
	if(is_empty(cq)) return -1;
	return cq->arr[cq->rear];
}

int enqueue(cqueue_t *cq, int value){
	if(is_full(cq)) return -1;
	
	if(is_empty(cq)) // CQueue is empty
		cq->arr[cq->front = cq->rear = 0] = value; // Set front & rear to 0
	else if(cq->rear == SIZE-1 && cq->front != 0) // Rear reached the end of the table. We need to set it to 0.
		cq->arr[cq->rear = 0] = value; // Set rear to 0
	else // Otherwise, just increase rear and add the new value.
		cq->arr[++(cq->rear)] = value;
	
	return 1;
}
int dequeue(cqueue_t *cq){
	if(is_empty(cq)) return -1;
	int data = cq->arr[cq->front];

	if (size(cq) == 1) // When there is only 1 element in the CQueue, delete it & reset it. Other way to check for this is: queue->front == queue->rear
		cq->front = cq->rear = -1;
	else if(cq->front == SIZE-1) // When front reaches the end of the table, set it to 0.
		cq->front = 0;
	else // Otherwise, just increase front.
		(cq->front)++;
		
	return data;
}
int size(cqueue_t *cq){
	if(cq->rear >= cq->front){ // Normal Case ('rear' is behind 'front')
		return cq->rear - cq->front + 1; 
	}else{ // Circular Case ('rear' is in front of 'front')
		return SIZE + cq->rear - cq->front; 
	}
}

void print_cqueue(cqueue_t *cq){
	int i;
	if(is_empty(cq)){ 
		printf("The circular queue is empty\n");
	}else if(cq->front <= cq->rear){
		for(i=cq->front; i<cq->rear; i++) printf("CQueue[%d] = %d\n", i, cq->arr[i]);
	}else{
		for(i=cq->front;i<=SIZE-1; i++) printf("CQueue[%d] = %d\n", i, cq->arr[i]);
		for(i=0;i<=cq->rear;i++) printf("CQueue[%d] = %d\n", i, cq->arr[i]);
	}
	printf("================\n");
}
