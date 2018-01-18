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

typedef struct Node
{
	int key;
	struct Node *next;
} Node;

typedef struct Queue
{
	int size;
	Node *front;
	Node *rear;
} Queue;

Node* create_node(int value);
void init_queue(Queue *queue);
int is_empty(Queue *queue);
int first(Queue *queue);
int last(Queue *queue);
void print_queue(Queue *queue);
int size(Queue *queue);
void enqueue(Queue *queue, int value);
int dequeue(Queue *queue);

int main(void)
{
	Queue queue;
	init_queue(&queue); 
	print_queue(&queue);
	enqueue(&queue, 5);
	enqueue(&queue, 2);
	enqueue(&queue, 17);
	print_queue(&queue);
	dequeue(&queue);
	print_queue(&queue);
	printf("Size: %d\n", size(&queue));
	printf("Is empty: %s\n", is_empty(&queue) ? "Yes" : "No");
	return 0;
}

Node* create_node(int value){
	Node *node = (Node *)malloc(sizeof(Node));
	node->key = value;
	node->next = NULL;
	return node;	
}

void init_queue(Queue *queue)
{
    queue->size = 0;
    queue->front = queue->rear = NULL; 
}

int is_empty(Queue *queue)
{
	return queue->size == 0;
}

int first(Queue *queue)
{
    if (is_empty(queue)) return -1;
    return (queue->front)->key;
}

int last(Queue *queue)
{
    if (is_empty(queue)) return -1;
	return (queue->rear)->key;
}

void print_queue(Queue *queue)
{
	if(!is_empty(queue)) {
		Node *node = queue->front;
		int i=0;
		while(node != NULL){
			printf("Queue[%d] = %d\n", i, node->key);
			node = node->next;
			i++;
		} 
	}else{
		printf("Queue is empty!\n");
	} 
}

int size(Queue *queue)
{
	return queue->size;
}

void enqueue(Queue *queue, int value)
{
	Node *new_node = create_node(value);
    
    if (is_empty(queue)){
       queue->front = queue->rear = new_node;
    }else{
		(queue->rear)->next = new_node;
        queue->rear = new_node;
    }
    queue->size++;
}

int dequeue(Queue *queue)
{
	int result;
    struct Node *tmp;
    if(is_empty(queue)) return -1;
	result = (queue->front)->key;
	tmp = queue->front;
	queue->front = (queue->front)->next;
	if (queue->size == 1)
		queue->front = queue->rear = NULL; // Empty queue
	queue->size--;
	free(tmp);
	return result;
}
