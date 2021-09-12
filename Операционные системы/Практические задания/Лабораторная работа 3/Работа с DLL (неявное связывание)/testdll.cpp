/************************************************************************
                          ������ୠ� ࠡ�� N3

                                �ਬ�� 1.

                               TESTDLL.CPP

    �ਬ�� ������⥪� DLL, ��ᯮ�����饩 �㭪��  �� ���� ��뢠���

************************************************************************/
#include <windows.h>

/* �㭪�� GetSomeString() ���� ����७��� �㭪樥� DLL � �� ��ᯮ�������.
   ����� ��ࠧ��, ��㣨� �ਫ������ �� ����� ��אַ�� ����㯠 � �� ����. ���
   �ࠢ���, ⨯�筠� DLL ᮤ�ন� �����஥ ������⢮  ����७��� �㭪権,
   �믮������ ॠ���� ࠡ���, � ⠪�� ��᪮�쪮 ��ᯮ���㥬��  �㭪権,
   ����� �믮����� ஫� ����䥩� ����� DLL � �ਫ�����ﬨ. �� �⮬
   ��ᯮ���㥬� �㭪樨 ����� ��뢠�� ����७��� �㭪樨 DLL ��� ��������
   � ������ �ਬ��.
*/

LPSTR GetSomeString ()          // �㭪�� GetSomeString () ����
{                               // �����頥� ��ப� ⥪��
   return "Hello from DLL!\n";
}


/* �㭪�� Test() ���� ��ᯮ���㥬��, �.�. ����㯭� ��㣨� �ਫ������.
   ��� �⮣� ��� ������ ���� ���ᠭ� � ᯥ樠��� ����䨪��஬, �����
   ��।������ �ᯮ��㥬�� ���ᨥ� ���������. � ��砥 � C++ Builder -
   __declspec (dllexport). �� �ᯮ�짮����� �⮣� ����䨪��� �㭪�� �㤥�
   ����饭� � ⠡���� ��ᯮ�� DLL � �⠭�� ����㯭� ���譨� �ਫ������.
   ���⨯ �㭪樨 � ��뢠�饩 �ணࠬ�� ������ ᮮ⢥��⢮���� �� ���ᠭ��
   � ���� DLL, �� �᪫�祭��� ����䨪��� __declspec (dllexport).
*/

LPSTR  __declspec (dllexport) Test (void)
{
   return GetSomeString ();
}


// �㭪�� DllEntryPoint ���� �⠭���⭮� �窮� �室� ��� DLL, �.�.
// �������� WinMain ��� �ਫ������ (�� ��� ����� ���뢠���� DllMain). 
// ��� �ࠢ���, ��� �ਬ������ �����筮 ।��  - � �����, ����� 
// �ॡ���� �믮����� �����-� ���樠����樮��� ����⢨� �� ����㧪� DLL,
// ��᪮���  DllEntryPoint �믮������ ��⮬���᪨ �� ����㧪� DLL.

BOOL WINAPI DllEntryPoint (HINSTANCE, DWORD, DWORD)
{
    return 1;    // DllEntryPoint ���� �����頥� TRUE � ��祣� �� ������
}

