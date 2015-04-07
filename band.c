int band(int m[100][100], int a, int b, int size)
{
	int i, sum=0;

	for(i=a; i<=b; i++)
		sum+=resultsum(m,size,i);

	return sum;
}