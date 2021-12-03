#include<stdio.h>

int main (){
	char stringa[] = "Dylan Dog";
	printf(stringa);
	printf("\n");
	int x = 42;
	int* p = &x;
	int* q = p;
	int y = *q;
	printf(p);
}
