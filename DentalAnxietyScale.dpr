program DentalAnxietyScale;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {Form1},
  QuestionsUnit in 'QuestionsUnit.pas',
  GeneralMethods in 'GeneralMethods.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
