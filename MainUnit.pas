unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.Math,
  Vcl.Buttons, Vcl.Grids, Vcl.Menus;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    ComboBox1: TComboBox;
    Edit3: TEdit;
    Panel2: TPanel;
    Memo1: TMemo;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Button2: TButton;
    Button1: TButton;
    Button3: TButton;
    SpeedButton1: TSpeedButton;
    StringGrid1: TStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    procedure PatientClear();
    // процедура получения, вывода в Memo1 и удаления случайного вопроса из QuestionsArr
    procedure GetAndPrintQuestion();
  public
    { Public declarations }
  end;

  TPatient = record
    FName:   string[255];
    FAge:    string[3];
    FDate:   string[10];
    FGender: Boolean; // True - male; False - female
    FPoints: Integer;
    FInterpretation: Integer; // 1 - Low; 2 - Middle; 3 - High
    FUniqueID: Int64;
  end;

var
  Form1: TForm1;
  Patient: TPatient;
  PatientsBase: array of TPatient;
  QuestionsArr, QuestionsBaseArray: array of string;
  PatientFile: File of TPatient;
  PatientLastUniqueID: Int64;
  PrintQuestionCount: Integer;

implementation

uses
  QuestionsUnit, GeneralMethods;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Randomize;
  PrintQuestionCount:= 0;

  if (Edit1.Text = '') or (Edit2.Text = '') then
  begin
    ShowMessage('Заполните все поля');
    Exit;
  end;

  // Если все данные введены
  Panel1.Enabled:= False;
  Button2.Enabled:= False;
  RadioButton1.Checked:= False;
  RadioButton2.Checked:= False;
  Button3.Visible:= False;
  Button2.Visible:= True;
  Panel2.Visible:= True;
  SpeedButton1.Visible:= True;

  Inc(PrintQuestionCount);
  Label1.Caption:= IntToStr(PrintQuestionCount) + '\' +
                   IntToStr(Length(QuestionsBaseArray));

  // очищаем запись Patient
  PatientClear();
  // заполняем Имя, Возраст, Дату, Пол  пациента

  Patient.FName:= Edit1.Text;
  Patient.FAge:= Edit2.Text;
  Patient.FDate:= Edit3.Text;
  if (ComboBox1.ItemIndex = 0) then
    Patient.FGender:= False
  else
    Patient.FGender:= True;

  // заполняем массив QuestionsArr вопросами
  FillArrQuestions();

  // печатаем первый вопрос
  GetAndPrintQuestion();
end;

// продвижение по вопросам
procedure TForm1.Button2Click(Sender: TObject);
var
  TempStr: string;
begin
  // Считываем ответ
  // плюсуем 1 к баллам, только если выбран ответ "ДА"
  if (RadioButton1.Checked) then
  begin
    Inc(Patient.FPoints);
  end;

  // если вывели все вопросы, то выдаем результат и сохраняем в файл
  if (Length(QuestionsArr) = 0) then
  begin
    TempStr:= Patient.FName + ':  количество баллов ' + IntToStr(Patient.FPoints);
    if (Patient.FPoints <= 11) then
    begin
      TempStr:= TempStr + '  Низкий уровень тревожности';
      Patient.FInterpretation:= 1;
    end
    else if (Patient.FPoints >= 12) and (Patient.FPoints <= 23) then
    begin
      TempStr:= TempStr + '  Средний уровень тревожности';
      Patient.FInterpretation:= 2;
    end
    else
    begin
      TempStr:= TempStr + '  Высокий уровень тревожности';
      Patient.FInterpretation:= 3;
    end;

    // записываем уникальный идентификатор для текущего пациента
    Patient.FUniqueID:= PatientLastUniqueID + 1;

    ShowMessage(TempStr);

    Button3.Visible:= True;
    Button2.Visible:= False;
    SpeedButton1.Visible:= False;

    // Записываем результат в файл patients.dat
    try
      WritePatientDataToFile();
    except
      ShowMessage('Ошибка записи результата в файл patients.dat');
      Exit;
    end;

    // обновляем таблицу с протестированными участниками
    try
      ReadPatientsFromFile();
      PrintDataToStringGrid();
    except
      ShowMessage('Ошибка чтения данных пациентов из файла patients.dat');
      Exit;
    end;

    Exit;
  end;

  GetAndPrintQuestion();

  Inc(PrintQuestionCount);
  Label1.Caption:= IntToStr(PrintQuestionCount) + '\' +
                   IntToStr(Length(QuestionsBaseArray));
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  PrepareFieldsToStartTest();
  Panel2.Visible:= False;
  Label1.Caption:= '';
  Panel1.Enabled:= True;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  PrepareFieldsToStartTest();

  // заполняем базу вопросов
  FillQuestionsBaseArr();

  StringGrid1.ColWidths[0]:= 350;
  StringGrid1.ColWidths[1]:= 70;
  StringGrid1.ColWidths[2]:= 100;
  StringGrid1.ColWidths[3]:= 70;
  StringGrid1.ColWidths[4]:= 50;
  StringGrid1.ColWidths[5]:= 200;
  StringGrid1.ColWidths[6]:= 0;

  StringGrid1.Cells[0,0]:= 'ФИО';
  StringGrid1.Cells[1,0]:= 'Возраст';
  StringGrid1.Cells[2,0]:= 'Дата теста';
  StringGrid1.Cells[3,0]:= 'Пол';
  StringGrid1.Cells[4,0]:= 'Баллы';
  StringGrid1.Cells[5,0]:= 'Интерпретация';

  Label1.Caption:= '';

  // читаем пациентов с файла
  try
    ReadPatientsFromFile();
    PrintDataToStringGrid();
  except
    ShowMessage('Ошибка считывания данных пациентов из файла patients.dat');
  end;
