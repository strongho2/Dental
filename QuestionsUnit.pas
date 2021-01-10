unit QuestionsUnit;

interface

uses
  Windows, Classes, Sysutils, Forms;

  procedure FillQuestionsBaseArr();

//var
  //QuestionsBaseArray: array of string;

implementation

uses
  MainUnit;

procedure FillQuestionsBaseArr();
begin
  QuestionsBaseArray:= nil;
  SetLength(QuestionsBaseArray, 33);

  QuestionsBaseArray[0]:= '� �������� ����������� � ������� �������� � ������ ' +
                      '������ ����� ����� �������.';
  QuestionsBaseArray[1]:= '� ������, ��� �������������� ���� �� ����� ����� ' +
                      '����� ���������, ��� � ���� ����� � ��� ����� ������.';
  QuestionsBaseArray[2]:= '����� ������ ����� ������������������ ������ ' +
                      '��������� ����� �����, ������� ���� ����������, ��� ' +
                      '�� ��� ��������.';
  QuestionsBaseArray[3]:= '�� ��������� ��� ���������� ���� ����� � ���� ����� ' +
                      '������, ��������� ������� � ���� ����������������� ��������.';
  QuestionsBaseArray[4]:= '� ����� ������ ����� ���� � ������ � ���������� ����� ' +
                      '��� ��������, � ��� ����� � � �����������.';
  QuestionsBaseArray[5]:= '��� �������, ����� ��� ������� ������, ������ ���� �� ����������.';
  QuestionsBaseArray[6]:= '� ��� �������� �������, ��� ��� ������ �� ����� ����, ' +
                      '���� ��� ������ �������� ������ ���� ���� �� ������.';
  QuestionsBaseArray[7]:= '������, ��� ������� ����� � ��������� �������, ' +
                      '�������� � ������, ������� ������� ����� ����������, � ' +
                      '����� � ������.';
  QuestionsBaseArray[8]:= '� ���� �� 100% ������������ ������������, ��� ����� ' +
                      '������ �������, � ��� ����� � ����-����������.';
  QuestionsBaseArray[9]:= '���� ������� �� ������� ���� ������, ��� ����� �����.';
  QuestionsBaseArray[10]:= '����� ��� �����, � ���� ��������� ����������� ' +
                       '���������, ����� � ���� ������ ����.';
  QuestionsBaseArray[11]:= '������ ����� ������� ���, ��� � ��������, ���� � ����, ��� ����.';
  QuestionsBaseArray[12]:= '������, ��� ��� ���-�� ������ ��������.';
  QuestionsBaseArray[13]:= '������ � �������� ���� ����� ����������.';
  QuestionsBaseArray[14]:= '���� ���-�� � ���� �� ���������, � ����������.';
  QuestionsBaseArray[15]:= '� ���� ������ ����������� �������� �� ������� � �����.';
  QuestionsBaseArray[16]:= '��� ���������� ����� ������� �� �������� ��� �������� ���.';
  QuestionsBaseArray[17]:= '������ ��� ������ ��� ������� ��� ������ �������.';
  QuestionsBaseArray[18]:= '��� �������, ��� ��� ���������� ������ ������� ���� �� ������.';
  QuestionsBaseArray[19]:= '��� ���������� ������, ���� ��� ������ �������.';
  QuestionsBaseArray[20]:= '� ������ ���� ������, ������� ������������� ���������.';
  QuestionsBaseArray[21]:= '� ����� ��������.';
  QuestionsBaseArray[22]:= '� ����� �������.';
  QuestionsBaseArray[23]:= '� ������� �� ������� � ����� � �����.';
  QuestionsBaseArray[24]:= '� ������ ������ � ����������������� �� ��������� �� ���.';
  QuestionsBaseArray[25]:= '� ������ ���� ����� ������� ��������, ��� � � ��� �����.';
  QuestionsBaseArray[26]:= '� ������ ��� � ������������ ����, ���� ���� ' +
                       '����������� ���������.';
  QuestionsBaseArray[27]:= '� �������� ����������, ���� ����-�� ������.';
  QuestionsBaseArray[28]:= '�� ���� ������ ����� �����.';
  QuestionsBaseArray[29]:= '� ����� ��������� ���� ���.';
  QuestionsBaseArray[30]:= '� ������ ������� �������� �� ������ ������� �����.';
  QuestionsBaseArray[31]:= '����,  ��������� ������������ ����� ����, ������� ' +
                       '� ���� ���������� �������.';
  QuestionsBaseArray[32]:= '������ �������, ��� � ����������� �������.';
end;

end.