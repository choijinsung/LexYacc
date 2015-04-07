void runLife(int a[][], int r, int c)
{
	int x, y;
	int sidesum[102][102] = {0};

	for(x = 1; x <= r; x++)
		for(y = 1; y <= c; y++)
			sidesum[x][y]=a[x-1][y-1]+a[x-1][y]+a[x-1][y+1]+a[x][y-1]+a[x][y+1]+a[x+1][y-1]+a[x+1][y]+a[x+1][y+1];

	for(x = 1; x <= r; x++) {
		for(y = 1; y <= c; y++) {
			if((a[x][y] == 0) && (sidesum[x][y] == 3)) {
				a[x][y] = 1;
			} else if((a[x][y] == 1) && ((sidesum[x][y] <= 1) || (sidesum[x][y] >= 4))) {
				a[x][y] = 0;
			}
		}
	}
}