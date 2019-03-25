object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 322
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 216
    Width = 431
    Height = 98
    TabOrder = 1
  end
  object Memo2: TMemo
    Left = 8
    Top = 39
    Width = 431
    Height = 171
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    Lines.Strings = (
      'begin'
      '  MyVar := MyVar + 444;'
      '  MyProc(IntToStr(MyVar));'
      'end.')
    ParentFont = False
    TabOrder = 2
  end
  object CE: TPSScript
    CompilerOptions = []
    OnLine = CELine
    OnCompile = CECompile
    OnExecute = CEExecute
    Plugins = <>
    UsePreProcessor = True
    Left = 88
    Top = 8
  end
end
