Public Class Form4
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If TextBox1.Text = "H" And TextBox2.Text = "A" Then
            MsgBox("You are Now Logged In", MsgBoxStyle.Information, "Login")
        Else
            If TextBox1.Text = "" And TextBox2.Text = "" Then
                MsgBox("No Username and/or Password Found!", MsgBoxStyle.Critical, "Error")
            End If
        End If

    End Sub
End Class