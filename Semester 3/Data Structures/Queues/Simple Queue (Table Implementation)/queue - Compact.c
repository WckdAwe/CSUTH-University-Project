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
 
 /* DESCRIPTION:
 *   Exactly the same code as queue.c, but compacted to a smaller code.
 *   This is made so you can train on different coding styles.
 */ 
#include <stdio.h>

#define SIZE 10

typedef struct queue{
	int front, rear;
	int arr[SIZE];
}queue_t;

void init_queue(queue_t *queue);
int is_full(queue_t *queue);
int is_empty(queue_t *queue); 
int size(queue_t *queue);
int first(queue_t *queue);
int last(queue_t *queue);
void print_queue(queue_t *queue);
int enqueue(queue_t *queue, int value);
int dequeue(queue_t *queue);

int main(){
	queue_t queue;
	init_queue(&queue); 
	print_queue(&queue);
	enqueue(&queue, 5);
	enqueue(&queue, 2);
	enqueue(&queue, 17);
	print_queue(&queue);
	dequeue(&queue);
	print_queue(&queue);
	printf("Size: %d\n", size(&queue));
	printf("Is full: %s\n", is_full(&queue) ? "Yes" : "No");
	printf("Is empty: %s\n", is_empty(&queue) ? "Yes" : "No");
	return 0;
}

void init_queue(queue_t *queue){ queue->front = queue->rear = -1; }
int is_full(queue_t *queue){ return queue->rear == SIZE-1; }
int is_empty(queue_t *queue){ return queue->front == queue->rear; } 
int size(queue_t *queue){ return queue->rear - queue->front; }
int first(queue_t *queue){ 
	return (!is_empty(queue)) ? queue->arr[queue->front + 1] : -1; // Don't know what is "?:" || condition ? value_if_true : value_if_false
}
int last(queue_t *queue){
	return (!is_empty(queue)) ? queue->arr[queue->rear + 1] : -1; // Don't know what is "?:" || condition ? value_if_true : value_if_false
}
void print_queue(queue_t *queue){
	int i;
	if(!is_empty(queue)) for(i=queue->front+1;i<=queue->rear;i++) printf("Queue[%d] = %d\n", i, queue->arr[i]);
	else printf("Queue is empty!\n");
}
int enqueue(queue_t *queue, int value){
	return is_full(queue) ? -1 : (queue->arr[++(queue->rear)] = value);
}
int dequeue(queue_t *queue){
	return is_empty(queue) ? -1 : queue->arr[++(queue->front)];	
}
