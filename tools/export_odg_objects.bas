Option Explicit

Const SVG_BUFFER = 100

' LibreOffice Basic macro: export named top-level objects of the current ODG
' drawing as separate SVG files.
'
' Import this module into: My Macros > Standard > Module1 (or another module),
' then run ExportNamedObjectsToSVG.
'
' SVG files are written next to the saved ODG file.
' Existing SVG files are overwritten. Missing or duplicate object names stop
' the macro before any export starts. SVG_BUFFER is expressed in 1/100 mm.

Sub ExportNamedObjectsToSVG()
    Dim document As Object
    document = ThisComponent

    If Not document.supportsService("com.sun.star.drawing.DrawingDocument") Then
        MsgBox "Il documento attivo non è un disegno ODG.", 16, "Esportazione SVG"
        Exit Sub
    End If

    If document.URL = "" Then
        MsgBox "Salva prima il disegno ODG: gli SVG sono esportati nella stessa cartella del file.", 16, "Esportazione SVG"
        Exit Sub
    End If

    Dim outputDirectory As String
    outputDirectory = OutputDirectoryFor(document.URL)

    Dim errors As String
    errors = ValidateObjectNames(document)
    If errors <> "" Then
        MsgBox "Esportazione annullata:" & Chr(10) & errors, 16, "Esportazione SVG"
        Exit Sub
    End If

    On Error GoTo ExportError
    Dim pageIndex As Long, shapeIndex As Long, exported As Long
    Dim pages As Object, page As Object, shape As Object
    pages = document.getDrawPages()

    For pageIndex = 0 To pages.getCount() - 1
        page = pages.getByIndex(pageIndex)
        For shapeIndex = 0 To page.getCount() - 1
            shape = page.getByIndex(shapeIndex)
            ExportShapeToSVG document, page, shape, outputDirectory & GetPathSeparator() & SafeFilename(ObjectName(shape)) & ".svg"
            exported = exported + 1
        Next shapeIndex
    Next pageIndex

    MsgBox "Esportati " & exported & " oggetti in:" & Chr(10) & outputDirectory, 64, "Esportazione SVG"
    Exit Sub

ExportError:
    MsgBox "Esportazione interrotta: " & Error$, 16, "Esportazione SVG"
End Sub


Function ValidateObjectNames(document As Object) As String
    Dim usedNames() As String
    Dim usedCount As Long
    Dim errors As String
    Dim pageIndex As Long, shapeIndex As Long, foundIndex As Long
    Dim pages As Object, page As Object, shape As Object
    Dim name As String, key As String, location As String

    pages = document.getDrawPages()
    For pageIndex = 0 To pages.getCount() - 1
        page = pages.getByIndex(pageIndex)
        For shapeIndex = 0 To page.getCount() - 1
            shape = page.getByIndex(shapeIndex)
            location = "pagina " & (pageIndex + 1) & ", oggetto " & (shapeIndex + 1)
            name = ObjectName(shape)

            If name = "" Then
                errors = errors & Chr(10) & "- " & location & " non ha un nome."
            Else
                key = LCase(SafeFilename(name))
                If key = "" Then
                    errors = errors & Chr(10) & "- " & location & " ha un nome non valido per un file."
                Else
                    If usedCount = 0 Then
                        foundIndex = -1
                    Else
                        foundIndex = FindNameIndex(usedNames(), usedCount, key)
                    End If
                If foundIndex >= 0 Then
                    errors = errors & Chr(10) & "- " & location & " (" & Chr(34) & name & Chr(34) & ") duplica " & Chr(34) & usedNames(foundIndex) & Chr(34) & "."
                Else
                    If usedCount = 0 Then
                        ReDim usedNames(0)
                    Else
                        ReDim Preserve usedNames(usedCount)
                    End If
                    usedNames(usedCount) = key
                    usedCount = usedCount + 1
                End If
                End If
            End If
        Next shapeIndex
    Next pageIndex

    ValidateObjectNames = errors
End Function


