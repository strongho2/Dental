object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 
    #1064#1082#1072#1083#1072' '#1089#1090#1086#1084#1072#1090#1086#1083#1086#1075#1080#1095#1077#1089#1082#1086#1081' '#1090#1088#1077#1074#1086#1078#1085#1086#1089#1090#1080' '#1040'.'#1042'. '#1052#1072#1088#1080#1095#1077#1074#1086#1081' '#8211' '#1040'.'#1070'. '#1050#1086#1085#1076#1088#1072 +
    #1090#1102#1082
  ClientHeight = 572
  ClientWidth = 871
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 708
    Top = 146
    Width = 37
    Height = 16
    Caption = 'Label1'
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 353
    Height = 145
    TabOrder = 0
    object Edit1: TEdit
      Left = 8
      Top = 8
      Width = 337
      Height = 24
      MaxLength = 255
      TabOrder = 0
      TextHint = #1060#1048#1054
    end
    object Edit2: TEdit
      Left = 8
      Top = 38
      Width = 153
      Height = 24
      MaxLength = 3
      NumbersOnly = True
      TabOrder = 1
      TextHint = #1042#1086#1079#1088#1072#1089#1090
    end
    object ComboBox1: TComboBox
      Left = 8
      Top = 68
      Width = 153
      Height = 24
      ItemIndex = 0
      TabOrder = 2
      Text = #1078#1077#1085#1097#1080#1085#1072
      Items.Strings = (
        #1078#1077#1085#1097#1080#1085#1072
        #1084#1091#1078#1095#1080#1085#1072)
    end
    object Edit3: TEdit
      Left = 184
      Top = 38
      Width = 161
      Height = 24
      Enabled = False
      TabOrder = 3
    end
    object Button1: TButton
      Left = 184
      Top = 104
      Width = 161
      Height = 33
      Caption = #1053#1072#1095#1072#1090#1100' '#1090#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 168
    Width = 737
    Height = 169
    TabOrder = 1
    Visible = False
    object SpeedButton1: TSpeedButton
      Left = 352
      Top = 136
      Width = 24
      Height = 24
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1090#1077#1082#1091#1097#1077#1077' '#1090#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Glyph.Data = {
        76050000424D7605000000000000360000002800000015000000150000000100
        18000000000040050000120B0000120B00000000000000000000BFBFD16A6A95
        54537F53527F53517F52517E51507E51507E50507E504F7E504F7E504F7E504F
        7E51507E51507E52517E52517E53527F53527F5554819595A100151776020B8A
        212FB82735BF2D3ABE3340C03A46C1404CC24550C24A54C34C56C34C56C44952
        C3434FC33E49C23744C1303EBF2B39BF2533BB0003822A2A6DFF14167A1F33CF
        0923DE172FDE1F36DF283FE1354AE23C50E44357E5485CE64B5EE64A5DE74659
        E64256E53A4FE32F45E2253CE01C34DE0F29DF1F33CF242573FF20248C1F35DA
        0013D1051DD30920D31129D50A21D41A30D62036D82238D8243AD92439D82239
        D8182ED61027D5142CD60C24D4081FD30016D21F34DA2A2B79FF1D21891E34D8
        0013D30019D3031CD4000FD1364ADC0D25D5091FD40E25D60D24D50E26D6071B
        D4253AD92F43DC000ED1051ED40019D30014D31D32D8282978FF1E228A1F35D9
        0013D2021DD60004CE4352DDF1F2FC97A2ED0014D30016D3031DD40012D21225
        D5C5CBF5E7E9FB2B38D80007CF021DD40014D21E33D9292A78D41E228A1F34D8
        0015D4000FC84F5ACBF6F7FCFEFEFEFFFFFFA0A9EE071AD3000ED10E24D5BBC2
        F3FFFFFFFFFFFFE7ECFB3649DF0013D10017D31E33D9292A79B51E228A1F34D8
        0016D5000CC66168C0FFFFFCFCFDFFFAFAFDFFFFFFA0AAEE2432D7B6BEF2FFFF
        FFFAFAFDFDFDFFFDFDFC4D5BD10010D30017D31E33D9292A79FD1E228A1F35D9
        0012D1031DD80001C65458BBFBFBFAFDFDFEFAFBFDFFFFFFF0F3FCFFFFFFFAFB
        FDFDFEFEF8F8FA4A52C90005CA021DD50014D21E33D9292A79FF1D21891F35D9
        0014D3021BD2041ED80004C64C55BDF8F7F9FCFCFDFCFCFEFFFFFFFBFBFDFCFC
        FDF5F5F84350C80006CC041ED6021BD30015D31E33D9282978FF1E228A1E34D8
        000FD20014D20014D10721D90004C1656DC5FFFFFFFBFBFDFDFDFEFBFBFDFFFF
        FF515ECE000BCC051FD60015D20014D20011D21D32D8292A79001C20892338D9
        1126D5293EDA4052DE4759E06371DCCED2F4FFFFFFFDFDFDFBFBFCFCFCFDFFFF
        FFAAB1F14C5EE14C5EE03E50DE273CDA1126D62035D9282978000D13864B5CDF
        6373E46C7BE56A79E57684E7DBDFF9FFFFFFFDFDFEFEFFFFFFFFFFFEFEFEFCFC
        FEFFFFFFBBC1F36271E5707EE66B7AE56475E54253DE212377FF0A10855364E1
        6F7DE66574E57280E8D6D9F7FFFFFFFAFAFDFEFEFEFAFAFCC5C7E1FEFEFDFEFE
        FFFAFAFDFFFFFFB8BEF25D6DE46876E5707EE7495AE01F2176FF0B11865162E0
        6E7CE85E6BD7BABEE7FFFFFFFBFBFDFFFFFFFEFEFC9BA0D95563D59EA3DAFFFF
        FEFDFDFEFAFAFDFFFFFFB0B8F15D6DE36F7EE64758DF202277000B11865263E1
        6C7BE66775E56C77D2D5D6ECFFFFFFF8F8F9989DD75F6EDF6D7DEB5C6BDD9CA1
        D9FCFBFCFFFFFFD8DCF77381E76675E56E7DE74859E0202277000B11865162E1
        6B7AE56977E66473E66771D1D1D3E99DA2DA5D6DDF6A7AE76877E46A7AE85B6A
        DDA4A9DAD8DBF66676E56372E46977E56D7CE74758DF202277000A10855162E0
        6B7AE56776E46978E56575E76873D36573E06978E86876E46877E66876E46978
        E86573DF6976DC6574E66A78E56776E46D7CE64758DF202277FF0E14895364E2
        6C7AE36977E26978E36A79E36978E56A79E46A78E36978E36978E36978E36A78
        E36A79E46978E46B79E36977E36977E26D7CE4495AE1222478000002733E4ED3
        6476F26576EF6576EF6677F06677F06677F06677F06677F06677F06677F06677
        F06677F06677F06677F06576EF6576EF687AF23546D01D1F73FF6665A0141882
        1B2297171F961820961820961820961820961820961820961820961820961820
        96182096182096182096182096171F961B23960F14819494B7FF}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object Memo1: TMemo
      Left = 8
      Top = 8
      Width = 721
      Height = 113
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object RadioButton1: TRadioButton
      Left = 8
      Top = 144
      Width = 41
      Height = 17
      Caption = #1044#1040
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Left = 96
      Top = 144
      Width = 49
      Height = 17
      Caption = #1053#1045#1058
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = RadioButton2Click
    end
    object Button2: TButton
      Left = 184
      Top = 136
      Width = 137
      Height = 25
      Caption = #1057#1083#1077#1076#1091#1102#1097#1080#1081' '#1074#1086#1087#1088#1086#1089
      TabOrder = 3
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 512
      Top = 136
      Width = 209
      Height = 25
      Caption = #1055#1088#1086#1081#1090#1080' '#1085#1086#1074#1086#1077' '#1090#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      Visible = False
      OnClick = Button3Click
    end
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 360
    Width = 871
    Height = 212
    Align = alBottom
    ColCount = 7
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected]
    PopupMenu = PopupMenu1
    TabOrder = 2
    OnDrawCell = StringGrid1DrawCell
  end
  object PopupMenu1: TPopupMenu
    Left = 576
    Top = 376
    object N1: TMenuItem
      Caption = #1091#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      OnClick = N1Click
    end
  end
end
