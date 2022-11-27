import 'package:flutter/material.dart';

// Todo item class
class Todo {
  String name;
  bool checked;

  Todo({
    required this.name, 
    required this.checked});
}

// Todo item tile widget
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
    if (!checked) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }
}

// List view
class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final TextEditingController _textFieldController = TextEditingController();
  final List<Todo> _todos = <Todo>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo list'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        // populate _todos and display each item as list tile
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
          child: const Icon(Icons.add)),
    );
  }

  void _handleChecked(Todo todo) {
    setState(() {
      todo.checked = !todo.checked;
    });
  }

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
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Todo list',
      home: TodoList(),
    );
  }
}
