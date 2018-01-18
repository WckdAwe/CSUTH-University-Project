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

#define M 10

typedef struct Node{
	int value;
	struct Node* next;
}Node;

typedef struct NodeList{
	Node* first;
	Node* last;
	int size;
}NodeList;

typedef struct HashList{
	NodeList* list;
}HashList;


Node* create_node(int value);
void init_list(NodeList *list);
void insert_to_list(NodeList *list, int value);
void print_list(NodeList *list);
int search_list(NodeList *list, int key);
Node* search_list_node(NodeList *list, int key);
void delete_from_list(NodeList *list, int key);
void init_hashlist(HashList *hashlist);
void insert_to_hashlist(HashList *hashlist, int key);
void delete_from_hashlist(HashList *hashlist, int key);
int search_in_hashlist(HashList *hashlist, int key);
void print_hashlist(HashList *hashlist);

int main(void){
	HashList hashlist;
    init_hashlist(&hashlist);
    
    
    insert_to_hashlist(&hashlist, 1);
    insert_to_hashlist(&hashlist, 2);
    insert_to_hashlist(&hashlist, 3);
    insert_to_hashlist(&hashlist, 4);
    insert_to_hashlist(&hashlist, 7);
    insert_to_hashlist(&hashlist, 8);
    insert_to_hashlist(&hashlist, 9);
    insert_to_hashlist(&hashlist, 5);
    insert_to_hashlist(&hashlist, 6);
    insert_to_hashlist(&hashlist, 13);
    insert_to_hashlist(&hashlist, 22);
    insert_to_hashlist(&hashlist, 23);
    insert_to_hashlist(&hashlist, 33);
    insert_to_hashlist(&hashlist, 53);
    insert_to_hashlist(&hashlist, 32);

    print_hashlist(&hashlist);
    
    printf("---------------\n");
    
    delete_from_hashlist(&hashlist, 22);
    delete_from_hashlist(&hashlist, 23);
    delete_from_hashlist(&hashlist, 53);
    
    print_hashlist(&hashlist);
}

/*
 * Node Functions
 */
Node* create_node(int value){
	Node *node = (Node*) malloc(sizeof(Node));
	node->value = value;
	node->next = NULL;
	return node;
}

/*
 * NodeList Functions
 */
void init_list(NodeList *list)
{
	list->first = list->last = NULL;
	list->size = 0;
}

void insert_to_list(NodeList *list, int value)
{
	if(list->size == 0){
		list->first = create_node(value);
	 	list->last = list->first;
    }else{
		(list->last)->next = create_node(value);
		list->last = (list->last)->next;
	}
	list->size++;
}

void print_list(NodeList *list)
{
	Node *node = list->first;
	printf("List: ");
	if (list->size) printf("First:%d Last:%d\t", (list->first)->value, (list->last)->value);
	while (node != NULL){
		printf("%d\t", node->value);
		node = node->next;
	}
	printf("\n");
}

int search_list(NodeList *list, int key)
{
	return search_list(list, key) ? 1 : 0; // Don't know what is "?:" || condition ? value_if_true : value_if_false
}

Node* search_list_node(NodeList *list, int key)
{
	Node* node = list->first;
	while (node != NULL){
		if(node->value == key) return node;
		node = node->next;
	}
	return NULL;
}

void delete_from_list(NodeList *list, int key){
	Node *node_prev = NULL;
	Node *node = list->first;
	while(node != NULL){
		if(node->value == key){
			if(list->size == 1) // Delete only node (Only 1 node exists)
				list->first = list->last = NULL;
			else if (list->size >= 1 && (node == list->first)) // Delete first node (More than 1 node exist)
				list->first = (list->first)->next;
			else if (node != list->last) // Delete middle node (Our node is neither first nor last!)
				node_prev->next = node->next;
			else{ // Delete last node
				list->last = node_prev;
				node_prev->next = NULL;
			}
			(list->size)--;
			free(node);
			break;
		}
		
		node_prev = node;
		node = node->next;
	}
}

/*
 * HashList
 */
void init_hashlist(HashList *hashlist){
	int i;
	hashlist->list = (NodeList*) malloc(M*sizeof(NodeList));
	for (i=0; i<M; i++)
		init_list(&(hashlist->list[i]));
}

void insert_to_hashlist(HashList *hashlist, int key){
	insert_to_list(&(hashlist->list[key%M]), key);
}

void delete_from_hashlist(HashList *hashlist, int key){
	delete_from_list(&(hashlist->list[key%M]), key);
} 

int search_in_hashlist(HashList *hashlist, int key){
	return search_list(&(hashlist->list[key%M]), key);
}

void print_hashlist(HashList *hashlist){
	int i;
	for(i=0; i<M; i++){
		printf("Pos %d \n",i);
		print_list(&(hashlist->list[i]));
		printf("---------\n");
	}
}


