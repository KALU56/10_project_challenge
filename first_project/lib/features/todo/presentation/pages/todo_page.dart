import 'package:flutter/material.dart';
import 'package:first_project/features/todo/presentation/widgets/todo_list.dart'; // Your TodoItem widget

// Step 1: Create a Todo model
class Todo {
  String title;
  String subtitle;
  bool isDone;

  Todo({
    required this.title,
    required this.subtitle,
    this.isDone = false,
  });
}

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  // Step 2: Maintain a dynamic list of todos
  List<Todo> todos = [
    Todo(title: 'Buy groceries', subtitle: 'Milk, Eggs, Bread'),
    Todo(title: 'Gym Workout', subtitle: 'Leg day'),
  ];

  // Step 3: Function to add a new todo
  void _addTodo() {
    setState(() {
      todos.add(Todo(title: 'New Todo', subtitle: 'Todo description'));
    });
  }

  // Step 4: Function to delete a todo
  void _deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  // Step 5: Function to toggle complete
  void _toggleComplete(int index) {
    setState(() {
      todos[index].isDone = !todos[index].isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Todo APP'),
            Icon(Icons.calendar_today),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            final todo = todos[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: TodoItem(
                title: todo.title,
                subtitle: todo.subtitle,
                onEdit: () {
                  print('Edit ${todo.title}');
                  // You can open a dialog here to edit
                },
                onDelete: () => _deleteTodo(index),
                onCheck: () => _toggleComplete(index),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
