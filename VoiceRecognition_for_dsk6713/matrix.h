#ifndef MATRIX_H_  
#define MATRIX_H_

#include <stdio.h>
#include <stdlib.h>

float ** MultiplyMatrix(float** A, int A_n, int A_m, float** B, int B_n, int B_m);
float ** InverseMatrix(float** A, int n);
float ** TransposeMatrix(float **A, int A_n, int A_m);

#endif
