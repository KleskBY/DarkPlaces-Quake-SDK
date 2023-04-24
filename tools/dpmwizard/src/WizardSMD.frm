VERSION 5.00
Begin VB.Form frmWizardSMD 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "frmWizardSMD"
   ClientHeight    =   5985
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   8760
   Icon            =   "WizardSMD.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   5985
   ScaleWidth      =   8760
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox Picture1 
      BorderStyle     =   0  'None
      Height          =   495
      Left            =   120
      Picture         =   "WizardSMD.frx":08CA
      ScaleHeight     =   495
      ScaleWidth      =   495
      TabIndex        =   11
      Top             =   120
      Width           =   495
   End
   Begin VB.CommandButton cmdRem 
      Caption         =   "<<"
      Enabled         =   0   'False
      Height          =   1095
      Left            =   5400
      TabIndex        =   9
      Top             =   3600
      Width           =   495
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   ">>"
      Enabled         =   0   'False
      Height          =   975
      Left            =   5400
      TabIndex        =   8
      Top             =   2280
      Width           =   495
   End
   Begin VB.ListBox lstAnim 
      Height          =   2985
      ItemData        =   "WizardSMD.frx":1194
      Left            =   6000
      List            =   "WizardSMD.frx":1196
      TabIndex        =   7
      Top             =   1800
      Width           =   2415
   End
   Begin VB.TextBox txtPattern 
      Height          =   285
      Left            =   3000
      Locked          =   -1  'True
      TabIndex        =   5
      Text            =   "*.smd"
      Top             =   1800
      Width           =   2295
   End
   Begin VB.FileListBox lstFile 
      Height          =   2625
      Left            =   3000
      Pattern         =   "--"
      TabIndex        =   4
      Top             =   2160
      Width           =   2265
   End
   Begin VB.DriveListBox lstDrive 
      Height          =   315
      Left            =   360
      TabIndex        =   3
      Top             =   4480
      Width           =   2535
   End
   Begin VB.DirListBox lstDir 
      Height          =   2565
      Left            =   360
      TabIndex        =   2
      Top             =   1800
      Width           =   2535
   End
   Begin VB.CommandButton btnPrev 
      Caption         =   "btnPrev"
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
      TabIndex        =   1
      Top             =   5520
      Width           =   1575
   End
   Begin VB.CommandButton btnNext 
      Caption         =   "btnNext"
      Enabled         =   0   'False
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
      Left            =   7080
      TabIndex        =   0
      Top             =   5520
      Width           =   1575
   End
   Begin VB.Frame Frame1 
      Height          =   975
      Left            =   -1200
      TabIndex        =   10
      Top             =   5280
      Width           =   9975
   End
   Begin VB.Frame Frame2 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Frame3"
      Height          =   855
      Left            =   -720
      TabIndex        =   12
      Top             =   -120
      Width           =   10335
      Begin VB.Label Label9 
         BackStyle       =   0  'Transparent
         Caption         =   "Label9"
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
         TabIndex        =   13
         Top             =   360
         Width           =   7815
      End
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      Caption         =   "Label6"
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
      Left            =   6000
      TabIndex        =   17
      Top             =   1440
      Width           =   2415
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      Caption         =   "Label5"
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
      Left            =   6000
      TabIndex        =   16
      Top             =   1200
      Width           =   2535
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      Caption         =   "Label4"
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
      Left            =   6000
      TabIndex        =   15
      Top             =   960
      Width           =   2415
   End
   Begin VB.Label Label3 
      Caption         =   "Model animation list"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   0
      TabIndex        =   14
      Top             =   0
      Width           =   2415
   End
   Begin VB.Label Label1 
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
      Left            =   360
      TabIndex        =   6
      Top             =   1440
      Width           =   4935
   End
End
Attribute VB_Name = "frmWizardSMD"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' pick animatiobs from controls
Private Sub SaveControls()
    Dim tPos As Integer
    
    ' animations path
    Compilation_ScriptAnimPath = Me.lstDir.path
    
    ' animations list
    Compilation_ScriptAnimlistCount = Me.lstAnim.ListCount
    tPos = 0
    Do While (tPos < Me.lstAnim.ListCount)
        Compilation_ScriptAnimlist(tPos) = Me.lstAnim.List(tPos)
        tPos = tPos + 1
    Loop
    
    ' get default modelname
    If (Compilation_Action = dpgActionCreate) Then
        Compilation_ScriptModelName = LCase(FileName_StripPath(FileName_StripExt(Compilation_ScriptAnimlist(0))))
    End If
