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
        // Wrap Row inside the 'title'
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Todo List'),
            SizedBox(width: 10),
            Icon(Icons.calendar_today),
          ],
        ),
      ),
      body: const Center(
        child: Text('This is the Todo Page'),
      ),
    );
  }
}
