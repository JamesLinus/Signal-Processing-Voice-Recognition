#include "matrix.h"

void TestMultiplyMatrix();
void TestInverseMatrix();
void TestTransposeMatrix();
/*
int main()
{
	TestMultiplyMatrix();
	TestInverseMatrix();
	TestTransposeMatrix();
	return 0;
}*/


// Matrix multiplication test function
void TestMultiplyMatrix() {
	
	float **A, **B, **R;
	int i, j, A_n, A_m, B_n, B_m;
	
	printf("**** MATRIX MULTIPLICATION ***\n");
	
	printf("Enter the size of the 1st matrix (i.e. value of 'n' and 'm' as size is nXm):");
	scanf("%d %d", &A_n, &A_m);

	printf("Enter the size of the 2nd matrix (i.e. value of 'n' and 'm' as size is nXm):");
	scanf("%d %d", &B_n, &B_m);

	A = (float **) malloc(A_n * sizeof(float *));	
	for(i = 0; i < A_n; i++)
		A[i] = (float *) malloc(A_m * sizeof(float));
	
	B = (float **) malloc(B_n * sizeof(float *));	
	for(i = 0; i< B_n; i++)
		B[i] = (float *) malloc(B_m * sizeof(float));
	

	printf("Enter the first matrix:\n");	// ask the user for matrix A
	for(i = 0; i < A_n; i++)
		for(j = 0; j < A_m; j++)
			scanf("%f", &A[i][j]);
		
	printf("Enter the second matrix:\n");	// ask the user for matrix B
	for(i = 0; i < B_n; i++)
		for(j = 0; j < B_m; j++)
			scanf("%f", &B[i][j]);
		
	R = MultiplyMatrix(A, A_n, A_m, B, B_n, B_m);
	
	printf("The multiplication of the matrixes is:\n");
	for(i = 0; i < A_n; i++) {
		for(j = 0; j < B_m; j++)
			printf("%f\t", R[i][j]);
		printf("\n");
	}

}


// Matrix inverse test function
void TestInverseMatrix() {

	float **A, **I;
	int i, j, n;
	
	printf("**** MATRIX INVERSE ***\n");

	printf("Enter the size of the matrix (i.e. value of 'n' as size is nXn):");
	scanf("%d", &n);

	A = (float **) malloc(n * sizeof(float *));			
	for(i = 0; i < n; i++)
		A[i] = (float *) malloc(n * sizeof(float));

	I = (float **) malloc(n * sizeof(float *));			
	for(i = 0; i < n; i++)
		I[i] = (float *) malloc(n * sizeof(float));

	printf("Enter the matrix:\n");							
	for(i = 0; i < n; i++)
		for(j = 0; j < n; j++)
			scanf("%f", &A[i][j]);

	I = InverseMatrix(A, n);
	printf("The inverse of the matrix is:\n");
	for(i = 0; i < n; i++) {
		for(j = 0; j < n; j++)
			printf("%f\t", I[i][j]);
		printf("\n");
	} 

}


// Matrix transpose test function
void TestTransposeMatrix() {

	float **A, **T;
	int i, j, n, m;
	
	printf("**** MATRIX TRANSPOSE ***\n");


	printf("Enter the size of the matrix (i.e. value of 'n' and 'm' as size is nXm)::");
	scanf("%d %d", &n, &m);

	A = (float **) malloc(n * sizeof(float *));	// allocate the matrix				
	for(i = 0; i < n; i++)
		A[i] = (float *) malloc(m * sizeof(float));

	printf("Enter the matrix:\n");	// get the matrix from the user						
	for(i = 0; i < n; i++)
		for(j = 0; j < m; j++)
			scanf("%f", &A[i][j]);


	T = (float **) malloc(m * sizeof(float *));	// allocate the transpose of the matrix	
	for(i = 0; i < m; i++)
		T[i] = (float *) malloc(n * sizeof(float));

	T = TransposeMatrix(A, n, m);


	printf("The transpose of the matrix is:\n");	// print the result (transpose of matrix A)
	for(i = 0; i < m; i++) {
		for(j = 0; j < n; j++)
			printf("%f\t", T[i][j]);
		printf("\n");
	} 

}


