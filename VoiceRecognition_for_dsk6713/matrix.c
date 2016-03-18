#include "matrix.h"

float ** MultiplyMatrix(float** A, int A_n, int A_m, float** B, int B_n, int B_m) {

	if (A_m != B_n) {
		printf("Error in Matrix Multiplication; matrix dimensions are not appropriate!\n");
	}

	float **R, sum = 0;
	int i, j, k;

	R = (float **)malloc(A_n * sizeof(float *));

	for (i = 0; i < A_n; i++)
		R[i] = (float *)malloc(B_m * sizeof(float));

	for (i = 0; i < A_n; ++i)
	for (j = 0; j < B_m; ++j)
		R[i][j] = 0;

	for (i = 0; i < A_n; ++i)
	for (j = 0; j < B_m; ++j)
	for (k = 0; k < B_n; ++k)
	{
		R[i][j] += A[i][k] * B[k][j];
	}

	return R;
}

float ** InverseMatrix(float** A, int n) {

	float **I, temp;
	int i, j, k;

	I = (float **)malloc(n * sizeof(float *));
	for (i = 0; i<n; i++)
		I[i] = (float *)malloc(n * sizeof(float));

	for (i = 0; i < n; i++)
	for (j = 0; j < n; j++)
	if (i == j)
		I[i][j] = 1;
	else
		I[i][j] = 0;

	for (k = 0; k < n; k++)
	{
		temp = A[k][k];
		for (j = 0; j < n; j++)
		{
			A[k][j] /= temp;
			I[k][j] /= temp;
		}
		for (i = 0; i < n; i++)
		{
			temp = A[i][k];
			for (j = 0; j < n; j++)
			{
				if (i == k)
					break;
				A[i][j] -= A[k][j] * temp;
				I[i][j] -= I[k][j] * temp;
			}
		}
	}

	return I;

}

float ** TransposeMatrix(float **A, int A_n, int A_m) {

	float **T;
	int i, j;

	T = (float **)malloc(A_m * sizeof(float *));

	for (i = 0; i < A_m; i++)
		T[i] = (float *)malloc(A_n * sizeof(float));

	for (i = 0; i < A_n; ++i)
	for (j = 0; j < A_m; ++j)
		T[j][i] = A[i][j];

	return T;

}
