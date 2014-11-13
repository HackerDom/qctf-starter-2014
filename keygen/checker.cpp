#include <cstring>
#include <cstdio>
#include <cstdlib>

typedef unsigned long long ull;

const ull prime = 567460752303432487ULL;

const char series[] = "keygen";
const char score[] = "200";
const char name[] = "Qoala";
const char text[] = "Всё просто: вам нужно отослать строку, которую примет наш <a href='static/ec150796205b74e622e381c4fdb17fb4b701236b/checker'>чекер</a>";

const char* teams[] = {
	"team1",
	"team2",
	"team3"
};

const int teamCount = 3;

const int bufferSize = 100;
char buffer[100];

inline char hex(const char ch) {
	if ('0' <= ch && ch <= '9')
		return ch - '0';
	if ('A' <= ch && ch <= 'F')
		return ch - 'A';
	return -1;
}

inline ull ror(ull x, ull k) {
	int kk = k & 63;
	return (x << kk) | (x >> (64 - kk));
}

inline ull mul(ull a, ull b) {
	ull res = 0;
	while (b) {
		if (b & 1)
			res += a;
		a <<= 1;
		b >>= 1;
	}
	return res;
}

inline bool correct(const char team[], const char buf[]) {
	if (strlen(buf) != 24 * 2 + 7)
		return false;

	ull A, B, C;
	A = B = C = 0;
	for (size_t i = 0; buf[i]; ++i) {
		if (buf[i] == '-') {
			if (i % 7 == 6)
				continue;
			return false;
		}
		char q = hex(buf[i]);
		if (q < 0)
			return false;
		A <<= 4;
		A |= (B & 0xf000000000000000ULL) >> 60;
		B <<= 4;
		B |= (C & 0xf000000000000000ULL) >> 60;
		C <<= 4;
		C |= q;
	}

	for (size_t i = 0; i < 10; ++i) {
		ull a, b, c;

		a = (A + B) ^ C;
		b = ror(B, C) ^ A;
		c = mul(A, C) + B;

		A = a; B = b; C = c;
	}

	ull AA, BB, CC;
	AA = BB = CC = 0;
	for (size_t i = 0; team[i]; ++i) {
		AA <<= 8;
		AA |= (BB & 0xff00000000000000ULL) >> 56;
		BB <<= 8;
		BB |= (CC & 0xff00000000000000ULL) >> 56;
		CC <<= 8;
		CC |= static_cast<unsigned char>(team[i]);
	}

	return A == AA && B == BB && C == CC;
}

int main(int argc, char *argv[]) {
	if (argc < 2) {
		fputs("You need to provide at least one argument\n", stderr);
		return 1;
	}

	if (!strcmp(argv[1], "id")) {
		printf("%s:%s\n", series, score);
		return 0;
	}

	if (!strcmp(argv[1], "series")) {
		printf("%s\n", series);
		return 0;
	}

	if (!strcmp(argv[1], "name")) {
		printf("%s\n", name);
		return 0;
	}

	if (!strcmp(argv[1], "create")) {
		if (argc < 4) {
			fputs("Not enough parameters for create. Format: create <temp-dir> <team-id>\n", stderr);
			return 1;
		}

		if (atoi(argv[3]) >= teamCount) {
			printf("Team number is too big: %s >= %d\n", argv[3], teamCount);
			return 1;
		}

		printf("ID: %s\n", argv[3]);
		printf("html[ru]: %s\n", text);
		return 0;
	}

	if (!strcmp(argv[1], "user")) {
		if (argc < 4) {
			fputs("Not enough parameters for check. Format: user <temp-dir> <team-id>\n", stderr);
			return 1;
		}

		if (fgets(buffer, bufferSize, stdin) == NULL) {
			fputs("Reading fail...\n", stderr);
			return 1;
		}

		return 2 * !correct(teams[atoi(argv[3])], buffer);
	}
	
	fprintf(stderr, "No such action: '%s'. Avaliable actions are: id, series, name, create, user\n", argv[1]);
	return 1;
}
