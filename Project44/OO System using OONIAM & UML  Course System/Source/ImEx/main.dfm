object Mainform: TMainform
  Left = 76
  Top = 57
  BorderStyle = bsDialog
  Caption = 'Customize'
  ClientHeight = 459
  ClientWidth = 643
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Courier New'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF006666
    66666EE7866EE6666666666677B766666E66E6E68EEEEE66666666687BB78666
    EEEEE66EE6EEEE66666666687878766EE6E6EE6EE66EEE66EE6667777777666E
    EE6E6EEEE666EE6666E68787777868666EEEE766E6EEE6E6E6EE877787866766
    E8EEEE6EE786EEEEEEEE877777786686EEEEE886EE8E8EEEE6E887F777876676
    6EEEEE76766E8666EE7777F7777766666EE6E7E8776E7E67E77B77E777776666
    6EEEEE777686E8EE7F777766777866686866868778E6E8E77777786666666667
    6866EE77E7886EE7FF7787666688666668888777887E8E777778B77766876666
    67EE7E77EEE8E6E7777777887F7766666676EEEE7E7E87E777F7778877776666
    6668888E678EEEE777788787777866666667EE8E77776887777777BB77776666
    666678888888E67777F77BB7B77766666666686EE787EE77777787BBB7776666
    666666788786E87F7BB778BB7777666666666667887778787FF777777B776666
    6666666678E777F7878F7777887766666666666667EE7EFB87877777777B6666
    666666666678887777F7777777786666666666666666778777F7777777786666
    66666666666667888777F77777776666666666666666667868777B7778B76666
    6666666666666666677877877888666666666666666666666667878887876666
    6666666666666666666667777783666666666666666666666666666677870000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object TabCustomize2: TPageControl
    Left = 0
    Top = 0
    Width = 643
    Height = 459
    ActivePage = TabCustomize1
    Align = alClient
    MultiLine = True
    TabHeight = 25
    TabIndex = 0
    TabOrder = 0
    object TabCustomize1: TTabSheet
      Caption = 'Customize : &Course'
      ImageIndex = 2
      object Label1: TLabel
        Left = 26
        Top = 69
        Width = 48
        Height = 16
        Caption = 'method'
      end
      object Label3: TLabel
        Left = 25
        Top = 37
        Width = 40
        Height = 16
        Caption = 'class'
      end
      object memCustomCourse: TMemo
        Left = 24
        Top = 96
        Width = 513
        Height = 273
        ScrollBars = ssBoth
        TabOrder = 0
        WantTabs = True
        WordWrap = False
      end
      object cmbCanCustomCourse: TReferenceComboBox
        Left = 86
        Top = 32
        Width = 451
        Height = 24
        Style = csDropDownList
        ItemHeight = 16
        TabOrder = 1
        OnClick = cmbCanCustomCourseClick
      end
      object btnTestCourse: TButton
        Left = 552
        Top = 96
        Width = 75
        Height = 25
        Caption = 'Compile'
        TabOrder = 2
        OnClick = btnTestCourseClick
      end
      object btnRegisterCourse: TButton
        Left = 552
        Top = 128
        Width = 75
        Height = 25
        Caption = 'Register'
        TabOrder = 3
        OnClick = btnRegisterCourseClick
      end
      object btnNewCourse: TButton
        Left = 552
        Top = 32
        Width = 75
        Height = 25
        Caption = 'New'
        TabOrder = 4
        OnClick = btnNewCourseClick
      end
      object cmbMethodCourse: TComboBox
        Left = 86
        Top = 64
        Width = 451
        Height = 24
        Style = csDropDownList
        ItemHeight = 16
        TabOrder = 5
        OnClick = cmbMethodCourseClick
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Customize : &Subject'
      ImageIndex = 4
      object Label5: TLabel
        Left = 25
        Top = 37
        Width = 40
        Height = 16
        Caption = 'class'
      end
      object Label6: TLabel
        Left = 26
        Top = 69
        Width = 48
        Height = 16
        Caption = 'method'
      end
      object cmbMethodSubject: TComboBox
        Left = 86
        Top = 64
        Width = 451
        Height = 24
        Style = csDropDownList
        ItemHeight = 0
        TabOrder = 0
        OnClick = cmbMethodSubjectClick
      end
      object cmbCanCustomSubject: TReferenceComboBox
        Left = 86
        Top = 32
        Width = 451
        Height = 24
        Style = csDropDownList
        ItemHeight = 0
        TabOrder = 1
        OnClick = cmbCanCustomSubjectClick
      end
      object memCustomSubject: TMemo
        Left = 24
        Top = 96
        Width = 513
        Height = 273
        TabOrder = 2
        WantTabs = True
      end
      object btnNewSubject: TButton
        Left = 552
        Top = 32
        Width = 75
        Height = 25
        Caption = 'New'
        TabOrder = 3
        OnClick = btnNewSubjectClick
      end
      object btnTestSubject: TButton
        Left = 552
        Top = 96
        Width = 75
        Height = 25
        Caption = 'Compile'
        TabOrder = 4
        OnClick = btnTestSubjectClick
      end
      object btnRegisterSubject: TButton
        Left = 552
        Top = 128
        Width = 75
        Height = 25
        Caption = 'Register'
        TabOrder = 5
        OnClick = btnRegisterSubjectClick
      end
    end
    object TabDomain: TTabSheet
      Caption = '&Domain'
      ImageIndex = 3
      object Label4: TLabel
        Left = 16
        Top = 32
        Width = 72
        Height = 16
        Caption = 'Available'
      end
      object ListView: TListView
        Left = 16
        Top = 64
        Width = 513
        Height = 265
        Checkboxes = True
        Columns = <>
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ReadOnly = True
        RowSelect = True
        ParentFont = False
        TabOrder = 0
        ViewStyle = vsReport
        OnDblClick = ListViewDblClick
      end
      object Button2: TButton
        Left = 544
        Top = 80
        Width = 75
        Height = 25
        Caption = 'Add'
        TabOrder = 1
      end
      object Button3: TButton
        Left = 544
        Top = 120
        Width = 75
        Height = 25
        Caption = 'Delete'
        TabOrder = 2
        OnClick = Button3Click
      end
      object cmbType: TComboBox
        Left = 96
        Top = 30
        Width = 145
        Height = 24
        Style = csDropDownList
        ItemHeight = 16
        TabOrder = 3
        OnChange = cmbTypeChange
        Items.Strings = (
          'Grades'
          'Religion'
          'DayWork'
          'Period'
          'Position Graduate')
      end
    end
    object TabExport: TTabSheet
      Caption = '&Export'
      ImageIndex = 1
      object T: TLabel
        Left = 16
        Top = 8
        Width = 112
        Height = 16
        Caption = 'Target Folder:'
      end
      object edTarget: TEdit
        Left = 18
        Top = 28
        Width = 519
        Height = 24
        TabOrder = 0
      end
      object btnExport: TButton
        Left = 512
        Top = 391
        Width = 113
        Height = 25
        Caption = '&Start Export'
        TabOrder = 1
        OnClick = btnExportClick
      end
      object btnConnect: TButton
        Left = 548
        Top = 28
        Width = 75
        Height = 23
        Caption = '&Load'
        TabOrder = 2
        OnClick = btnConnectClick
      end
      object lstClasses: TListView
        Left = 16
        Top = 64
        Width = 609
        Height = 305
        Checkboxes = True
        Columns = <
          item
            Caption = 'Class Name'
            Width = 150
          end
          item
            Caption = 'Path'
            Width = 260
          end
          item
            Caption = 'Status'
            Width = 80
          end>
        ReadOnly = True
        RowSelect = True
        SortType = stData
        TabOrder = 3
        ViewStyle = vsReport
      end
    end
    object TabImport: TTabSheet
      Caption = '&Import'
      object Label2: TLabel
        Left = 16
        Top = 8
        Width = 112
        Height = 16
        Caption = 'Source Folder:'
      end
      object lstImportClass: TListView
        Left = 16
        Top = 64
        Width = 609
        Height = 305
        Checkboxes = True
        Columns = <
          item
            Caption = 'Class Name'
            Width = 150
          end
          item
            Caption = 'Super'
            Width = 150
          end
          item
            Caption = 'Path'
            Width = 200
          end
          item
            Caption = 'Status'
            Width = 80
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
      object edSource: TEdit
        Left = 18
        Top = 28
        Width = 519
        Height = 24
        TabOrder = 1
      end
      object btnImport: TButton
        Left = 512
        Top = 391
        Width = 113
        Height = 25
        Caption = '&Start Import'
        TabOrder = 2
        OnClick = btnImportClick
      end
      object Button1: TButton
        Left = 548
        Top = 28
        Width = 75
        Height = 23
        Caption = '&Browse'
        TabOrder = 3
        OnClick = btnLoadClick
      end
    end
  end
  object PanelProgress: TPanel
    Left = 24
    Top = 403
    Width = 481
    Height = 44
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    object ProgressBar: TProgressBar
      Left = 0
      Top = 24
      Width = 481
      Height = 20
      Align = alBottom
      Min = 0
      Max = 100
      ParentShowHint = False
      Smooth = True
      Step = 1
      ShowHint = True
      TabOrder = 0
    end
    object prg: TStaticText
      Left = 0
      Top = 0
      Width = 481
      Height = 19
      Align = alTop
      AutoSize = False
      TabOrder = 1
    end
  end
end
