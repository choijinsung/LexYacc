int resultsum(int m[100][100], int size, int x)
{
	int j, sum=0;
	int a[100]={0};

	if(x<0)
	{
		for(j=0; j<size+x; j++)
		{
			a[j]=m[j-x][j];
			sum+=a[j];
		}
	}
	else
	{
		for(j=0; j<size-x; j++)
		{
			a[j]=m[j][j+x];
			sum+=a[j];
		}
	}

	return sum;
}