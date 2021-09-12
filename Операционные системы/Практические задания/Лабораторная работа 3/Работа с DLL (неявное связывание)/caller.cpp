/************************************************************************
                          ������������ ������ N3

                                ������ 1.

                               CALLER.CPP

       �������� ��������� ��� ������ ������� �� DLL (������� ����������)

************************************************************************/
#include <windows.h>

/* �������� ���������� �� DLL ������� ����������� ������ ���� ������ �
   ���������� ��������� � ������ ������������ � ��� ��������� � DLL.
   ����������� EXTERN ����������, ��� ������� Test() �������� �������
   �� ��������� � ������� ������, � �� ��� ������� ������ ���-�� �� �������
   ������� (� ������ ������ � DLL).

*/
extern LPSTR Test (void);

/* ��� ������� ���������� �������������� ��������� � DLL �������������� 
   ����������� �.�. ���������� �������, ������� ��������� � �������
   ����������� ������� IMPLIB (��. BUILD.BAT). ���������� ���������� �������
   �������� �������� � ��������, �������������� �� DLL. ����� �������, ���
   �������� ����������� ����� DLL, ������� ������������ �������, � EXE-������,
   ������� ����� ��������� ����������. ��� ������������� ����� ���������
   �������, ���������� ����, � �� ����� ���������� ������� (LIB-����)
   ������������ ��� ���������� � EXE-����� (��. BUILD.BAT). ��� �������
   ��������� ������� � ������������ .LIB-����� ���������� ��������� ��������
   � ��������� ������� �� DLL, ��� � �������� ����.
*/
WINAPI WinMain (HINSTANCE, HINSTANCE, LPSTR, int)
{
    LPSTR str = Test ();        // ����� ������� �� DLL
    return MessageBox (NULL, str, "����� �� DLL!", MB_OK | MB_ICONEXCLAMATION);
}

