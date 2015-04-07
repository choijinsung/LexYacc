void run(int a[][], int r, int c)
{
	int x, y;
	int sidesum[102][102] = {0};

	for(x = 1; x <= r; x++)
		for(y = 1; y <= c; y++)
			sidesum[x][y]=a[x-1][y-1];
}