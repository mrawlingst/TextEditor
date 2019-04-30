extends Node

onready var window = preload("res://scenes/window.tscn")

var windows: Array

func _process(delta):
    if Input.is_action_just_pressed("new_window"):
        add_window(self)
    
    if Input.is_action_just_pressed("close_window"):
        remove_window()

# Add a new window
func add_window(parent: Node) -> void:
    var instance = window.instance()
    windows.append(instance)
    instance.set_window_number(windows.size())
    parent.add_child(instance)

# Remove a window based on number (default: 1)
func remove_window(num: int = 1) -> bool:
    var removed: bool = false
    
    # Do not remove the last window
    if windows.size() == 1:
        return false
    
    for win in windows:
        if num == win.window_number:
            windows.erase(win)
            win.free()
            update_windows()
            removed = true

    return removed

# Update all windows and their number
func update_windows() -> void:
    var i: int = 1
    for win in windows:
        if win.window_number != i:
            win.set_window_number(i)
        i = i + 1
