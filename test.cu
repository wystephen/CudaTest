//
// Created by steve on 17-3-9.
//

#include <iostream>
//#include "stdio.h"
//#include "cuda_runtime.h"
#include "/usr/include/cuda_runtime.h"
#include "../../../../usr/include/host_defines.h"
//#include "../../../../usr/include///cuda_runtime_api.h"
//#include "../../../../usr/include/c++/6/cstdio"

__global__ void test_add(int * a , int * b,int *c)
{
    int ii= threadIdx.x;
    c[ii] = a[ii]+b[ii];
    return;
}

int main()
{
    int **t;
    cudaMalloc((void**)(&t),100*sizeof(int*));
//    printf("in the function");
    std::cout << "in function " << std::endl;
    int a[10],b[10],c[10];
    for(int i(0);i<10;++i)
    {
        a[i] = i*2;
        b[i]=i*10;
        std::cout << "a,b:"<<a[i]<<"  "<<b[i]<<std::endl;
    }
    int *da,*db,*dc;
    cudaMalloc((void**)&da,10*sizeof(int*));
    cudaMalloc((void**)&db,10*sizeof(int*));
    cudaMalloc((void**)&dc,10*sizeof(int*));
    cudaMemcpy(da,a,10*sizeof(int),cudaMemcpyHostToDevice);
    cudaMemcpy(db,b,10*sizeof(int),cudaMemcpyHostToDevice);

    test_add<<<1,10>>>(da,db,dc);
    cudaMemcpy(c,dc,10*sizeof(int),cudaMemcpyDeviceToHost);
    for(int i(0);i<10;++i)
    {
        std::cout << "c:"<<i<<":"<<c[i]<<std::endl;
    };




    return 0;
}