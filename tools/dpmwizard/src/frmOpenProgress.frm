VERSION 5.00
Begin VB.Form frmOpenProgress 
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   990
   ClientLeft      =   45
   ClientTop       =   45
   ClientWidth     =   4905
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Icon            =   "frmOpenProgress.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   990
   ScaleWidth      =   4905
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer OpenTimer 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   4080
      Top             =   360
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Caption         =   "Label3"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00404040&
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   675
      Width           =   4695
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "Label2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00404040&
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   360
      Width           =   4695
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00404040&
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   60
      Width           =   4695
   End
End
Attribute VB_Name = "frmOpenProgress"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'
' Functionality
'

Private OpenWait As Integer '0 - not waiting, 1 -waiting, 2 - finished

Private Sub BeginOpening()
    Dim tDeleted As Boolean
    Dim tUtil As String
    
    ' clear the opened dir
    tDeleted = DelDirTree(Program_Openpath)
    CreateDirTree (Program_Openpath)
    ' extract the archive to opened path
    ChDir (OpenProj_Path)
    tUtil = FileName_MergePaths(App.path, Program_ToolPath7Z)
    tUtil = tUtil & " e  " & OpenProj_File & " -o" & Chr(34) & FileName_MergePaths(App.path, Program_Openpath) & Chr(34) & " -y"
    Shell tUtil, vbMinimizedNoFocus
    ChDir (App.path)
    
    ' wait for build.dpmwiz file get extracted
    OpenWait = 1
    OpenTimer.Enabled = True
    OpenTimer.Interval = 100
End Sub

Private Sub DoOpen()
    Dim tIni As New clsINI
    
    
    ' fix the paths in .dpmwiz
    Compilation_IniFile = FileName_MergePaths(App.path, FileName_MergePaths(Program_Openpath, "build.dpmwiz"))
    ProjectLoadIni
    Compilation_ScriptAnimPath = FileName_MergePaths(App.path, Program_Openpath)
    ProjectSaveIni
    Compilation_IniFile = App.path & "\" & Program_LastBuildIni
    
    ' load it
    Select Case Compilation_Format
        Case dpgFormatSMD
            SwitchForm Me, frmWizardSMD
        Case dpgFormatMD5
            SwitchForm Me, frmWizardMD5
    End Select
End Sub

' wait for all files get extracted
Private Sub DoOpenWait()
    If (OpenWait = 1) Then
        If (Dir(FileName_MergePaths(App.path, FileName_MergePaths(Program_Openpath, "build.dpmwiz"))) <> "") Then
            ' found
            OpenWait = 2
        End If
        Exit Sub
    End If
    If (OpenWait = 2) Then
       DoOpen
       OpenWait = 0
       OpenTimer.Enabled = False
    End If
End Sub

'
' Controls
'

Private Sub Form_Activate()
    BeginOpening
End Sub

Private Sub Form_Deactivate()
    Unload Me
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    If (KeyAscii = vbKeyEscape) Then
        OpenProj_State = OpenProj_No
        SwitchForm Me, frmOpen
    End If
End Sub

Private Sub Form_Load()
    ' load lang
    Me.Label1.Caption = Str_WizOpenProg_Caption
    Me.Label2.Caption = Str_WizOpenProg_SubCaption & " " & OpenProj_File & "..."
    Me.Label3.Caption = Str_WizOpenProg_Cancel
End Sub

Private Sub OpenTimer_Timer()
    DoOpenWait
End Sub
