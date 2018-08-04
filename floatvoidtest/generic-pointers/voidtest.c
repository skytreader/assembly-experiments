#include <stdio.h>

int main(){
    float spam[] = {11.0f, 3.0f, 7.0f};
    int elemsize = sizeof(spam[0]);
    printf("elemsize is %d\n", elemsize);
    printf("elemsize of int %d\n", (int) sizeof(1));
    void *generic_pointer = &(spam);
    float *bp = (float *) generic_pointer;
    printf("%f\n", spam[0]);
    printf("%f\n", spam[1]);
    printf("%f\n", spam[2]);
    printf("%p\n", &(spam[0]));
    printf("%p\n", &(spam[1]));
    printf("special: %f\n", (float) *(&(spam[1])));
    printf("%p\n", &(spam[2]));
    printf("%p\n", bp);
    printf("%p %p\n", bp + elemsize, bp + 1);
    printf("%p\n", bp + (2 * elemsize));
    printf("%f\n", (float) *(bp));
    printf("%f\n", (float) *(bp + elemsize));
    printf("%f\n", (float) *(bp + (2 * elemsize)));
    return 0;
}