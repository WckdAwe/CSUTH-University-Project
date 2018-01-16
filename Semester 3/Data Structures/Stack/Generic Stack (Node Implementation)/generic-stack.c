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
 * In this excercise we change the Node's saved date from int to void*.
 * This way we can save inside our node whatever we want!
 */ 

#include <stdio.h>
#include <stdlib.h>

typedef struct Node
{
	void *value;
	struct Node *next;
} Node;

typedef struct Stack
{
	Node *top;
	int size;
} Stack;

Node* create_node(void *value);
void init_stack(Stack *stack);
int is_empty(Stack *stack);
int size(Stack *stack);
int push(Stack *stack, void *value);
void* pop(Stack *stack);
void* peek(Stack *stack);
void print_stack(Stack *stack);

int main(void){
    
    Stack stack;
	init_stack(&stack);	
	
	print_stack(&stack);
	push(&stack, "Hello");
	push(&stack, "M8!");
	push(&stack, "Whattup!");
	push(&stack, "Text.. that's weird for a node'");
	print_stack(&stack);
	printf("Peek = %s\n", (char *)peek(&stack)); //Remember to change your casts depending on what you save in the Node!
	print_stack(&stack);
	printf("Pop = %s\n", (char *)pop(&stack));
	print_stack(&stack);
	printf("Size: %d\n", size(&stack));
	printf("Is empty: %s\n", is_empty(&stack) ? "Yes" : "No"); // Don't know what is "?:" || condition ? value_if_true : value_if_false
    return 0;
}

Node* create_node(void *value){
	Node *node = (Node *)malloc(sizeof(Node));
	node->value = value;
	node->next = NULL;
	return node;	
}

void init_stack(Stack *stack)
{
    stack->top = NULL;  
	stack->size = 0;   
}

int is_empty(Stack *stack){ return stack->size == 0; }
int size(Stack *stack){ return stack->size; } 

int push(Stack *stack, void *value)
{
    Node *new_node = create_node(value);
    if(!new_node) return -1; // Memory allocation failed! 
    if(!is_empty(stack))
       new_node->next = stack->top; // Stack is not empty. We move the "old" top to new_node->next and place the new_node on top!
    stack->top = new_node;
    stack->size++;
}

void* pop(Stack *stack)
{
	if(is_empty(stack)) return NULL; 
    void* result = (stack->top)->value; // Save result
    Node *tmp = stack->top;
    stack->top = (stack->top)->next; // Set next node as the new top
    stack->size--;
	free(tmp); // Deallocate memory
    return result;
}

void* peek(Stack *stack)
{
    return !(is_empty(stack)) ? (stack->top)->value : NULL;
}

void print_stack(Stack *stack)
{
	if(is_empty(stack)){
		printf("Stack is empty\n");
	}else{
		Node *node = stack->top;
		printf("========\n");
		while(node != NULL){
			printf("%s\n", (char *)node->value); // CHANGE THIS ACCORDINGLY (Depending on what you save in the Node!)
			node = node->next;
		}
		printf("========\n");
	}
}

