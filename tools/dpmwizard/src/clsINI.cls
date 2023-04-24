VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsINI"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' methods

Private Declare Function GetPrivateProfileStringByKeyName Lib "kernel32" Alias _
    "GetPrivateProfileStringA" ( _
 ByVal lpApplicationName As String, _
 ByVal lpszKey As String, _
 ByVal lpszDefault As String, _
 ByVal lpszReturnBuffer As String, _
 ByVal cchReturnBuffer As Long, _
 ByVal lpszFile As String _
) As Long

Private Declare Function WritePrivateProfileStringByKeyName Lib "kernel32" Alias _
    "WritePrivateProfileStringA" ( _
 ByVal lpApplicationName As String, _
 ByVal lpKeyName As String, _
 ByVal lpString As String, _
 ByVal lplFileName As String _
) As Long

Private Declare Function WritePrivateProfileStringToDeleteKey Lib "kernel32" Alias _
    "WritePrivateProfileStringA" ( _
 ByVal lpApplicationName As String, _
 ByVal lpKeyName As String, _
 ByVal lpString As Long, _
 ByVal lplFileName As String _
) As Long

' Constants

Private Const READ_BUFF As Long = 1024
Private m_strFilename As String

' properties

Public Property Get File() As String
 File = m_strFilename
End Property

Public Property Let File(strFilename As String)
 m_strFilename = strFilename
End Property

' api
 
' возвращает -1 при неуспешно записанных данных и Long Integer при успешной записи
Public Function Add(strSection As String, strKey As String, strValue As String) As Long
 If Len(strKey) > READ_BUFF Or Len(strValue) > READ_BUFF Then
  MsgBox "You can't write more than " & READ_BUFF & " characters!", vbCritical
  Add = -1
  Exit Function
 End If

 Add = WritePrivateProfileStringByKeyName(strSection, strKey, strValue, m_strFilename)
End Function

Public Function Read(ByVal strSection As String, ByVal strKey As String) As String
 Dim strValue As String
 Dim lngRetLen As Long

 strValue = String(READ_BUFF + 1, Space(1))

 lngRetLen = GetPrivateProfileStringByKeyName(strSection, strKey, "", strValue, READ_BUFF, m_strFilename)
 Read = Left(strValue, lngRetLen)
End Function

Public Function Delete(strSection As String, Optional strKey As String) As Long
 If strKey = "" Then
  Delete = WritePrivateProfileStringToDeleteKey(strSection, vbNullString, 0, m_strFilename)
 Else
  Delete = WritePrivateProfileStringToDeleteKey(strSection, strKey, 0, m_strFilename)
 End If
End Function

