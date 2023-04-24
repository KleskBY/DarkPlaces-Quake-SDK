Attribute VB_Name = "FileNames"
'
' filenames operations
'
Public Function FileName_GetPath(ByVal tFileName As String) As String
    Dim tPos As Integer
    
    tPos = Len(tFileName)
    Do While (tPos > 1)
        If (Mid(tFileName, tPos, 1) = "\") Then
            GoTo EndSearch
        End If
        tPos = tPos - 1
    Loop
EndSearch:
    If (tPos > 1) Then
        FileName_GetPath = Mid(tFileName, 1, tPos)
    Else
        FileName_GetPath = ""
    End If
End Function

Public Function FileName_GetExt(ByVal tFileName As String) As String
    Dim tPos As Integer
    
    tPos = Len(tFileName)
    Do While (tPos > 1)
        If (Mid(tFileName, tPos, 1) = ".") Then
            GoTo EndSearch
        End If
        tPos = tPos - 1
    Loop
EndSearch:
    If (tPos > 1) Then
        FileName_GetExt = Mid(tFileName, tPos, 10000)
    Else
        FileName_GetExt = ""
    End If
End Function

Public Function FileName_StripPath(ByVal tFileName As String) As String
    FileName_StripPath = Mid(tFileName, Len(FileName_GetPath(tFileName)) + 1, 10000)
End Function

Public Function FileName_StripExt(ByVal tFileName As String) As String
    FileName_StripExt = Mid(tFileName, 1, Len(tFileName) - Len(FileName_GetExt(tFileName)))
End Function

Public Function FileName_SetPath(ByVal tFileName As String, ByVal tPath As String) As String
    ' автоматически добавляем \ к концу пути
    If (Right(tPath, 1) <> "\") Then tPath = tPath & "\"
    FileName_SetPath = tPath & Mid(tFileName, Len(FileName_GetPath(tFileName)) + 1, 10000)
End Function

Public Function FileName_SetExt(ByVal tFileName As String, ByVal tExt As String) As String
    ' автоматически добавляем . к началу экстеншна
    If (Left(tExt, 1) <> ".") Then tExt = "." & tExt
    FileName_SetExt = Mid(tFileName, 1, Len(tFileName) - Len(FileName_GetExt(tFileName))) & tExt
End Function

Public Function FileName_MergePaths(ByVal tPath1 As String, ByVal tPath2 As String) As String
    Do While (Right(tPath1, 1) = "\")
        tPath1 = Mid(tPath1, 1, Len(tPath1) - 1)
    Loop
    Do While (Left(tPath2, 1) = "\")
        tPath2 = Mid(tPath2, 2, 10000)
    Loop
    FileName_MergePaths = tPath1 & "\" & tPath2
End Function

Public Function FileName_ReplaceSlashesToBackSlashes(ByVal tString As String) As String
    Dim tPos, tLen As Integer
    Dim tResult, tStr As String
    
    tLen = Len(tString)
    tPos = 1
    Do While tPos <= tLen
        tStr = Mid(tString, tPos, 1)
        If (tStr = "\") Then
            tResult = tResult & "/"
        Else
            tResult = tResult & tStr
        End If
        tPos = tPos + 1
    Loop
    
    FileName_ReplaceSlashesToBackSlashes = tResult
End Function

' return Tue if file name not contains this characters: \ / : * ? '' < > |
Public Function FileName_IsValid(ByVal tString As String) As Boolean
    Dim tPos, tLen As Integer
    
    tLen = Len(tString)
    If (tLen <= 0) Then GoTo Error
    tPos = 1
    Do While tPos <= tLen
        tStr = Mid(tString, tPos, 1)
        ' todo: "
        If (tStr = "\" Or tStr = "/" Or tStr = ":" Or tStr = "*" Or tStr = "?" Or tStr = "\" Or tStr = "<" Or tStr = ">" Or tStr = "|") Then GoTo Error
        tPos = tPos + 1
    Loop
    
    FileName_IsValid = True
Quit:
    Exit Function
Error:
    FileName_IsValid = False
    Exit Function
End Function
