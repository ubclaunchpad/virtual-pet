import 'package:flutter/material.dart';

// todo item class
class Todo {
  String name;
  bool checked;

  Todo({
    required this.name, 
    required this.checked});
}

// Todo item widget
class TodoItemTile extends StatefulWidget {
  final Todo todo;
  final Function (Todo todo) onChecked;
  final Function(Todo todo) onChanged;
  
  TodoItemTile({
    required this.todo,
    required this.onChecked,
    required this.onChanged
  }) : super(key: ObjectKey(todo));

  @override
  _TodoItemTileState createState() => _TodoItemTileState();
}

class _TodoItemTileState extends State<TodoItemTile> {
  late Todo todo;
  late bool _isEditingMode;
  late TextEditingController _todoEditingController;

  @override
  void initState() {
    super.initState();
    this.todo = widget.todo;
    this._isEditingMode = false;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        widget.onChecked(todo);
      },
      title: titleWidget,
      // add the container for edit button
      trailing: trailingButton,
    );
  }

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

  Widget get trailingButton {
    if (_isEditingMode) {
      return IconButton(onPressed: saveChange, icon: Icon(Icons.check));
    } else {
      return IconButton(icon: Icon(Icons.edit), onPressed: _toggleMode);
    }
  }

  void saveChange() {
    this.todo.name = _todoEditingController.text;
    _toggleMode();
    if (widget.onChanged != null) {
      widget.onChanged(this.todo);
    }
  }

  void _toggleMode() {
    setState(() {
      _isEditingMode = !_isEditingMode;
    });
  }
  
  TextStyle? _getTextStyle(bool checked) {
    if (!checked) return null;

    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => new _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final TextEditingController _textFieldController = TextEditingController();
  final List<Todo> _todos = <Todo>[];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Todo list'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: _todos.map((Todo todo) {
          return TodoItemTile(
            todo: todo,
            onChecked: _handleChecked,
            onChanged: _handeChange,
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _displayDialog(),
          tooltip: 'Add Item',
          child: Icon(Icons.add)),
    );
  }

  void _handleChecked(Todo todo) {
    setState(() {
      todo.checked = !todo.checked;
    });
  }

// init onChange? not sure why this works lmao
  void _handeChange(Todo updatedTodo) {
  }
  
  void _addTodoItem(String name) {
    setState(() {
      _todos.add(Todo(name: name, checked: false));
    });
    _textFieldController.clear();
  }

  Future<void> _displayDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a new todo item'),
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: 'Type your new todo'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                Navigator.of(context).pop();
                _addTodoItem(_textFieldController.text);
              },
            ),
          ],
        );
      },
    );
  }
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Todo list',
      home: new TodoList(),
    );
  }
}
