VERSION 5.00
Begin VB.Form frmWizard 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "frmWizard"
   ClientHeight    =   5985
   ClientLeft      =   150
   ClientTop       =   540
   ClientWidth     =   8760
   Icon            =   "Wizard.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   5985
   ScaleMode       =   0  'User
   ScaleWidth      =   8878.914
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton btnAbout 
      Caption         =   "btnAbout"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3480
      TabIndex        =   13
      Top             =   5520
      Width           =   1575
   End
   Begin VB.CommandButton btnExit 
      Caption         =   "btnExit"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   11
      Top             =   5520
      Width           =   1575
   End
   Begin VB.CommandButton btnOptions 
      Caption         =   "btnOptions"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1800
      TabIndex        =   10
      Top             =   5520
      Width           =   1575
   End
   Begin VB.Frame choose 
      BorderStyle     =   0  'None
      Height          =   3735
      Left            =   120
      TabIndex        =   5
      Top             =   1200
      Width           =   8535
      Begin VB.OptionButton Option3 
         Caption         =   "Option3"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   480
         TabIndex        =   12
         Top             =   1200
         Value           =   -1  'True
         Width           =   7935
      End
      Begin VB.OptionButton Option2 
         Caption         =   "Option2"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   480
         TabIndex        =   9
         Top             =   720
         Width           =   7935
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Option1"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   480
         TabIndex        =   8
         Top             =   240
         Width           =   7935
      End
      Begin VB.OptionButton Option4 
         Caption         =   "Option4"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   480
         TabIndex        =   7
         Top             =   1680
         Width           =   7935
      End
      Begin VB.OptionButton Option5 
         Caption         =   "Option5"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   480
         TabIndex        =   6
         Top             =   2160
         Width           =   8055
      End
   End
   Begin VB.PictureBox Picture1 
      BorderStyle     =   0  'None
      Height          =   495
      Left            =   120
      Picture         =   "Wizard.frx":08CA
      ScaleHeight     =   495
      ScaleWidth      =   495
      TabIndex        =   2
      Top             =   120
      Width           =   495
   End
   Begin VB.Frame Frame3 
      Caption         =   "Frame3"
      Height          =   975
      Left            =   -720
      TabIndex        =   0
      Top             =   5280
      Width           =   10335
      Begin VB.CommandButton btnNext 
         Caption         =   "btnNext"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   7800
         TabIndex        =   4
         Top             =   240
         Width           =   1575
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Frame3"
      Height          =   855
      Left            =   -720
      TabIndex        =   1
      Top             =   -120
      Width           =   10335
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Label1"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   204
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   1560
         TabIndex        =   3
         Top             =   360
         Width           =   7815
      End
   End
End
Attribute VB_Name = "frmWizard"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub btnNext_Click()
    Compilation_IniFile = App.path & "\" & Program_LastBuildIni
    
    If (Me.Option1.Value = True) Then
        Call ProjectClear
        Program_Action = dpgActionCreate
        Call SaveAppConfig
        SwitchForm Me, frmWizardCreate
        Exit Sub
    End If
    
    If (Me.Option2.Value = True) Then
        Call ProjectLoadIni
        Program_Action = dpgActionContinue
        Call SaveAppConfig
        SwitchForm Me, frmWizardCreate
        Exit Sub
    End If
    
    If (Me.Option3.Value = True) Then
        Call ProjectLoadIni
        Select Case Compilation_Format
            Case dpgFormatSMD
                SwitchForm Me, frmWizardSMDbuildDPM
            Case dpgFormatMD5
                SwitchForm Me, frmWizardMD5
        End Select
        Program_Action = dpgActionRebuild
        Call SaveAppConfig
    End If
    
    If (Me.Option4.Value = True) Then
        Program_Action = dpgActionOpen
        SwitchForm Me, frmOpen
        Call SaveAppConfig
        Exit Sub
    End If
    
    If (Me.Option5.Value = True) Then
        Program_Action = dpgActionView
        SwitchForm Me, frmPreview
        Call SaveAppConfig
        Exit Sub
    End If
End Sub

Private Sub btnOptions_Click()
    SwitchForm Me, frmWizardOptions
End Sub

Private Sub Form_Activate()
    Me.Option1.SetFocus
    
    ' select default option
    Me.Option1.Value = False
    Me.Option2.Value = False
    Me.Option3.Value = False
    Me.Option4.Value = False
    Me.Option5.Value = False
    Select Case Program_Action
        Case dpgActionContinue
            Me.Option2.Value = True
            Me.Option2.SetFocus
        Case dpgActionRebuild
            Me.Option3.Value = True
            Me.Option3.SetFocus
        Case dpgActionOpen
            Me.Option4.Value = True
            Me.Option4.SetFocus
        Case dpgActionView
            Me.Option5.Value = True
            Me.Option5.SetFocus
        Case Else
            Me.Option1.Value = True
            Me.Option1.SetFocus
    End Select
    
    ' enable-disabe certain options
    If (ProjectCheckIni(App.path & "\" & Program_LastBuildIni) = False) Then
        Me.Option2.Enabled = False
        Me.Option3.Enabled = False
        If (Me.Option2.Value = True) Then
            Me.Option2.Value = False
            Me.Option1.Value = True
        End If
        If (Me.Option3.Value = True) Then
            Me.Option3.Value = False
            Me.Option1.Value = True
        End If
    Else
        Me.Option2.Enabled = True
    End If
End Sub

Private Sub Form_Deactivate()
    Unload Me
End Sub

Private Sub btnExit_Click()
    Unload Me
End Sub

Private Sub Form_Load()
    Call LoadAppConfig
    
    ' load language
    Me.Caption = Str_Com_WindowCaption
    Me.Label1.Caption = Str_Wiz_Caption
    Me.btnAbout.Caption = Str_Com_About
    Me.btnExit.Caption = Str_Com_Exit
    Me.btnNext.Caption = Str_Com_Next
    Me.btnOptions.Caption = Str_Com_Options
    Me.Option1.Caption = Str_Wiz_PathNew
    Me.Option2.Caption = Str_Wiz_PathContinueLast
    Me.Option3.Caption = Str_Wiz_PathBuildLast
    Me.Option4.Caption = Str_Wiz_Open
    Me.Option5.Caption = Str_Wiz_Preview
End Sub

Private Sub btnAbout_Click()
    SwitchForm Me, frmAbout
End Sub