End Sub

Private Function LoadControls_LoadPath() As Boolean
    On Error GoTo Error
    
    Me.lstDrive.Drive = Left(Compilation_ScriptAnimPath, 2)
    Me.lstDir.path = Mid(Compilation_ScriptAnimPath, 3, 10000)
    Me.lstFile.path = Me.lstDir.path
    Me.lstDrive.Refresh
    Me.lstDir.Refresh
    LoadControls_LoadPath = True
Quit:
    Exit Function
Error:
    MsgBox "Path " & Compilation_ScriptAnimPath & " not found", vbCritical, "Warning"
    Me.lstDrive.Drive = Left(App.path, 2)
    Me.lstDir.path = Mid(App.path, 3, 10000)
    Me.lstFile.path = Me.lstDir.path
    Me.lstDrive.Refresh
    Me.lstDir.Refresh
    LoadControls_LoadPath = False
    Resume Quit
End Function

' load previously used animations to controls
Private Sub LoadControls()
    Dim tPos As Integer
    
    ' animations path
    If (LoadControls_LoadPath = False) Then Exit Sub
    
    ' animations list
    Me.lstAnim.Clear
    tPos = 0
    Do While (tPos < Compilation_ScriptAnimlistCount)
        Me.lstAnim.AddItem Compilation_ScriptAnimlist(tPos)
        tPos = tPos + 1
    Loop
End Sub

Private Sub btnNext_Click()
    SwitchForm Me, frmWizardSMDbuild
    Call SaveControls
End Sub

'
' Editing animations
'

Private Sub btnPrev_Click()
    SwitchForm Me, frmWizardCreate
End Sub

Private Sub UpdateFileList()
    Me.lstFile.Pattern = Me.txtPattern.tExt
    Me.lstFile.Refresh
    
    If (Me.lstFile.ListCount > 0) Then
        Me.cmdAdd.Enabled = True
    Else
        Me.cmdAdd.Enabled = False
    End If
End Sub

Private Sub UpdateAnimList()
    Me.lstAnim.Refresh
    
    ' allow-deny add button
    If (Me.lstAnim.ListCount > 0) Then
        Me.cmdRem.Enabled = True
    Else
        Me.cmdRem.Enabled = False
    End If
End Sub

Private Sub UpdateDirList()
    Me.lstDir.Refresh
End Sub

Private Sub AllowExit()
    If (Me.lstAnim.ListCount > 0) Then
        Me.btnNext.Enabled = True
    Else
        Me.btnNext.Enabled = False
    End If
End Sub

Private Sub cmdAdd_Click()
    If (Me.lstFile.ListCount <= 0) Then Exit Sub
    
    Me.lstAnim.AddItem Me.lstFile.fileName
    Call AllowExit
    Call UpdateAnimList
End Sub

Private Sub cmdRem_Click()
    If (Me.lstAnim.ListCount <= 0) Then Exit Sub
    If (Me.lstAnim.ListIndex < 0 Or Me.lstAnim.ListIndex > Me.lstAnim.ListCount) Then Exit Sub
    
    Me.lstAnim.RemoveItem Me.lstAnim.ListIndex
    Call AllowExit
    Call UpdateAnimList
End Sub

Private Sub lstDir_Change()
    Me.lstFile.path = Me.lstDir.path
    Me.lstAnim.Clear
    Call AllowExit
    Call UpdateFileList
End Sub

Private Sub lstDrive_Change()
    Me.lstDir.path = Me.lstDrive.Drive
    Me.lstDir.Refresh
End Sub

Private Sub Form_Deactivate()
    Unload Me
End Sub

Private Sub Form_Activate()
    Call LoadControls
    Call AllowExit
    Call UpdateFileList
End Sub

Private Sub Form_Load()
    ' load language
    Me.btnNext.Caption = Str_Com_Next
    Me.btnPrev.Caption = Str_Com_Prev
    Me.Label9.Caption = Str_WizSMD_Caption
    Me.Label1.Caption = Str_WizSMD_InfoSource
    Me.Label4.Caption = Str_WizSMD_InfoAnimList1
    Me.Label5.Caption = Str_WizSMD_InfoAnimList2
    Me.Label6.Caption = Str_WizSMD_InfoAnimList3
End Sub

