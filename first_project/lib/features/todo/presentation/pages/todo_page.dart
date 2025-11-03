import 'package:first_project/features/todo/presentation/widgets/todo_list.dart';
import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  // Step 1: Create a dynamic list of todos
  List<Map<String, String>> todos = [
    {'title': 'Buy groceries', 'subtitle': 'Milk, Eggs, Bread'},
    {'title': 'Gym Workout', 'subtitle': 'Leg day'},
  ];

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
      // Step 2: Replace Column with ListView.builder
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            final todo = todos[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: TodoItem(
                title: todo['title']!,
                subtitle: todo['subtitle']!,
                onEdit: () {
                  print('Edit ${todo['title']}');
                  // Here you can add your edit logic
                },
                onDelete: () {
                  setState(() {
                    todos.removeAt(index);
                  });
                  print('Deleted ${todo['title']}');
                },
                onCheck: () {
                  print('Complete ${todo['title']}');
                  // Here you can mark as complete if needed
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Example: Adding a new todo dynamically
          setState(() {
            todos.add({
              'title': 'New Todo',
              'subtitle': 'Todo description',
            });
          });
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
