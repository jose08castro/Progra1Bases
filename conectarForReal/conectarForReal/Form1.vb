Imports System.Data.SqlClient

Public Class Form1
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Dim con As New SqlConnection(My.Settings.Conexion)
        Dim sql As String = "SELECT idProfesor, Nombre, Email, Telefono FROM Profesor"
        Dim cmd As New SqlCommand(sql, con)
        Try
            Dim da As New SqlDataAdapter(cmd)
            Dim ds As New DataSet
            da.Fill(ds, "Profesor")
            Me.DataGridView1.DataSource = ds.Tables("Profesor") '

        Catch ex As Exception
            MsgBox(ex.Message)

        End Try
    End Sub

    Private Sub TextBox1_TextChanged(sender As Object, e As EventArgs)

    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs)

    End Sub
End Class
