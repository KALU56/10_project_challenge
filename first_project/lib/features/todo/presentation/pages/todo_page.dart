
import 'package:first_project/features/todo/presentation/widgets/todo_list.dart';
import 'package:flutter/material.dart';

// Todo model
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
  List<Todo> todos = [
    Todo(title: 'Buy groceries', subtitle: 'Milk, Eggs, Bread, Cheese, Fruits, and very long text to test overflow'),
    Todo(title: 'Gym Workout', subtitle: 'Leg day'),
    Todo(title: 'Read Book', subtitle: 'Finish Flutter architecture chapter'),
  ];

  void _addTodo() {
    setState(() {
      todos.add(Todo(title: 'New Todo', subtitle: 'Todo description'));
    });
  }

  void _deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  void _toggleComplete(int index) {
    setState(() {
      todos[index].isDone = !todos[index].isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
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
                onEdit: () => print('Edit ${todo.title}'),
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