end;

procedure TForm1.GetAndPrintQuestion;
var
  CurrPosInd: Integer;
begin
  RadioButton1.Checked:= False;
  RadioButton2.Checked:= False;
  Button2.Enabled:= False;

  CurrPosInd:= RandomRange(Low(QuestionsArr), Length(QuestionsArr));
  Memo1.Lines.Clear;
  Memo1.Lines.Add(QuestionsArr[CurrPosInd]);

  // удаляем использованный вопрос из массива QuestionsArr
  // переносим последний элемент на место выбранного в индекс CurrPosInd и
  // уменьшаем размер массива на 1
  QuestionsArr[CurrPosInd]:= QuestionsArr[High(QuestionsArr)];
  SetLength(QuestionsArr, Length(QuestionsArr) - 1);
end;

procedure TForm1.PatientClear;
begin
  Patient.FName:= '';
  Patient.FAge:= '';
  Patient.FDate:= '';
  Patient.FGender:= False;
  Patient.FPoints:= 0;
  Patient.FInterpretation:= 1;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
  Button2.Enabled:= True;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
  Button2.Enabled:= True;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  Panel2.Visible:= False;
  Panel1.Enabled:= True;
  Label1.Caption:= '';
end;

procedure TForm1.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if (ACol = 5) and (ARow <> 0) then
  begin
    StringGrid1.Canvas.Font.Color:= clBlack;
    if (StringGrid1.Cells[ACol, ARow] = 'Низкий уровень тревожности') then
      StringGrid1.Canvas.Brush.Color:= RGB(75, 211, 107);
    if (StringGrid1.Cells[ACol, ARow] = 'Средний уровень тревожности') then
      StringGrid1.Canvas.Brush.Color:= RGB(244, 188, 55);
    if (StringGrid1.Cells[ACol, ARow] = 'Высокий уровень тревожности') then
      StringGrid1.Canvas.Brush.Color:= RGB(247, 128, 136);

    StringGrid1.Canvas.FillRect(StringGrid1.CellRect(ACol, ARow));
    StringGrid1.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, StringGrid1.Cells[ACol, ARow]);
  end
end;

// удаление выбранной записи
procedure TForm1.N1Click(Sender: TObject);
var
  SelectUniqueID: Int64;
  i, j, r: Integer;
  TempStr: string;
begin
  if (StringGrid1.Row <= 0) or (StringGrid1.Cells[6, StringGrid1.Row] = '') then
    Exit;

  SelectUniqueID:= StrToInt64(StringGrid1.Cells[6, StringGrid1.Row]);

  // выдаем подтверждающий запрос на удаление
  TempStr:= StringGrid1.Cells[0, StringGrid1.Row] + ' ' +
            StringGrid1.Cells[1, StringGrid1.Row] + ' лет  ' +
            StringGrid1.Cells[2, StringGrid1.Row] + ' ' +
            StringGrid1.Cells[3, StringGrid1.Row] + ' ' +
            StringGrid1.Cells[4, StringGrid1.Row] + ' баллов ' +
            StringGrid1.Cells[5, StringGrid1.Row] + ')' + #13#10 +
            'Будет удален?';

  r:= MessageDlg('Запись: (' + TempStr, mtWarning, [mbOK, mbCancel], 0);

  if (r = 2) then  // 2 - mbCancel
    Exit;

  for i:= Low(PatientsBase) to High(PatientsBase) do
  begin
    // если нашли нужный нам номер, то удаляем эту запись с массива PatientsBase
    if (PatientsBase[i].FUniqueID = SelectUniqueID) then
    begin
      // если это последний эл. массива, то уменьшаем его длину на 1
      if (i = High(PatientsBase)) then
      begin
        SetLength(PatientsBase, Length(PatientsBase) - 1);
      end
      // иначе нужно сдвинуть на 1 позицию влево все элементы,
      // начиная с i+1 и до конца
      else
      begin
        for j:= i + 1 to High(PatientsBase) do
        begin
          PatientsBase[j-1].FName:= PatientsBase[j].FName;
          PatientsBase[j-1].FAge:= PatientsBase[j].FAge;
          PatientsBase[j-1].FDate:= PatientsBase[j].FDate;
          PatientsBase[j-1].FGender:= PatientsBase[j].FGender;
          PatientsBase[j-1].FPoints:= PatientsBase[j].FPoints;
          PatientsBase[j-1].FInterpretation:= PatientsBase[j].FInterpretation;
          PatientsBase[j-1].FUniqueID:= PatientsBase[j].FUniqueID;
        end;

        SetLength(PatientsBase, Length(PatientsBase) - 1);
      end;

      // записываем в файл измененные данные
      WritePatientDataToFile(True);
      ReadPatientsFromFile();
      PrintDataToStringGrid();
    end;
  end;
end;

end.
