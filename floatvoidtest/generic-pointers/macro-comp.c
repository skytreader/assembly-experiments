#include <stdio.h>

#define ptrind(bp, item_size, index) bp + item_size * index

void foo(void *arr, size_t item_size){
    printf("The array starts at %p.\n", &arr);
    printf("Address of index 1: %p.\n", (&arr) + item_size * 1); 
    printf("(macro) address of index 1: %p.\n", ptrind(&arr, item_size, 1));
}

int main(){
    int bar[] = {3, 1, 4, 1};
    foo(&bar, sizeof(int));
}
