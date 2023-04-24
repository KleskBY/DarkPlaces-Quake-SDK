VERSION 5.00
Begin VB.Form frmWizardSMDbuildDPM 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "frmWizardSMDbuildDPM"
   ClientHeight    =   5985
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   8760
   Icon            =   "WizardSMDbuildDPM.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   5985
   ScaleWidth      =   8760
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton btnPrev 
      Caption         =   "btnPrev"
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
      Left            =   120
      TabIndex        =   11
      Top             =   5520
      Width           =   1815
   End
   Begin VB.CommandButton btnStopBuild 
      Caption         =   "btnStopBuild"
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
      Left            =   3960
      TabIndex        =   10
      Top             =   4800
      Width           =   1815
   End
   Begin VB.CommandButton btnOpenBuildDir 
      Caption         =   "btnOpenBuildDir"
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
      Left            =   6240
      TabIndex        =   9
      Top             =   4800
      Width           =   2415
   End
   Begin VB.PictureBox Picture1 
      BorderStyle     =   0  'None
      Height          =   495
      Left            =   120
      Picture         =   "WizardSMDbuildDPM.frx":08CA
      ScaleHeight     =   495
      ScaleWidth      =   495
      TabIndex        =   6
      Top             =   120
      Width           =   495
   End
   Begin VB.Timer BuildTimer 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   4080
      Top             =   5520
   End
   Begin VB.CommandButton btnExit 
      Caption         =   "btnExit"
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
      Left            =   6840
      TabIndex        =   4
      Top             =   5520
      Width           =   1815
   End
   Begin VB.CommandButton btnRebuild 
      Caption         =   "btnRebuild"
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
      Left            =   2040
      TabIndex        =   3
      Top             =   4800
      Width           =   1815
   End
   Begin VB.CommandButton btnPreview 
      Caption         =   "btnPreview"
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
      Left            =   120
      TabIndex        =   2
      Top             =   4800
      Width           =   1815
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
      Left            =   4920
      TabIndex        =   1
      Top             =   5520
      Width           =   1815
   End
   Begin VB.TextBox txtLog 
      Height          =   3855
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   840
      Width           =   8535
   End
   Begin VB.Frame Frame1 
      Height          =   975
      Left            =   -1080
      TabIndex        =   5
      Top             =   5280
      Width           =   9975
   End
   Begin VB.Frame Frame2 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Frame3"
      Height          =   855
      Left            =   -720
      TabIndex        =   7
      Top             =   -120
      Width           =   10335
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "Label3"
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
         TabIndex        =   8
         Top             =   360
         Width           =   5655
      End
   End
End
Attribute VB_Name = "frmWizardSMDbuildDPM"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

'
' build
'

Const BuildNotActive = 0
Const BuildActive = 1
Const BuildFinished = 2

Private RunBuild_Active As Integer ' 0 if not started, 1 if in progress, 2 if finished
Private RunBuild_File As String
Private CreateBackPathP As String
Private BuildObj As clsBuild

' for deal with _norm, _glow etc
Private Function CopyTexture(ByVal tPath, ByVal tString As String, tWarn As Boolean) As Boolean
    On Error GoTo Error
    
    ' check for copy success
    CopyTexture = True
    If (Dir(FileName_MergePaths(tPath, tString)) = "") Then
        CopyTexture = False
        Exit Function
    End If
    
    If (tWarn = False) Then
        ' just exit if source file not exists
        If (CopyTexture = False) Then Exit Function
    End If
    
    ' copy texture to source
    BuildObj.AddFile FileName_MergePaths(tPath, tString), "src", False
    ' copy texture to output model (auto-convert to tga)
    tExtension = FileName_GetExt(tString)
    If (tExtension = ".jpg" Or tExtension = ".tga" Or tExtension = ".png") Then ' known file types, don't convert
        BuildObj.AddFile FileName_MergePaths(tPath, tString), Compilation_ScriptModelPath, False
    Else ' convert to tga
        Shell FileName_MergePaths(App.path, Program_ToolImgConvert) & " " & FileName_MergePaths(tPath, tString) & " " & FileName_MergePaths(BuildObj.path, FileName_MergePaths(Compilation_ScriptModelPath, FileName_StripPath(FileName_StripExt(tString) & ".tga"))), vbMinimizedNoFocus
    End If
