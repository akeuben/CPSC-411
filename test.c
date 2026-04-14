#include <stdio.h>

int catalan(int n) {
	int sum;
	int idx;
	int n2;
	int v1;
	int v2;
	int elti;
	if (n == 0) return 1;
	sum = 0;
	idx = 0;
	n = n - 1;
	while (idx <= n) {
		n2 = n - idx;
		v1 = catalan(idx);
		v2 = catalan(n2);
		elti = v1 * v2;
		sum = sum + elti;
		idx = idx + 1;
	}
	return sum;
}

void printi(int i) {
    printf("%d", i);
}

void printc(char c) {
    printf("%c", c);
}

int main() {
	printi(catalan(10));
	printc(10);
}
