#include <cstdio>

typedef unsigned long long ull;

ull rol(ull x, ull k) {
	int kk = k & 63;
	int k2 = 64 - kk;
	return (x << k2) | ((x >> kk) & ((1ULL << k2) - 1));
}

char s[25];

int main() {
	fgets(s, 25, stdin);

	for (int i = 0; s[i]; ++i) {
		if (s[i] == '\n')
			s[i] = 0;
	}

	ull * longTeam = (ull*)s;
	ull A = longTeam[0];
	ull B = longTeam[1];
	ull C = longTeam[2];

	for (size_t i = 0; i < 10; ++i) {
		C = rol(C - B, A);
		B = rol(B ^ A, C);
		A = (A ^ C) - B;
	}

	printf("%016llX%016llX%016llX\n", A, B, C);
}
