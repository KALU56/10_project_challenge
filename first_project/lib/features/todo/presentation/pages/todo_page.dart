import 'package:first_project/features/todo/presentation/widgets/todo_list.dart';
import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
           backgroundColor: Colors.blue, 
        // Wrap Row inside the 'title'
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Todo APP'),
            SizedBox(width: 10),
            Icon(Icons.calendar_today),
          ],
        ),
      ),
           body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TodoItem(
              title: 'Buy groceries',
              subtitle: 'Milk, Eggs, Bread',
              onEdit: () => print('Edit Todo'),
              onDelete: () => print('Delete Todo'),
              onCheck: () => print('Complete Todo'),
            ),
            const SizedBox(height: 12),
            TodoItem(
              title: 'Gym Workout',
              subtitle: 'Leg day',
              onEdit: () => print('Edit Todo'),
              onDelete: () => print('Delete Todo'),
              onCheck: () => print('Complete Todo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Add new todo'); // Action when pressed
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
      ),
      // Optional: change position
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
