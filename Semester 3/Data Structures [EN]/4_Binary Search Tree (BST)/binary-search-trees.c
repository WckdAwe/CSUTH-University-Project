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

typedef struct Node{
	int key;
	struct Node *left;
	struct Node *right;
}Node;

void preorder(Node *root);
void inorder(Node *root);
void postorder(Node *root);
Node* new_node(int value);
Node* insert(Node *root, int key);
Node* min_node(Node *root);
Node* max_node(Node *root);
Node* delete(Node *root, int key);
Node* search(Node *root, int key);
void cst_cleantree(Node *root);
Node* cst_createtree();

int main(void){
	Node *root = cst_createtree();
 	
 	/** TEST INORDER **/
    printf("Inorder traversal of the given tree \n");
    inorder(root);
 
	printf("\nDelete 20\n");
    root = delete(root, 20);
    printf("Inorder traversal of the modified tree \n");
    inorder(root);
 
    printf("\nDelete 30\n");
    root = delete(root, 30);
    printf("Inorder traversal of the modified tree \n");
    inorder(root);
 
    printf("\nDelete 50\n");
    root = delete(root, 50);
    printf("Inorder traversal of the modified tree \n");
    inorder(root);
    
    printf("==================\n\n\n");
    cst_cleantree(root);
	root = cst_createtree();
	
	
 	/** TEST PREORDER **/
    printf("Preorder traversal of the given tree \n");
    preorder(root);
 
	printf("\nDelete 20\n");
    root = delete(root, 20);
    printf("Preorder traversal of the modified tree \n");
    preorder(root);
 
    printf("\nDelete 30\n");
    root = delete(root, 30);
    printf("Preorder traversal of the modified tree \n");
    preorder(root);
 
    printf("\nDelete 50\n");
    root = delete(root, 50);
    printf("Preorder traversal of the modified tree \n");
    preorder(root);
    
    printf("==================\n\n\n");
    cst_cleantree(root);
    root = cst_createtree();
    
    
 	/** TEST POSTORDER **/
    printf("Postorder traversal of the given tree \n");
    postorder(root);
 
	printf("\nDelete 20\n");
    root = delete(root, 20);
    printf("Postorder traversal of the modified tree \n");
    postorder(root);
 
    printf("\nDelete 30\n");
    root = delete(root, 30);
    printf("Postorder traversal of the modified tree \n");
    postorder(root);
 
    printf("\nDelete 50\n");
    root = delete(root, 50);
    printf("Postorder traversal of the modified tree \n");
    postorder(root);
    
    printf("==================\n\n\n");
  
  	//Remaining: 40,60,70,80 . Perform Search
  	printf("Is %d on the tree? : %s\n", 40, (search(root, 40) ? "YES!" : "NO!"));
  	printf("Is %d on the tree? : %s\n", 30, (search(root, 30) ? "YES!" : "NO!"));
  	printf("Is %d on the tree? : %s\n", 35, (search(root, 35) ? "YES!" : "NO!"));
  	printf("Is %d on the tree? : %s\n", 60, (search(root, 60) ? "YES!" : "NO!"));
  	printf("Is %d on the tree? : %s\n", 65, (search(root, 65) ? "YES!" : "NO!"));
  	printf("Is %d on the tree? : %s\n", 70, (search(root, 70) ? "YES!" : "NO!"));
  	printf("Is %d on the tree? : %s\n", 80, (search(root, 80) ? "YES!" : "NO!"));
  	printf("Is %d on the tree? : %s\n", 93, (search(root, 93) ? "YES!" : "NO!"));
	return 0;
}

/* cst_<function>
 * The functions that have prefix cst_ are created to do some test in the main and keep the code cleaner.
 * These functions are not required, and shouldn't be implemented at the final binary-search-tree.
 */
void cst_cleantree(Node *root){
	if(root){
		cst_cleantree(root->left);
		cst_cleantree(root->right);
		free(root);
	}
}

Node* cst_createtree(){
	Node *tree = NULL;
	tree = insert(tree, 50);
    tree = insert(tree, 30);
    tree = insert(tree, 20);
    tree = insert(tree, 40);
    tree = insert(tree, 70);
    tree = insert(tree, 60);
    tree = insert(tree, 80);
    return tree;
}
void preorder(Node *root){
	if(root){
		printf("%d ",  root->key);
		preorder(root->left);
		preorder(root->right);
	}
}

void inorder(Node *root){
	if(root){
		inorder(root->left);
		printf("%d ",  root->key);
		inorder(root->right);
	}
}

void postorder(Node *root){
	if(root){
		postorder(root->left);
		postorder(root->right);
		printf("%d ",  root->key);
	}
}

Node* new_node(int value){ 
	Node *node = (Node*) malloc(sizeof(Node));
	node->key = value;
	node->left = node->right = NULL;
	return node;
}

Node* insert(Node *root, int key){
	if(!root) return new_node(key);
	
	if(key < root->key) root->left = insert(root->left, key);
	else root->right = insert(root->right, key);
	
	return root;
}

Node* min_node(Node *root){
	if(!root) return NULL;
	Node *tmp = root;
	while(tmp->left != NULL) tmp = tmp->left;
	return tmp;
}

Node* max_node(Node *root){
	if(!root) return NULL;
	Node *tmp = root;
	while(tmp->right != NULL) tmp = tmp->right;
	return tmp;
}

Node* delete(Node *root, int key){
	if(!root) return NULL;
	
	if(key < root->key) root->left = delete(root->left, key);
	else if (key > root->key) root->right = delete(root->right, key);
	else{
		Node *tmp;
		//One-Child Deletion
		if(root->left == NULL){ // If left is null, connect (return) the right side
			tmp = root->right;
			free(root);
			return tmp;
		}else if(root->right == NULL){ // If right is null, connect (return) the left side
			tmp = root->left;
			free(root);
			return tmp;
		}
		
		//Two-Children Deletion
		tmp = min_node(root->right);
		root->key = tmp->key;
		root->right = delete(root->right, tmp->key);
	}
	
	return root;
}

Node* search(Node *root, int key){
	if(!root) return NULL;
	
	if(key < root->key) search(root->left, key);
	else if(key > root->key) search(root->right, key);
	else return root;
}
