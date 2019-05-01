extends Node

onready var horizontal = preload("res://scenes/horizontal_container.tscn")
onready var vertical = preload("res://scenes/vertical_container.tscn")

onready var input_label = $status_line/input
onready var mode_label = $status_line/mode

enum Modes { NORMAL, EDIT }

# Current mode
var mode = Modes.NORMAL

# Keep track of inputs in normal mode
var input_buffer: Array = []

func _ready() -> void:
    window_manager.add_window($view)

func _process(delta):
    if Input.is_action_just_pressed("key_esc"):
        mode = Modes.NORMAL
        input_buffer.clear()
        input_label.text = "ESC"
        mode_label.text = "normal"
        print("clear")
    
    if mode == Modes.EDIT:
        return
    
    if Input.is_action_just_pressed("key_i"):
        if input_buffer.empty():
            mode = Modes.EDIT
            input_label.text = ""
            mode_label.text = "edit"
        else:
            input_buffer.append("key_i")
            input_label.text += "i "
    
    if Input.is_action_just_pressed("key_space"):
        input_buffer.append("key_space")
        input_label.text += "SPC "
    
    if Input.is_action_just_pressed("key_w"):
        input_buffer.append("key_w")
        input_label.text += "w "
    
    if Input.is_action_just_pressed("key_slash"):
        input_buffer.append("key_slash")
        input_label.text += "/ "
    
    if input_buffer.size() >= 3:
        process_input_buffer()
    
func process_input_buffer():
    if not functions.map.has(input_buffer[0]):
        print("undefined 1")
        return
    
    if not functions.map[input_buffer[0]].has(input_buffer[1]):
        print("undefined 2")
        return
    
    if not functions.map[input_buffer[0]][input_buffer[1]].has(input_buffer[2]):
        print("undefined 3")
        return
    
    var val = functions.map[input_buffer[0]][input_buffer[1]][input_buffer[2]]
    input_label.text += "    " + val["desc"]
    input_buffer.clear()
    
