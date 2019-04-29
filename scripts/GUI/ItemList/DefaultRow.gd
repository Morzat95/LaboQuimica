extends Control

var RowData setget set_row_data, get_row_data

var _metadata = null

func set_row_data(data):
	get_node("HBoxContainer/RichTextLabel").bbcode_text = data.text
	_metadata = data


func get_row_data():
	return _metadata


func get_drag_data(position):
	set_drag_preview(self.duplicate())
	return _metadata
	
	
func can_drop_data(position, data):
	if not "dragdrop_id" in data:
		return false
	return data.dragdrop_id == _metadata.dragdrop_id and data["self"].get_parent() != self.get_parent()
	
	
func drop_data(position, data):
	_metadata.origin.bubble_drop(data, _metadata)