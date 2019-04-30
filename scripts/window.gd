extends Panel

onready var win_num_label: Label = $"vbox/status_line_bg/status_line/left/window_number"
onready var file_name_label: Label = $"vbox/status_line_bg/status_line/left/file_name"
onready var language_label: Label = $"vbox/status_line_bg/status_line/left/language"
onready var encoding_label: Label = $"vbox/status_line_bg/status_line/right/encoding"
onready var line_char_label: Label = $"vbox/status_line_bg/status_line/right/line_char"

var window_number: int = 1
var file_name: String = "untitled"
var language: String = "plain"
var encoding: String = "utf-8"
var line: int = 1
var character: int = 1

func _ready() -> void:
    win_num_label.text = String(window_number)
    file_name_label.text = file_name
    language_label.text = language
    encoding_label.text = encoding
    line_char_label.text = String(line) + " : " + String(character)

func set_window_number(num: int = 1) -> void:
    window_number = num
    $"vbox/status_line_bg/status_line/left/window_number".text = String(window_number)

func set_file_name(name: String = "untitled") -> void:
    file_name = name
    file_name_label.text = file_name

func set_language(lang: String = "plain") -> void:
    language = lang
    language_label.text = language

func set_encoding(encode: String = "utf-8") -> void:
    encoding = encode
    encoding_label.text = encoding

func set_line_char(ln: int = 1, ch: int = 1) -> void:
    line = ln
    character = ch
    line_char_label.text = String(line) + " : " + String(character)
