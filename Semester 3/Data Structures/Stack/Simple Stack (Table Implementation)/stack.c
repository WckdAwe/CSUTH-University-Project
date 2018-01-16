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

typedef struct stack{
	int top;
	int arr[SIZE];
}stack_t;

void init_stack(stack_t *stack);
int is_full(stack_t *stack);
int is_empty(stack_t *stack);
int size(stack_t *stack);
int peek(stack_t *stack);
int pop(stack_t *stack);
int push(stack_t *stack, int value);
void print_stack(stack_t *stack);

int main(){
	stack_t stack;
	init_stack(&stack);	
	
	print_stack(&stack);
	push(&stack, 3);
	push(&stack, 4);
	push(&stack, 2);
	push(&stack, 7);
	print_stack(&stack);
	printf("Peek = %d\n", peek(&stack));
	print_stack(&stack);
	printf("Pop = %d\n", pop(&stack));
	print_stack(&stack);
	printf("Size: %d\n", size(&stack));
	printf("Is full: %s\n", is_full(&stack) ? "Yes" : "No"); // Don't know what is "?:" || condition ? value_if_true : value_if_false
	printf("Is empty: %s\n", is_empty(&stack) ? "Yes" : "No");
	
	return 0;
}

void init_stack(stack_t *stack)
{ 
	stack->top = -1; 
}

int is_full(stack_t *stack)
{ 
	return stack->top == SIZE-1; 
}

int is_empty(stack_t *stack)
{ 
	return stack->top == -1; 
}

int size(stack_t *stack)
{ 
	return stack->top + 1; 
} 

int peek(stack_t *stack)
{ 
	if(is_empty(stack)) return -1;
	return stack->arr[stack->top];
}

int pop(stack_t *stack)
{
	if(is_empty(stack)) return -1;
	return stack->arr[--(stack->top) + 1];
}

int push(stack_t *stack, int value){
	if(is_full(stack)) 
		return -1;
	stack->arr[++(stack->top)] = value;
	return 1;
}

void print_stack(stack_t *stack){
	if(is_empty(stack)){
		printf("Stack is empty\n");
	}else{
		int i;
		printf("========\n");
		for(i=stack->top;i>=0;i--) 
			printf("%d\n", stack->arr[i]);
		printf("========\n");
	}
}
