#include <stdio.h>

int main(){
    int spam[] = {11, 3, 7};
    printf("spam[0] starts at %p\n", &(spam[0]));
    size_t elem_size = sizeof(spam[0]);
    printf("elem_size %ld\n", elem_size);
    void *generic_pointer = &(spam);
    char *gp = (char *) generic_pointer;
    printf("========POINTER ADDRESSES=======\n");
    printf("%p\n", gp);
    printf("%p\n", gp + 1);
    printf("%p\n", gp + 2);
    printf("gp starts at %p\n", gp);
    printf("%d\n", (int) *(gp));
    printf("%d\n", (int) *(gp + elem_size));
    printf("%d\n", (int) *(gp + (2 * elem_size)));
}