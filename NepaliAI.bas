DECLARE SUB useAI()
DECLARE SUB database()

again:
Cls
Locate 3, 25
Color 4, 9
Print " NoobGPT - Powered by @NebulaX "
Color 2, 0
Locate 6, 8
Print " 1. Talk With AI bot "
Locate 6, 40
Print " 2. Customize DataBase "
Color 7, 0
Print
Print
Print
Print
Input "Select Option (1 or 2)"; op
Select Case op
    Case 1
        Call useAI
    Case 2
        Call database
    Case Else
        Color 4, 0
        Print " Invalid Entry..."
        Beep
        Sleep 5
        Color 7, 0
        GoTo again
End Select

Sub useAI
    ag:
    Cls
    ' Reset the flag so that each query starts fresh.
    count = 0
    Locate 3, 25
    Color 4, 9
    Print " NepaliAI Bot "
    Color 7, 0
    Print
    Print
    Print
    a$ = "Hello ! How can I assist you "
    Print a$
    Print
    Input query$
    query$ = LCase$(query$)
    Open "info.txt" For Input As #2
    While Not EOF(2)
        Input #2, q$, ans$
        If LCase$(q$) = query$ Then
            return$ = ans$
            count = 5
            GoTo cl
        End If
    Wend
    cl:
    Close #2
    Print
    Print
    Color 1, 0
    If count <> 5 Then
        return$ = "Sorry, i cant understand please ask me again"
    End If
    For i = 1 To Len(return$)
        Print Mid$(return$, i, 1);
        For t = 1 To 10000000
        Next t
    Next i
    If count <> 5 Then
        Sleep 1
        For i = 1 To 3
            Sound 1000, 18
            Sound 0, 3
        Next i
        GoTo ag
    End If
    Color 7, 0
    Sleep 2
    Print
    Input "DO YOU WANT TO CONTINUE: "; ct$
    Sleep 1
    If UCase$(ct$) = "Y" Or UCase$(ct$) = "YES" Then
        Beep
        GoTo ag
    End If
End Sub

Sub database
    Cls
    Locate 3, 25
    Color 4, 0
    Print " Customizing Data "
    Open "info.txt" For Append As #1
    Print
    Print
    a:
    Color 4, 0
    Input "Enter Question ?  :"; q$
    Print
    Print
    Color 9, 0
    Input "Enter Equivalent Answer: "; ans$
    Write #1, q$, ans$
    Color 7, 0
    Print
    Print
    Print
    Print
    Print
    Print
    Input " DO YOU WANT TO CONTINUE ?"; y$
    If UCase$(y$) = "Y" Or UCase$(y$) = "YES" Then
        Beep
        GoTo a
    Else
        Close #1
        Input "DO YOU WANT TO TALK WITH NEPALI AI BOT? "; bot$
        If UCase$(bot$) = "Y" Or UCase$(bot$) = "YES" Then
            want$ = "YES"
        Else
            want$ = "NO"
        End If
    End If
    If want$ = "YES" Then Call useAI
End Sub

