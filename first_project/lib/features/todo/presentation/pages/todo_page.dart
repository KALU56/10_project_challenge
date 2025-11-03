import 'package:flutter/material.dart';

// Step 1: Todo model
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

// Step 2: Reusable TodoItem widget
class TodoItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onCheck;

  const TodoItem({
    super.key,
    required this.title,
    required this.subtitle,
    this.onEdit,
    this.onDelete,
    this.onCheck,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Step 3: Expanded wraps Column to avoid overflow
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Row(
            children: [
              IconButton(onPressed: onEdit, icon: const Icon(Icons.edit)),
              IconButton(onPressed: onDelete, icon: const Icon(Icons.delete)),
              IconButton(onPressed: onCheck, icon: const Icon(Icons.check)),
            ],
          ),
        ],
      ),
    );
  }
}

// Step 4: Main TodoPage
class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  // Dynamic todo list
  List<Todo> todos = [
    Todo(title: 'Buy groceries', subtitle: 'Milk, Eggs, Bread, Cheese, Fruits, and very long text to test overflow'),
    Todo(title: 'Gym Workout', subtitle: 'Leg day'),
    Todo(title: 'Read Book', subtitle: 'Finish Flutter architecture chapter'),
  ];

  // Add a new todo
  void _addTodo() {
    setState(() {
      todos.add(Todo(title: 'New Todo', subtitle: 'Todo description'));
    });
  }

  // Delete a todo
  void _deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  // Toggle complete
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
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