Quit:
    Exit Function
Error:
    Resume Quit
End Function

Private Sub CopyTextureLayer(ByVal tPath, ByVal tString As String, ByVal tLayerName)
    Dim tNameNoExt, tStrPath As String
    
    On Error GoTo Error
    
    tNameNoExt = FileName_StripPath(FileName_StripExt(tString))
    tStrPath = FileName_GetPath(tString)
    
    ' todo: check jpg, tga, png
    If (tStrPath <> "") Then
        If (CopyTexture(tPath, FileName_MergePaths(tStrPath, tNameNoExt & tLayerName & ".png"), False) = False) Then
            If (CopyTexture(tPath, FileName_MergePaths(tStrPath, tNameNoExt & tLayerName & ".tga"), False) = False) Then
                CopyTexture tPath, FileName_MergePaths(tStrPath, tNameNoExt & tLayerName & ".jpg"), False
            End If
        End If
    Else
        If (CopyTexture(tPath, tNameNoExt & tLayerName & ".png", False) = False) Then
            If (CopyTexture(tPath, tNameNoExt & tLayerName & ".tga", False) = False) Then
                CopyTexture tPath, tNameNoExt & tLayerName & ".jpg", False
            End If
        End If
    End If
Quit:
    Exit Sub
Error:
    Resume Quit
End Sub

