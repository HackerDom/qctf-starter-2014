#include <cstring>
#include <cstdio>
#include <cstdlib>

typedef unsigned long long ull;

const char* teams[] = {
	"ronin",
	"SnowNiggers",
	"Temp",
	"0xAEAE",
	"Curiosity",
	"orz",
	"Destructive Voice",
	"Temp2",
	"}{0Tт@Бь)Ч",
	"AV-Group",
	"Lalochka",
	"AC-Adapter",
	"Hobbits",
	"Counter-Logic",
	"ISLookPieNice",
	"StackOverflow",
	"Hello_World!",
	"obnovilsyabezproblem",
	"marmeladka",
	"Teddy",
	"MicroBears",
	"Eliot",
	"Resolver'ы",
	"ASMиноги",
	"RussianBears",
	"BobKnows",
	"ADVE!nt",
	"404",
	"«     »",
	"Dandelion",
	"Байтики",
	"SudoObey",
	"Mix",
	"Двоичный кот",
	"Калинкольн-Малинкольн",
	"Камнеежка"
};

const int startTeamIndex = 24;

const int bufferSize = 100;
char buffer[100];

int min(int a, int b) {
	return a < b ? a : b;
}

bool isHex(const char buf[]) {
	for (size_t i = 0; buf[i]; ++i)
		if (!(('0' <= buf[i] && buf[i] <= '9') || ('A' <= buf[i] && buf[i] <= 'F')))
			return false;
	return true;
}

ull ror(ull x, ull k) {
	int kk = k & 63;
	int k2 = 64 - kk;
	return (x << kk) | ((x >> k2) & ((1ULL << kk) - 1));
}

bool correct(const char team[], const char buf[]) {
	if (strlen(buf) != 24 * 2)
		return false;

	if (!isHex(buf))
		return false;

	ull A, B, C;
	sscanf(buf, "%16llX%16llX%16llX", &A, &B, &C);

	for (size_t i = 0; i < 10; ++i) {
		A = (A + B) ^ C;
		B = ror(B, C) ^ A;
		C = ror(C, A) + B;
	}

	char temp[25];
	memset(temp, 0, 25);
	memcpy(temp, team, min(strlen(team), 24));
	ull * longTeam = (ull*)temp;

	return A == longTeam[0] && B == longTeam[1] && C == longTeam[2];
}

void trimEnd(char* buf) {
	int last = strlen(buf) - 1;
	while (last >= 0 && buf[last] == '\n')
		buf[last--] = 0;
}

int main(int argc, char *argv[]) {
	if (argc < 2) {
		fputs("Not enough parameters for check. Format: ./checker <team-id>\n", stderr);
		return 1;
	}

	if (fgets(buffer, bufferSize, stdin) == NULL) {
		fputs("Reading fail...\n", stderr);
		return 1;
	}

	trimEnd(buffer);

	return 2 * !correct(teams[atoi(argv[3])], buffer);
}
