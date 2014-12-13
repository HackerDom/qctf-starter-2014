// by Kopeicev

#include "windows.h"

BOOL CALLBACK checkPid(HWND handle, LPARAM myPid)
{
	char* buf = new char[260];
	memset(buf, 0, 260);
	::GetWindowText(handle, buf, 260);
	if (strcmp(buf, "EvilVirus") != 0)
	{
		delete [] buf;
		return TRUE;
	}

	::ShowWindow(handle, SW_HIDE);
	::MessageBoxA(0, "I'am alive!!!", "HAHAHA!!!", MB_OK);
	
	delete [] buf;
	return FALSE;
}

int main()
{
	::EnumWindows((WNDENUMPROC) &checkPid, NULL);
	while(TRUE)
		::Sleep(100000);

	return 0;
}
/*-----EoF-----*/