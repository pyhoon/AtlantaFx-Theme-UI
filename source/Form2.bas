B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=10.5
@EndOfDesignText@
Sub Class_Globals
	Private fx As JFX
	Private Form As Form
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize
	Form.Initialize("Form", 900, 600)
	Form.RootPane.LoadLayout("Layout2")
End Sub

Public Sub Show
	Form.Title = "Form2 Title - " & DateTime.Time(DateTime.Now)
	Form.Show
	
	Dim frm As Form = GetCurrentForm
	If frm.IsInitialized Then
	    Log(frm.Title)
	End If
End Sub

Sub Form_CloseRequest (EventData As Event)
	Main.Show
End Sub

Public Sub GetCurrentForm As Form
    Dim UninitializedForm As Form
    Dim x As JavaObject
    Dim stage As JavaObject = x.InitializeStatic("anywheresoftware.b4a.objects.B4XViewWrapper$XUI").RunMethod("findActiveStage", Null)
    If stage.IsInitialized = False Then Return UninitializedForm
    Dim scene As JavaObject = stage.RunMethod("getScene", Null)
    Dim pane As B4XView = scene.RunMethod("getRoot", Null)
    Dim a As JavaObject
    Return a.InitializeStatic("anywheresoftware.b4a.AbsObjectWrapper").RunMethodJO("getExtraTags", Array(pane)).RunMethod("get", Array("form"))
End Sub