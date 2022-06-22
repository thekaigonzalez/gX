extends Panel

var following = false
var startpos = Vector2()

export var window_title = "No Title"
export var uncentered = false

onready var Window_Title = $win
onready var Screen = $gxSCREEN

onready var WindowChrome = self

func _ready():
	visible = false

func _on_frame_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1:
			following = !following
			startpos = get_local_mouse_position()
			
func _process(_d):
	Window_Title.text = window_title
	
	if following:
		rect_position = rect_position + get_local_mouse_position() - startpos

	rect_size.x = Screen.rect_size.x
	
	#$Window.owner = $ScrollContainer
	
func show():
	visible = true
	if (uncentered):
		self.rect_position = get_viewport_rect().size / 2
