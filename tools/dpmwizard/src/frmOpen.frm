VERSION 5.00
Begin VB.Form frmOpen 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "frmOpen"
   ClientHeight    =   5985
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   8760
   Icon            =   "frmOpen.frx":0000
   LinkTopic       =   "Form1"
   MinButton       =   0   'False
   ScaleHeight     =   5985
   ScaleWidth      =   8760
   StartUpPosition =   2  'CenterScreen
   Begin VB.DirListBox lstDir 
      Height          =   3015
      Left            =   480
      TabIndex        =   9
      Top             =   2040
      Width           =   3375
   End
   Begin VB.DriveListBox lstDrive 
      Height          =   315
      Left            =   480
      TabIndex        =   8
      Top             =   1680
      Width           =   3375
   End
   Begin VB.FileListBox lstFile 
      Height          =   3015
      Left            =   4080
      Pattern         =   "--"
      TabIndex        =   7
      Top             =   2040
      Width           =   3225
   End
   Begin VB.TextBox txtPattern 
      Height          =   285
      Left            =   4080
      Locked          =   -1  'True
      TabIndex        =   6
      Text            =   "txtPattern"
      Top             =   1680
      Width           =   3255
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
      TabIndex        =   4
      Top             =   5520
      Width           =   1575
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
      TabIndex        =   3
      Top             =   5520
      Width           =   1575
   End
   Begin VB.PictureBox Picture1 
      BorderStyle     =   0  'None
      Height          =   495
      Left            =   120
      Picture         =   "frmOpen.frx":08CA
      ScaleHeight     =   495
      ScaleWidth      =   495
      TabIndex        =   0
      Top             =   120
      Width           =   495
   End
   Begin VB.Frame Frame2 
      Height          =   975
      Left            =   -1200
      TabIndex        =   5
      Top             =   5280
      Width           =   9975
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
         TabIndex        =   2
         Top             =   360
         Width           =   7815
      End
   End
   Begin VB.Label Label2 
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
      Left            =   360
      TabIndex        =   10
      Top             =   1320
      Width           =   8175
   End
End
Attribute VB_Name = "frmOpen"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'
' Functionality
'

Private Sub btnNext_Click()
    OpenProj_State = OpenProj_Opening
    OpenProj_Path = Me.lstDir.path
    OpenProj_File = Me.lstFile
    SwitchForm Me, frmOpenProgress
End Sub

'
' Controls
'
Private Sub btnPrev_Click()
    SwitchForm Me, frmWizard
End Sub

Private Sub UpdateFileList()
    Me.lstFile.Pattern = Me.txtPattern.tExt
    Me.lstFile.Refresh
    Call AllowExit
End Sub

Private Sub UpdateDirList()
    Me.lstDir.Refresh
End Sub

Private Sub AllowExit()
    If (Me.lstFile.ListIndex >= 0 And Me.lstFile.ListIndex < Me.lstFile.ListCount) Then
        Me.btnNext.Enabled = True
    Else
        Me.btnNext.Enabled = False
    End If
End Sub

Private Sub lstDir_Change()
    Me.lstFile.path = Me.lstDir.path
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

Private Sub Form_Load()
    Dim tPath As String
    
    tPath = FileName_MergePaths(App.path, Program_Archivepath)
    If (Dir(FileName_MergePaths(tPath, "*")) = "") Then tPath = App.path
    
    ' set default path
    Me.lstDrive.Drive = Left(tPath, 2)
    Me.lstDir.path = tPath
    Me.txtPattern.tExt = "*" & Program_ArchiveExt
    Me.lstFile.path = Me.lstDir.path
    Me.lstDrive.Refresh
    Me.lstDir.Refresh
    UpdateFileList
    
    ' load language
    Me.Caption = Str_Com_WindowCaption
    Me.Label1.Caption = Str_WizOpen_Caption
    Me.Label2.Caption = Str_WizOpen_Info
    Me.btnPrev.Caption = Str_Com_Prev
    Me.btnNext.Caption = Str_WizOpen_Open
End Sub

Private Sub lstFile_Click()
    AllowExit
End Sub
