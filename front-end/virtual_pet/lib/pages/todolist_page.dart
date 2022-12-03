import 'package:flutter/material.dart';
import 'package:virtual_pet/widgets/app_bar.dart';
import 'package:virtual_pet/widgets/todo_item.dart';
import 'package:virtual_pet/widgets/todo_tile.dart';

// List view
class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController _textFieldController = TextEditingController();
  final List<Todo> _todos = <Todo>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "To-Do"),
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
