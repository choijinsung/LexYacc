void main(void)
{
	FILE *infile;
	int a,b,i,j,k,size,no_cases;
	int matrix[100][100];

	infile = fopen("input.txt","r");
	if(infile==NULL) exit(1);

	fscanf(infile, "%d", &no_cases);
	for(k=0; k<no_cases; k++)
	{
		int matrix[100][100]={0};
		fscanf(infile, "%d", &size);
		for(i=0; i<size; i++)
		{
			for(j=0; j<size; j++)
				fscanf(infile, "%d", &matrix[i][j]);	
		}
		fscanf(infile, "%d %d", &a, &b);

		printf("%d\n", band(matrix,a,b,size));
	}

	fclose(infile);
}