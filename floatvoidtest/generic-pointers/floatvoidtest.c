#include <stdio.h>

int main(){
    float spam[] = {2.0f, 4.0f, 6.f};
    printf("sizeof char %ld\n", sizeof(char));
    printf("spam[0] starts at %p\n", &(spam[0]));
    size_t elemsize = sizeof(spam[0]);
    printf("elem_size %ld\n", elemsize);
    void *generic_pointer = &(spam);
    char *gp = (char *) generic_pointer;
    printf("========gp POINTER ADDRESSES=======\n");
    printf("%p\n", gp);
    printf("%p\n", gp + elemsize);
    printf("%p\n", gp + (2 * elemsize));
    printf("gp starts at %p\n", gp);
    float *fp = (float *) generic_pointer;
    printf("========fp POINTER ADDRESSES=======\n");
    printf("%p\n", fp);
    printf("%p\n", fp + 1);
    printf("%p\n", fp + 2);
    printf("fp starts at %p\n", fp);
    printf("%f\n", (float) *(gp));
    printf("%f\n", (float) *(gp + elemsize));
    printf("%f\n", (float) *(gp + (2 * elemsize)));
    printf("%f\n", (float) *(fp));
    printf("%f\n", (float) *(fp + 1));
    printf("%f\n", (float) *(fp + 2));
}