Function FindNameIndex(names() As String, count As Long, target As String) As Long
    Dim index As Long
    For index = 0 To count - 1
        If names(index) = target Then
            FindNameIndex = index
            Exit Function
        End If
    Next index
    FindNameIndex = -1
End Function


Function ObjectName(shape As Object) As String
    On Error GoTo MissingName
    ObjectName = Trim(shape.Name)
    Exit Function

MissingName:
    ObjectName = ""
End Function


Function SafeFilename(name As String) As String
    Dim stem As String
    stem = Trim(name)
    stem = Replace(stem, "<", "-")
    stem = Replace(stem, ">", "-")
    stem = Replace(stem, ":", "-")
    stem = Replace(stem, Chr(34), "-")
    stem = Replace(stem, "/", "-")
    stem = Replace(stem, "\", "-")
    stem = Replace(stem, "|", "-")
    stem = Replace(stem, "?", "-")
    stem = Replace(stem, "*", "-")
    Do While InStr(stem, "  ") > 0
        stem = Replace(stem, "  ", " ")
    Loop
    SafeFilename = Trim(stem)
End Function


Function OutputDirectoryFor(documentURL As String) As String
    Dim documentPath As String
    Dim separator As String
    Dim separatorPosition As Long

    documentPath = ConvertFromURL(documentURL)
    separator = GetPathSeparator()
    separatorPosition = LastSeparatorPosition(documentPath, separator)
    If separatorPosition = 0 Then Err.Raise 1001, "OutputDirectoryFor", "Percorso del documento non valido."
    OutputDirectoryFor = Left(documentPath, separatorPosition - 1)
End Function


Function LastSeparatorPosition(path As String, separator As String) As Long
    Dim position As Long
    For position = Len(path) To 1 Step -1
        If Mid(path, position, 1) = separator Then
            LastSeparatorPosition = position
            Exit Function
        End If
    Next position
    LastSeparatorPosition = 0
End Function


Sub ExportShapeToSVG(document As Object, page As Object, shape As Object, destination As String)
    Dim exporter As Object, shapes As Object, bufferShape As Object
    Dim properties(2) As New com.sun.star.beans.PropertyValue
    Dim position As New com.sun.star.awt.Point
    Dim size As New com.sun.star.awt.Size
    Dim exportSucceeded As Boolean
    Dim errorMessage As String

    On Error GoTo ExportFailure
    position.X = shape.Position.X - SVG_BUFFER
    position.Y = shape.Position.Y - SVG_BUFFER
    size.Width = shape.Size.Width + (2 * SVG_BUFFER)
    size.Height = shape.Size.Height + (2 * SVG_BUFFER)

    bufferShape = document.createInstance("com.sun.star.drawing.RectangleShape")
    bufferShape.Position = position
    bufferShape.Size = size
    bufferShape.FillStyle = com.sun.star.drawing.FillStyle.NONE
    bufferShape.LineStyle = com.sun.star.drawing.LineStyle.NONE
    page.add(bufferShape)

    shapes = CreateUnoService("com.sun.star.drawing.ShapeCollection")
    shapes.add(shape)
    shapes.add(bufferShape)

    exporter = CreateUnoService("com.sun.star.drawing.GraphicExportFilter")
    exporter.setSourceDocument(shapes)
    properties(0).Name = "URL"
    properties(0).Value = ConvertToURL(destination)
    properties(1).Name = "FilterName"
    properties(1).Value = "draw_svg_Export"
    properties(2).Name = "MediaType"
    properties(2).Value = "image/svg+xml"
    exportSucceeded = exporter.filter(properties())

    page.remove(bufferShape)
    If Not exportSucceeded Then
        Err.Raise 1000, "ExportShapeToSVG", "LibreOffice non ha potuto esportare " & Chr(34) & ObjectName(shape) & Chr(34) & "."
    End If
    Exit Sub

ExportFailure:
    errorMessage = Error$
    On Error Resume Next
    page.remove(bufferShape)
    On Error GoTo 0
    Err.Raise 1000, "ExportShapeToSVG", errorMessage
End Sub
