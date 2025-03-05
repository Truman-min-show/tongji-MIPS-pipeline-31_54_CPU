#include <stdio.h>
using namespace std;
int main(){
	const int m = 60;
	int a[m], b[m], c[m], d[m];
	a[0] = 0;
	b[0] = 1;
	for (int i = 0; i < m; i++){
		if (i > 0) {
			a[i] = a[i - 1] + i;
			b[i] = b[i - 1] + 3 * i;
		}
		if (i < 20) {
			c[i] = a[i];
			d[i] = b[i];
		}
		else {
			if (i < 40){
				c[i] = a[i] + b[i];
				d[i] = a[i] * c[i];
			}
			else {
				c[i] = a[i] * b[i];
				d[i] = c[i] * b[i];
			}
		}
	}
	printf("各数组的值为：a[i]        b[i]        c[i]        d[i]\n");
	for (int i = 0; i < m; i++) {
		printf("i=%2d        %08x    %08x    %08x    %08x\n", i, a[i], b[i], c[i], d[i]);
	}
	return 0;
}