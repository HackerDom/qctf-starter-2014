#include <cstdio>
#include <vector>
#include <algorithm>
#include <cstdlib>
#include <ctime>
#include <cstring>

using namespace std;

const int dx[] = {1, 1, -1, -1};
const int dy[] = {1, -1, 1, -1};

const int BUF_SIZE = 100;
const int NEED_COUNT = 10;

int perm[] = { 0, 1, 2, 3, 4, 5, 6, 7 };
int allMoves[8][2];

char buf[BUF_SIZE];
bool canEnd[8][8];
int map[8][8];
vector<int> pos;
vector<int> movesDiff[64];
vector<int> moves;

void printMap() {
	for (int i = 0; i < 8; ++i) {
		for (int j = 0; j < 8; ++j) {
			if (map[i][j])
				printf("%d", map[i][j]);
			else
				printf(".");
		}
		printf("\n");
	}
}

bool inMap(int x, int y) {
	return 0 <= x && x < 8 &&
		0 <= y && y < 8;
}

bool canAttack(int x, int y, int dx, int dy) {
	int xx = x + dx;
	int yy = y + dy;
	int xxx = x + 2 * dx;
	int yyy = y + 2 * dy;
	return 
		inMap(xx, yy) && 
		inMap(xxx, yyy) &&
		map[xx][yy] + map[x][y] == 3 && 
		!map[xxx][yyy];
}

bool canMove(int x, int y, int dx, int dy) {
	int xx = x + dx;
	int yy = y + dy;
	return inMap(xx, yy) && !map[xx][yy];
}

bool hasMoves(int x, int y) {
	int di = (map[x][y] - 1) * 2;
	for (int i = 0; i < 2; ++i) {
		if (canMove(x, y, dx[i + di], dy[i + di])) {
			return true;
		}
	}
	for (int i = 0; i < 4; ++i) {
		if (canAttack(x, y, dx[i], dy[i])) {
			return true;
		}
	}
	return false;
}

bool doMove(int pos, int xx, int yy) {
	int x = pos / 8, y = pos % 8;

	int di = (map[x][y] - 1) * 2;
	for (int i = 0; i < 2; ++i) {
		if (xx == x + dx[i + di] && yy == y + dy[i + di]) {
			if (canMove(x, y, dx[i + di], dy[i + di])) {
				map[xx][yy] = map[x][y];
				map[x][y] = 0;
				return true;
			} else {
				return false;
			}
		}
	}

	for (int i = 0; i < 4; ++i) {
		if (xx == x + 2 * dx[i] && yy == y + 2 * dy[i]){
			if (canAttack(x, y, dx[i], dy[i])) {
				map[xx][yy] = map[x][y];
				map[x][y] = 0;
				map[x + dx[i]][y + dy[i]] = 0;
				return true;
			} else {
				return false;
			}
		}
	}

	return false;
}

int main () {
	srand(time(NULL));
	for (int i = 0; i < 4; ++i) {
		allMoves[i][0] = dx[i];
		allMoves[i][1] = dy[i];
		allMoves[i + 4][0] = 2 * dx[i];
		allMoves[i + 4][1] = 2 * dy[i];
	}

	for (int i = 0; i < 3; ++i) {
		for (int j = 0; j < 8; ++j) {
			map[i][j] = (i + j + 1) & 1;
		}
	}

	for (int i = 5; i < 8; ++i) {
		for (int j = 0; j < 8; ++j) {
			map[i][j] = ((i + j + 1) & 1) * 2;
		}
	}

	int correctCount = 0;
	int iter = 0;
	while (correctCount < NEED_COUNT) {
		printf("Case: %d\n", ++iter);
		fflush(stdout);
		//		printMap();
		pos.clear();
		for (int i = 0; i < 8; ++i) {
			for (int j = 0; j < 8; ++j) {
				if (!map[i][j]) continue;
				if (hasMoves(i, j)) {
					pos.push_back(i * 8 + j);
				}
			}
		}

		if (!pos.size()) {
			printf("Oops! No more tests\n");
			fflush(stdout);
			return 1;
		}

		int q = rand() % pos.size();
		printf("Test: %d %d\nYour answer: ", pos[q] / 8 + 1, pos[q] % 8 + 1);
		fflush(stdout);

		int x, y;
		if (fgets(buf, BUF_SIZE, stdin)) {

			if (strlen(buf) == BUF_SIZE - 1 && buf[BUF_SIZE - 2] != '\n') {
				char ch;
				while ((ch = getchar()) != EOF && ch != '\n') {}
			}

			if (sscanf(buf, "%d%d", &x, &y) == 2 
					&& inMap(x - 1, y - 1) 
					&& doMove(pos[q], x - 1, y - 1)) {
				correctCount++;
				printf("Ok (%d/%d)\n", correctCount, NEED_COUNT);
				fflush(stdout);
				continue;
			}
		}
		else {
			return 0;
		}

		for (int i = 7; i > 0; --i) {
			swap(perm[i], perm[rand() % (i + 1)]);
		}

		x = pos[q] / 8;
		y = pos[q] % 8;
		for (int i = 0; i < 8; ++i) {
			int xx = x + allMoves[perm[i]][0];
			int yy = y + allMoves[perm[i]][1];
			if (doMove(pos[q], xx, yy)) {
				printf("Nope. Right is %d %d\n\n", xx + 1, yy + 1);
				fflush(stdout);
				correctCount = 0;
			}
		}
	}

	printf("flag: QCTF_27a9d80b2585494095480647d3062ee3\n");
	return 0;
}
