VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsBuild"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'
' Build class module
'

'
' PROPERTIES
'

' private
Private linkLogText As TextBox
Private linkTimer As Timer
Private LogLineNotFinished As Boolean
Private ErrorCode As Integer


' public
Public path As String
'
' CONSTANTS
'

Const ErrorNo = 0
Const ErrorYes = 1

'
' LOGGING
'

Public Sub AddLog(tString As String)
    linkLogText.tExt = linkLogText.tExt & tString
    linkLogText.SelStart = Len(linkLogText.tExt) - 1
    linkLogText.SelLength = 1
    linkLogText.Refresh
    
    LogLineNotFinished = True
End Sub

Public Sub AddLogEndLine()
    If (LogLineNotFinished = False) Then Exit Sub
    
    linkLogText.tExt = linkLogText.tExt & Chr(13) & Chr(10)
    linkLogText.SelStart = Len(linkLogText.tExt) - 1
    linkLogText.SelLength = 1
    linkLogText.Refresh
    
    LogLineNotFinished = False
End Sub

Public Sub AddLogLine(tString As String)
    If (LogLineNotFinished = True) Then AddLogEndLine

    linkLogText.tExt = linkLogText.tExt & tString & Chr(13) & Chr(10)
    linkLogText.SelStart = Len(linkLogText.tExt) - 1
    linkLogText.SelLength = 1
    linkLogText.Refresh
End Sub

'
' OBJECT FUNCTIONALITY
'

' init build
Public Sub Init(ByVal tName As String, ByRef tLogTextbox As TextBox, ByRef tTimer As Timer)
    ' set objects
    Set linkLogText = tLogTextbox
    Set linkTimer = tTimer
    
    AddLogLine Str_clsBuild_StartBuildProc & " '" & tName & "'."
    
    ErrorCode = ErrorNo
End Sub

' shutdown build
Public Sub Shutdown()
    If (ErrorCode <> ErrorYes) Then
        AddLogLine Str_clsBuild_ShutdownBuild
    Else
        AddLogLine Str_clsBuild_StopBuild
    End If
End Sub

' flush path build files will be processed to
Public Sub UsePath(ByVal tPath, ByVal tDir As String)
    On Error GoTo Error
    
    AddLogLine Str_clsBuild_Tab & Str_clsBuild_BasePath & " '" & tPath & "'"
    AddLogLine Str_clsBuild_Tab & Str_clsBuild_UseDir & " '" & tDir & "'."
    
    ChDir tPath
    DelDirTree tDir
    MkDir tDir
    
    ' todo: need some stability here
    path = tPath & "\" & tDir
    ChDir path
Quit:
    Exit Sub
Error:
    AddLogLine Str_clsBuild_UsePathError1 & " '" & tDir & "' " & Str_clsBuild_UsePathError2
    AddLogLine Str_clsBuild_UsePathReason & " '" & Err.Description & "'"
    ErrorCode = ErrorYes
    Resume Quit
End Sub

' create directory structure in build dir
Public Sub CreatePath(ByVal tPath)
    On Error GoTo Error

    If (tPath = "") Then GoTo Quit
    
    AddLogLine Str_clsBuild_Tab & Str_clsBuild_CreatePath & " '" & tPath & "'."
    ChDir path
    CreateDirTree tPath

Quit:
    Exit Sub
Error:
    AddLogLine Str_clsBuild_CreatePathError & " '" & tPath & "'."
    AddLogLine Str_clsBuild_CreatePathReason & " '" & Err.Description & "'"
    ErrorCode = ErrorYes
    Resume Quit
End Sub

' begin new pass (i.e. group of action ,returns true if builder has no errors yet
Public Function NewPass(ByVal tString As String) As Boolean
    If (ErrorCode <> ErrorNo) Then
        NewPass = False
    Else
        AddLogLine tString
        NewPass = True
    End If
End Function

' check nesessary file
Public Function CheckFile(ByVal tPath As String, tCastErrorIfNotFound As Boolean) As Boolean
    On Error GoTo Error
    AddLog Str_clsBuild_Tab & Str_clsBuild_Check & " '" & tPath & "'..."
    If (Dir(tPath) = "") Then GoTo Quit_False
    CheckNesessaryFile = True
Quit:
    If (CheckNesessaryFile = False) Then
        AddLog Str_clsBuild_CheckNotFound
        AddLogEndLine
        If (tCastErrorIfNotFound = True) Then
            AddLogLine Str_clsBuild_CheckError
            ErrorCode = ErrorYes
        End If
    Else
        AddLog Str_clsBuild_CheckFound
        AddLogEndLine
    End If
    Exit Function
Quit_False:
    CheckNesessaryFile = False
    GoTo Quit
Error:
    CheckNesessaryFile = False
    AddLogLine Str_clsBuild_CheckRuntimeError & " '" & Err.Description & "'."
    Resume Quit
End Function

' copy a file
Public Function AddFile(tFileSrc As String, tDstDir As String, tCastErrorOnError As Boolean) As Boolean
    Dim tDestPath As String
    
    tDestPath = FileName_MergePaths(path, tDstDir)
    tDestPath = FileName_MergePaths(tDestPath, FileName_StripPath(tFileSrc))
    AddLog Str_clsBuild_Tab & Str_clsBuild_AddFile & " '" & tFileSrc & "'..."
    If (Dir(tFileSrc) = "") Then GoTo Quit_False
    On Error GoTo Error_Copy
    ChDir path
    CreateDirTree tDstDir
    FileCopy tFileSrc, tDestPath
    AddFile = True
    AddLog Str_clsBuild_AddDone
Quit:
    AddLogEndLine
    If (AddFile = False) Then
        If (tCastErrorOnError = True) Then
            AddLogLine Str_clsBuild_AddError
            ErrorCode = ErrorYes
        End If
    End If
    Exit Function
Quit_False:
    AddLog Str_clsBuild_AddNotFound
    AddLogEndLine
    AddFile = False
    GoTo Quit
    Exit Function
Error:
    AddFile = False
    AddLogLine Str_clsBuild_Tab & Str_clsBuild_AddWarning1 & " '" & Err.Description & "'."
    Resume Quit
Error_Copy:
    AddLog Str_clsBuild_AddNotFound
    AddLogEndLine
    AddFile = False
    AddLogLine Str_clsBuild_Tab & Str_clsBuild_AddWarning2 & " '" & tDestPath & "'."
    AddLogLine Str_clsBuild_Tab & Str_clsBuild_AddReason & " '" & Err.Description & "'."
    Resume Quit
End Function

' returns true if error
Public Function IsError() As Boolean
    IsError = False
    If (ErrorCode = ErrorYes) Then
        IsError = True
        Exit Function
    End If
End Function

