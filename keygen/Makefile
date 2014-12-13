all: checker

.PHONY: all clean

checker: checker.cpp
	g++ -Wall -O1 -m64 checker.users.cpp -o checker
	cp checker ./static/ec150796205b74e622e381c4fdb17fb4b701236b/

clean:
	rm checker
	rm ./static/ec150796205b74e622e381c4fdb17fb4b701236b/checker