Private Sub RunBuild()
    Dim tPos As Integer
    Dim tFile, tString, tExtension, tOldIni As String

    ' create build object
    Set BuildObj = New clsBuild
    Me.BuildTimer.Enabled = False
    
    ' lock buttons
    Me.btnPreview.Enabled = False
    Me.btnRebuild.Enabled = False
    Me.btnOpenBuildDir.Enabled = False
    Me.btnStopBuild.Enabled = True
    Me.btnNext.Enabled = False
    Me.btnPrev.Enabled = False
    Me.btnExit.Enabled = False
    
    ' init build
    BuildObj.Init "SMD2DPM", Me.txtLog, Me.BuildTimer
    ' make sure 'archive' dir exists
    If (Compilation_BuilkPk3 <> dpgFlagNo) Then
        If (Compilation_SaveProject = dpgFlagYes) Then
            ChDir (App.path)
            CreateDirTree Program_Archivepath
        End If
    End If
    If (BuildObj.NewPass(Str_WizSMDbuildDPM_Init) = False) Then GoTo Build_Error
    BuildObj.UsePath App.path, Program_Buildpath
    If (BuildObj.IsError = True) Then
        BuildObj.AddLogLine Str_WizSMDbuildDPM_InitError
        GoTo Build_Error
    End If
    BuildObj.CreatePath Compilation_ScriptModelPath
    BuildObj.CreatePath "src"

    
    ' check nesessary tools
    If (BuildObj.NewPass(Str_WizSMDbuildDPM_CheckTools) = False) Then GoTo Build_Error
    BuildObj.CheckFile FileName_MergePaths(App.path, Program_ToolPathSMD2DPM), True
    BuildObj.CheckFile FileName_MergePaths(App.path, Program_ToolPath7Z), False
    BuildObj.CheckFile FileName_MergePaths(App.path, Program_ToolPathDPMView), False
    
    ' copy source files
    If (BuildObj.NewPass(Str_WizSMDbuildDPM_CopySrcFiles) = False) Then GoTo Build_Error
    tPos = 0
    tPath = Compilation_ScriptAnimPath & "\"
    Do While (tPos < Compilation_ScriptAnimlistCount)
        BuildObj.AddFile tPath & Compilation_ScriptAnimlist(tPos), "src", False
        tPos = tPos + 1
    Loop
    
    ' Copy textures
    tPath = Compilation_ScriptAnimPath & "\"
    If (BuildObj.NewPass(Str_WizSMDbuildDPM_CopyTextures) = False) Then GoTo Build_Error
    tFile = FreeFile
    If (Dir(FileName_MergePaths(BuildObj.path, FileName_MergePaths("src", Compilation_ScriptAnimlist(0)))) = "") Then
        BuildObj.AddLogLine Str_WizSMDbuildDPM_CopyTexturesError & " '" & FileName_MergePaths(BuildObj.path, FileName_MergePaths("src", Compilation_ScriptAnimlist(0))) & "'"
        GoTo Build_Error
    End If
    Open FileName_MergePaths(BuildObj.path, FileName_MergePaths("src", Compilation_ScriptAnimlist(0))) For Input As tFile
        Do While EOF(tFile) = False
            Input #tFile, tString
            If (tString = "triangles") Then
                ' begin triangles list
                Do While EOF(tFile) = False
                    Input #tFile, tString
                    If (tString = "end") Then Exit Do
                    tExtension = Right(tString, 4)
                    If (tExtension = ".bmp" Or tExtension = ".tga" Or tExtension = ".jpg") Then
                        ' check if texture is already in cache
                        tPos = 0
                        Do While tPos < Compilation_NumModelSkins
                            If (Compilation_ModelSkins(tPos) = tString) Then Exit Do
                            tPos = tPos + 1
                        Loop
                        ' texture not found, add it to cache
                        If (tPos >= Compilation_NumModelSkins) Then
                            Compilation_ModelSkins(Compilation_NumModelSkins) = tString
                            Compilation_NumModelSkins = Compilation_NumModelSkins + 1
                        End If
                    End If
                Loop
            End If
        Loop
    Close #tFile
    ' copy base textures
    tPos = 0
    Do While tPos < Compilation_NumModelSkins
        CopyTexture tPath, Compilation_ModelSkins(tPos), True
        tPos = tPos + 1
    Loop
    
    ' copy per-pixel texture layers
    If (BuildObj.NewPass(Str_WizSMDbuildDPM_CopyTextureLayers) = False) Then GoTo Build_Error
    tPos = 0
    Do While tPos < Compilation_NumModelSkins
        tString = Compilation_ModelSkins(tPos)
        CopyTextureLayer tPath, tString, "_norm"
        CopyTextureLayer tPath, tString, "_gloss"
        CopyTextureLayer tPath, tString, "_glow"
        CopyTextureLayer tPath, tString, "_shirt"
        CopyTextureLayer tPath, tString, "_pants"
        CopyTextureLayer tPath, tString, "_bump"
        CopyTextureLayer tPath, tString, "_luma"
        tPos = tPos + 1
    Loop
    
    ' Create skin file
    If (BuildObj.NewPass(Str_WizSMDbuildDPM_CreateSkin) = False) Then GoTo Build_Error
    tFile = FreeFile
    tPath = FileName_MergePaths(BuildObj.path, FileName_MergePaths(Compilation_ScriptModelPath, Compilation_ScriptModelName)) & ".dpm_0.skin"
    Open tPath For Output As tFile
    tPos = 0
        Do While tPos < Compilation_NumModelSkins
            Print #tFile, LCase(FileName_StripPath(FileName_StripExt(Compilation_ModelSkins(0))) & "," & FileName_ReplaceSlashesToBackSlashes(FileName_MergePaths(Compilation_ScriptModelPath, FileName_StripPath(FileName_StripExt(Compilation_ModelSkins(tPos)))))) & Chr(13) & Chr(10)
            tPos = tPos + 1
        Loop
    Close #tFile
    BuildObj.AddLogLine Str_clsBuild_Tab & Str_WizSMDbuildDPM_Created & " " & FileName_MergePaths(Compilation_ScriptModelPath, Compilation_ScriptModelName) & ".dpm_0.skin"
    BuildObj.AddLogLine Str_clsBuild_Tab & Str_WizSMDbuildDPM_Created & " " & FileName_MergePaths(Compilation_ScriptModelPath, Compilation_ScriptModelName) & ".md3_0.skin"
    FileCopy tPath, FileName_MergePaths(BuildObj.path, FileName_MergePaths(Compilation_ScriptModelPath, Compilation_ScriptModelName)) & ".md3_0.skin"
     
    ' save compilation project
    If (BuildObj.NewPass(Str_WizSMDbuildDPM_SaveProject) = False) Then GoTo Build_Error
    tOldIni = Compilation_IniFile
    Compilation_IniFile = FileName_MergePaths(BuildObj.path, FileName_MergePaths("src", "build")) & ".dpmwiz"
    BuildObj.AddLogLine Str_clsBuild_Tab & Str_WizSMDbuildDPM_Saved & " '" & Compilation_IniFile & "'."
    Call ProjectSaveIni
    Compilation_IniFile = tOldIni
    
    ' write dpmodel build script
    If (BuildObj.NewPass(Str_WizSMDbuildDPM_GenScript) = False) Then GoTo Build_Error
    tFile = FreeFile
    tPath = FileName_MergePaths(BuildObj.path, "src\script.txt")
    Open tPath For Output As tFile
        Print #tFile, BuildSMDScript(False, "..\")
    Close #tFile
    BuildObj.AddLogLine Str_clsBuild_Tab & Str_WizSMDbuildDPM_Saved & " 'src\script.txt'."
    
    ' building
    If (BuildObj.NewPass(Str_WizSMDbuildDPM_Building) = False) Then GoTo Build_Error
    If (Compilation_ViewConverterOutput <> dpgFlagNo) Then
        tFile = FreeFile
        Open FileName_MergePaths(BuildObj.path, "\src\build.bat") For Output As tFile
            Print #tFile, FileName_MergePaths(App.path, Program_ToolPathSMD2DPM) & " " & FileName_MergePaths(BuildObj.path, "\src\script.txt") & Chr(13) & Chr(10)
            Print #tFile, "pause" & Chr(13) & Chr(10)
        Close #tFile
        BuildObj.AddLogLine Str_clsBuild_Tab & Str_WizSMDbuildDPM_BatchWritten & ": build.bat"
        BuildObj.AddLogLine Str_clsBuild_Tab & Str_WizSMDbuildDPM_BatchExecuted
        ChDir (FileName_MergePaths(BuildObj.path, "src\"))
        Shell FileName_MergePaths(BuildObj.path, "src\build.bat"), vbNormalFocus
    Else
        ChDir (FileName_MergePaths(BuildObj.path, "src\"))
        Shell App.path & "\" & Program_ToolPathSMD2DPM & " script.txt", vbHide
    End If
    BuildObj.AddLogLine Str_clsBuild_Tab & Str_WizSMDbuildDPM_BuildingInProgress
    
    ' run timer that checks for build file
    Me.BuildTimer.Enabled = True
    Me.BuildTimer.Interval = 100
    RunBuild_File = FileName_MergePaths(BuildObj.path, FileName_MergePaths(Compilation_ScriptModelPath, Compilation_ScriptModelName)) & ".md3"
    RunBuild_Active = BuildActive
    
Quit:
    Exit Sub
Build_Error:
    BuildObj.Shutdown
    ShutdownBuild
End Sub

' build file is complete
Private Sub BuildFinish()
    Dim tUtil As String
    Dim tPos As Long
    
    ' build complete
    If (BuildObj.NewPass(Str_WizSMDbuildDPM_BuildComplete) = False) Then GoTo Build_Error
    BuildObj.AddLogLine Str_clsBuild_Tab & Str_WizSMDbuildDPM_Path & " '" & BuildObj.path & "'"
    BuildObj.AddLogLine Str_clsBuild_Tab & Str_WizSMDbuildDPM_ModelPath & " '" & Compilation_ScriptModelPath & "'"
    BuildObj.AddLogLine Str_clsBuild_Tab & Compilation_ScriptModelName & ".dpm"
    BuildObj.AddLogLine Str_clsBuild_Tab & Compilation_ScriptModelName & ".md3"
    BuildObj.AddLogLine Str_clsBuild_Tab & Compilation_ScriptModelName & ".h"
    BuildObj.AddLogLine Str_clsBuild_Tab & Compilation_ScriptModelName & ".qc"

    ' form Pk3 archives
    If (Compilation_BuilkPk3 <> dpgFlagNo) Then
        If (BuildObj.NewPass(Str_WizSMDbuildDPM_CreatePk3) = False) Then GoTo Build_Error
        BuildObj.AddLogLine Str_clsBuild_Tab & Str_WizSMDbuildDPM_UsingPrefix & " '" & Program_Pk3Prefix & "'"
        BuildObj.AddLogLine Str_clsBuild_Tab & Str_WizSMDbuildDPM_UsingCompression & " '" & Compilation_BuilkPk3_Compression & "'"
        ChDir (BuildObj.path)
        tUtil = FileName_MergePaths(App.path, Program_ToolPath7Z)
        tUtil = tUtil & " a -tzip " & Program_Pk3Prefix & Compilation_BuilkPk3_Name & Program_Pk3Extension & " " & Program_ModelsDir & "* -r -mx" & Compilation_BuilkPk3_Compression
        Shell tUtil, vbMinimizedNoFocus
        BuildObj.AddLogLine Str_clsBuild_Tab & Str_WizSMDbuildDPM_Created & " '" & Program_Pk3Prefix & Compilation_BuilkPk3_Name & Program_Pk3Extension & "'"
        ' form archive file
        If (Compilation_SaveProject = dpgFlagYes) Then
            ' check if archive file is already exists
            tExtension = Program_Pk3Prefix & Compilation_BuilkPk3_Name
CreateArchive7Z:
            tString = FileName_MergePaths(App.path, FileName_MergePaths(Program_Archivepath, FileName_SetExt(tExtension, Program_ArchiveExt)))
            If (Dir(tString) <> "") Then
                If (MsgBox(FileName_SetExt(tExtension, Program_ArchiveExt) & Chr(13) & Chr(10) & " " & Chr(13) & Chr(10) & Str_WizSMDbuildDPM_Create7ZFileConfMsgbox, vbYesNo, Str_WizSMDbuildDPM_Create7ZFileConfMsgboxCap) = vbYes) Then
                    Kill tString
                Else
                    ' choose new name
CreateArchive7ZName:
                    ' find nearest free name
                    tPos = 1
                    tOldIni = "new_name_of_archive"
                    Do While tPos < 1000000
                        If (Dir(FileName_MergePaths(App.path, FileName_MergePaths(Program_Archivepath, FileName_SetExt(tExtension & tPos, Program_ArchiveExt)))) = "") Then
                            tOldIni = tExtension & tPos
                            Exit Do
                        End If
                        tPos = tPos + 1
                    Loop
                    
                    ' get new name
                    tExtension = InputBox(Str_WizSMDbuildDPM_Create7ZFileConfNewName, Str_WizSMDbuildDPM_Create7ZFileConfNewNameCap, tOldIni)
                    If (FileName_IsValid(tExtension) = False) Then
                        MsgBox Str_WizSMDbuildDPM_Create7ZFileConfNameError, vbInformation, Str_WizSMDbuildDPM_Create7ZFileConfNameErrorCap
                        GoTo CreateArchive7ZName
                    End If
                    GoTo CreateArchive7Z
                End If
            End If
            ChDir (FileName_MergePaths(BuildObj.path, "src"))
            tUtil = FileName_MergePaths(App.path, Program_ToolPath7Z)
            tUtil = tUtil & " a -t7z " & tString & " " & "* -r -mx" & 7
            Shell tUtil, vbMinimizedNoFocus
            BuildObj.AddLogLine Str_clsBuild_Tab & Str_WizSMDbuildDPM_Created & " '" & Mid(tString, Len(App.path) + 1, 10000) & "'"
        End If
        ' write sources
        If (Compilation_AddSourcesToBuild = dpgFlagYes) Then
            ChDir (FileName_MergePaths(BuildObj.path, "src"))
            tUtil = FileName_MergePaths(App.path, Program_ToolPath7Z)
            tUtil = tUtil & " a -tzip ..\" & Program_Pk3Prefix & Compilation_BuilkPk3_Name & "-src.zip" & " " & "* -r -mx" & 5
            Shell tUtil, vbMinimizedNoFocus
            BuildObj.AddLogLine Str_clsBuild_Tab & Str_WizSMDbuildDPM_Created & " '" & Program_Pk3Prefix & Compilation_BuilkPk3_Name & "-src.zip" & "'"
        End If
       
    End If
    
    ' shutdown build
    StopBuild
    
Quit:
    Exit Sub
Build_Error:
    BuildObj.Shutdown
    ShutdownBuild
End Sub

' waiting for build complete
Private Sub BuildTimer_Frame()
    If (RunBuild_Active = BuildActive) Then
        ' check for generated .dpm
        If (Dir(RunBuild_File) <> "") Then
            RunBuild_Active = BuildFinished
            Exit Sub
        End If
    End If
    If (RunBuild_Active = BuildFinished) Then
        Call BuildFinish
        RunBuild_Active = 0
        Me.BuildTimer.Enabled = False
        Me.BuildTimer.Interval = 0
    End If
End Sub

' make buttons work again
Private Sub ShutdownBuild()
    Me.btnPreview.Enabled = True
    Me.btnRebuild.Enabled = True
    Me.btnOpenBuildDir.Enabled = True
    Me.btnStopBuild.Enabled = False
    Me.btnNext.Enabled = True
    Me.btnPrev.Enabled = True
    Me.btnExit.Enabled = True
End Sub

' make buttons work again
Private Sub StopBuild()
    BuildObj.Shutdown
    ShutdownBuild
End Sub

'
' Controls
'

Private Sub btnExit_Click()
    Unload Me
End Sub

Private Sub btnNext_Click()
    SwitchForm Me, frmWizard
End Sub

Private Sub btnOpenBuildDir_Click()
    Shell "Explorer.exe " & FileName_MergePaths(App.path, Program_Buildpath), vbNormalFocus
End Sub

Private Sub btnPrev_Click()
    SwitchForm Me, frmWizardSMDbuild
End Sub

Private Sub btnPreview_Click()
    Dim tProg As String
    Dim tFile As String
    
    On Error GoTo Error
    
    tProg = FileName_MergePaths(App.path, Program_ToolPathDPMView)
    tFile = FileName_MergePaths(App.path, FileName_MergePaths(Program_Buildpath, FileName_MergePaths(Compilation_ScriptModelPath, Compilation_ScriptModelName))) & ".dpm"
    ChDir FileName_MergePaths(App.path, FileName_GetPath(Program_ToolPathDPMView))
    Shell FileName_StripPath(tProg) & " " & tFile, vbNormalFocus
Quit:
    Exit Sub
Error:
    MsgBox "Preview program or file not found" & Chr(13) & Chr(10) & " " & Chr(13) & Chr(10) & " prog = " & tProg & Chr(13) & Chr(10) & " file = " & tFile, vbCritical, "DPM Wizard"
    MsgBox Err.Description
    Resume Quit
End Sub

Private Sub btnRebuild_Click()
    Call RunBuild
End Sub

Private Sub btnStopBuild_Click()
    StopBuild
End Sub

Private Sub BuildTimer_Timer()
    BuildTimer_Frame
End Sub

Private Sub Form_Activate()
    RunBuild
End Sub

Private Sub Form_Deactivate()
    Unload Me
End Sub

Private Sub Form_Load()
    ' load language
    Me.Caption = Str_Com_WindowCaption
    Me.Label3.Caption = Str_WizSMDbuildDPM_Caption
    Me.btnPrev.Caption = Str_Com_Prev
    Me.btnPreview.Caption = Str_WizSMDbuildDPM_PreviewModel
    Me.btnRebuild.Caption = Str_WizSMDbuildDPM_Rebuild
    Me.btnStopBuild.Caption = Str_WizSMDbuildDPM_StopBuild
    Me.btnOpenBuildDir.Caption = Str_WizSMDbuildDPM_OpenBuildDir
    Me.btnNext.Caption = Str_WizSMDbuildDPM_MainMenu
    Me.btnExit.Caption = Str_Com_Exit
End Sub
