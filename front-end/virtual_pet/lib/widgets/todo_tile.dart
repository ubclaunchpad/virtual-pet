import 'package:flutter/material.dart';
import 'package:virtual_pet/widgets/todo_item.dart';

// Todo item tile widget
class TodoItemTile extends StatefulWidget {
  final Todo todo;
  final Function(Todo todo) onChecked;
  final Function(Todo todo) onChanged;
  
  TodoItemTile({
    required this.todo,
    required this.onChecked,
    required this.onChanged
  }) : super(key: ObjectKey(todo));

  @override
  State<TodoItemTile> createState() => _TodoItemTileState();
}

class _TodoItemTileState extends State<TodoItemTile> {
  late Todo todo;
  late bool _isEditingMode;
  late TextEditingController _todoEditingController;

  @override
  void initState() {
    super.initState();
    todo = widget.todo;
    _isEditingMode = false;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        widget.onChecked(todo);
      },
      // hides checkbox when _isEditingMode == true
      leading: Visibility(
        visible: !_isEditingMode,
        child: Checkbox(value: todo.checked, onChanged: (value) {
          setState(() {
            todo.checked = value!;
          });
        },)),
      title: titleWidget,
      trailing: trailingButton,
    );
  }

  // display text when _isEditingMode == false, and textfield otherwise
  Widget get titleWidget {
    if (_isEditingMode) {
      _todoEditingController = TextEditingController(text: todo.name);
      return TextField(
        controller: _todoEditingController,
      );
    } else {
      return Text(todo.name, style: _getTextStyle(todo.checked));
    }
  }

  // display edit icon when _isEditingMode == false, and check icon otherwise
  Widget get trailingButton {
    if (_isEditingMode) {
      return IconButton(onPressed: saveChange, icon: const Icon(Icons.check));
    } else {
      return IconButton(icon: const Icon(Icons.edit), onPressed: _toggleMode);
    }
  }

  // called when check button is pressed, saves changes made on textfield
  void saveChange() {
    todo.name = _todoEditingController.text;
    _toggleMode();
    widget.onChanged(todo);
    setState(() {
      todo.checked = false;
    });
  }

  // called when edit button or check button is pressed, toggles _isEditingMode
  void _toggleMode() {
    setState(() {
      _isEditingMode = !_isEditingMode;
    });
  }
  
  // add strikethrough to text, mark item as complete
  TextStyle? _getTextStyle(bool checked) {
    if (!checked) {
      return null;
    }

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }
}
