B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=10.5
@EndOfDesignText@
Sub Class_Globals
	Private fx As JFX
	Private Form As Form
	Private ox, oy As Double
	Private px, py As Double
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize
	Form.Initialize("Form", 900, 600)
	Form.SetFormStyle("TRANSPARENT")
	Form.RootPane.LoadLayout("Layout2")
End Sub

Public Sub Show
	Form.Title = "Form2 Title - " & DateTime.Time(DateTime.Now)
	Form.Show
	Form.BackColor = fx.Colors.ARGB(0, 255, 0, 0)
	CSSUtils.SetBackgroundColor(Form.RootPane, fx.Colors.Transparent)
	Form.Stylesheets.Add(File.GetUri(File.DirAssets, "primer-light.css"))
	Form.WindowLeft = px
	Form.WindowTop = py
End Sub

Sub Form_CloseRequest (EventData As Event)
	SavePosition
	Main.Show
End Sub

Sub Form_MousePressed (EventData As MouseEvent)
	ox = EventData.X
	oy = EventData.Y
End Sub

Sub Form_MouseDragged (EventData As MouseEvent)
	Dim jo As JavaObject = EventData
	Form.WindowLeft = jo.RunMethod("getScreenX", Null) - ox
	Form.WindowTop = jo.RunMethod("getScreenY", Null) - oy
End Sub

' <link>link|https://www.b4x.com/android/forum/threads/get-current-form.162078/</link> Get Current Form 
Public Sub CurrentForm As Form
    Dim UninitializedForm As Form
    Dim x As JavaObject
    Dim stage As JavaObject = x.InitializeStatic("anywheresoftware.b4a.objects.B4XViewWrapper$XUI").RunMethod("findActiveStage", Null)
    If stage.IsInitialized = False Then Return UninitializedForm
    Dim scene As JavaObject = stage.RunMethod("getScene", Null)
    Dim pane As B4XView = scene.RunMethod("getRoot", Null)
    Dim a As JavaObject
    Return a.InitializeStatic("anywheresoftware.b4a.AbsObjectWrapper").RunMethodJO("getExtraTags", Array(pane)).RunMethod("get", Array("form"))
End Sub

Private Sub Button1_Click
	SavePosition
	Main.Show
	Form.Close
End Sub

Private Sub SavePosition
	px = Form.WindowLeft
	py = Form.WindowTop
End Sub