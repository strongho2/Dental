unit GeneralMethods;

interface

uses
  Windows, Classes, Sysutils, Forms, System.DateUtils, System.IOUtils;

  procedure PrepareFieldsToStartTest();
  procedure FillArrQuestions();
  procedure WritePatientDataToFile(); overload;
  procedure WritePatientDataToFile(TypeWrite: Boolean); overload;
  procedure ReadPatientsFromFile();
  // вывод данных из файла patients.dat в StringGrid1
  procedure PrintDataToStringGrid();
  procedure ClearStringGrid();

implementation

uses
  MainUnit, QuestionsUnit;

procedure PrepareFieldsToStartTest();
begin
  Form1.Edit1.Text:= '';
  Form1.Edit2.Text:= '';
  Form1.Edit3.Text:= DateToStr(Now);
end;

procedure FillArrQuestions();
begin
  QuestionsArr:= nil;
  SetLength(QuestionsArr, Length(QuestionsBaseArray));

  QuestionsArr:= Copy(QuestionsBaseArray, 0, Length(QuestionsBaseArray));
end;

procedure WritePatientDataToFile();
begin
  AssignFile(PatientFile, ExtractFilePath(Application.ExeName) + 'patients.dat');

  // если файл нет, то открываем посредством Rewrite
  if not (TFile.Exists(ExtractFilePath(Application.ExeName) + 'patients.dat')) then
    Rewrite(PatientFile)
  else
  begin
    Reset(PatientFile);
    // ставим указатель в конец файла PatientFile
    Seek(PatientFile, FileSize(PatientFile));
  end;

  // записываем данные протестированного человека Patient в файл PatientFile
  Write(PatientFile, Patient);
  CloseFile(PatientFile);
end;

procedure WritePatientDataToFile(TypeWrite: Boolean);
var
  i: Integer;
begin
  AssignFile(PatientFile, ExtractFilePath(Application.ExeName) + 'patients.dat');
  Rewrite(PatientFile);

  for i:= Low(PatientsBase) to High(PatientsBase) do
  begin
    Write(PatientFile, PatientsBase[i]);
  end;

  CloseFile(PatientFile);
end;

procedure ReadPatientsFromFile();
var
  TempPatient: TPatient;
  TempFilePatients: file of TPatient;
begin
  if (TFile.Exists(ExtractFilePath(Application.ExeName) + 'patients.dat')) then
  begin
    PatientsBase:= nil;

    AssignFile(TempFilePatients, ExtractFilePath(Application.ExeName) + 'patients.dat');
    Reset(TempFilePatients);

    // если файл пустой не считываем ничего
    if (FileSize(TempFilePatients) = 0) then
    begin
      CloseFile(TempFilePatients);
      Exit;
    end;

    while not Eof(TempFilePatients) do
    begin
      Read(TempFilePatients, TempPatient);
      SetLength(PatientsBase, Length(PatientsBase) + 1);
      PatientsBase[Length(PatientsBase)-1].FName:= TempPatient.FName;
      PatientsBase[Length(PatientsBase)-1].FAge:= TempPatient.FAge;
      PatientsBase[Length(PatientsBase)-1].FDate:= TempPatient.FDate;
      PatientsBase[Length(PatientsBase)-1].FGender:= TempPatient.FGender;
      PatientsBase[Length(PatientsBase)-1].FPoints:= TempPatient.FPoints;
      PatientsBase[Length(PatientsBase)-1].FInterpretation:= TempPatient.FInterpretation;
      PatientsBase[Length(PatientsBase)-1].FUniqueID:= TempPatient.FUniqueID;
    end;

    // записываем последний Уникальный идентификатор
    PatientLastUniqueID:= PatientsBase[High(PatientsBase)].FUniqueID;

    CloseFile(TempFilePatients);
  end;
end;

procedure PrintDataToStringGrid();
var
  i, PosPrint: Integer;
begin
  ClearStringGrid();
  PosPrint:= 1;
  for i:= High(PatientsBase) downto Low(PatientsBase) do
  begin
    Form1.StringGrid1.Cells[0, PosPrint]:= PatientsBase[i].FName;
    Form1.StringGrid1.Cells[1, PosPrint]:= PatientsBase[i].FAge;
    Form1.StringGrid1.Cells[2, PosPrint]:= PatientsBase[i].FDate;

    if (PatientsBase[i].FGender = True) then
      Form1.StringGrid1.Cells[3, PosPrint]:= 'мужчина'
    else
      Form1.StringGrid1.Cells[3, PosPrint]:= 'женщина';

    Form1.StringGrid1.Cells[4, PosPrint]:= IntToStr(PatientsBase[i].FPoints);

    if (PatientsBase[i].FInterpretation = 1) then
      Form1.StringGrid1.Cells[5, PosPrint]:= 'Низкий уровень тревожности'
    else if (PatientsBase[i].FInterpretation = 2) then
      Form1.StringGrid1.Cells[5, PosPrint]:= 'Средний уровень тревожности'
    else
      Form1.StringGrid1.Cells[5, PosPrint]:= 'Высокий уровень тревожности';

    Form1.StringGrid1.Cells[6, PosPrint]:= IntToStr(PatientsBase[i].FUniqueID);

    Inc(PosPrint);
  end;

  if (Length(PatientsBase) > 0) then
    Form1.StringGrid1.RowCount:= Length(PatientsBase) + 1
  else
    Form1.StringGrid1.RowCount:= 2;
end;

procedure ClearStringGrid();
var
  i, j: Integer;
begin
  for i:= 0 to Form1.StringGrid1.ColCount - 1 do
  begin
    for j:= 1 to Form1.StringGrid1.RowCount - 1 do
    begin
      Form1.StringGrid1.Cells[i, j]:= '';;
    end;
  end;
end;

end.
