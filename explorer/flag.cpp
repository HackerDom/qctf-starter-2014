//by Tinkturianec and Kopeicev

#include <cstdio>
#include <windows.h>

const int a = 0xe7bd;
const int b = 0x36643001;
const int c = 0x9c5c00b2;

const int A = 0xffffffaa;
const int B = 0x02af;
const int C = 0xfffff9b4;
const int D = 0x04aa;

int seed = 0;

int f()
{
	return (seed = (seed * a + b) ^ c) & 0x7f;
}

int g(int x)
{
	return (((A * x + B) * x + C) * x + D) / 3;
}

bool isCorrect(int x)
{
	return  ('a' <= x && x <= 'z') || ('A' <= x && x <= 'Z') || ('0' <= x && x <= '9') || (x == '_');
}

int main ()
{
	for (int time = 5; time > -1; time--)
	{
		printf("%d\n", time);
		::Sleep(1000);
	}

        seed = GetSystemMetrics(SM_CLEANBOOT) + ::GetVersion() + 1073741853;
	for (int i = 0; i < 21; ++i)
        {
		int skip = g(i);
		for (int j = 0; j < skip; ++j)
			f();

		int x;
		while (!isCorrect(x = f())) {}
		printf("%c", x);
	}
	printf("\n");
	getchar();
	
	return 0;
}
/*-----EoF-----*/