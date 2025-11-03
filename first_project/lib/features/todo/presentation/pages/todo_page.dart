import 'package:first_project/features/todo/presentation/pages/calander_page.dart';
import 'package:first_project/features/todo/presentation/widgets/todo_calendar.dart';
import 'package:first_project/features/todo/presentation/widgets/todo_item.dart';
import 'package:flutter/material.dart';

// Todo model with date
class Todo {
  String title;
  String subtitle;
  DateTime date; 
  bool isDone;

  Todo({
    required this.title,
    required this.subtitle,
    required this.date,
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
    Todo(
      title: 'Buy groceries',
      subtitle: 'Milk, Eggs, Bread, Cheese, Fruits',
      date: DateTime.now(),
    ),
    Todo(
      title: 'Gym Workout',
      subtitle: 'Leg day',
      date: DateTime.now().add(const Duration(days: 1)),
    ),
    Todo(
      title: 'Read Book',
      subtitle: 'Finish Flutter architecture chapter',
      date: DateTime.now(),
    ),
  ];

  DateTime? _selectedDate;

  // Add a new todo
  void _addTodo() {
    setState(() {
      todos.add(Todo(
        title: 'New Todo',
        subtitle: 'Todo description',
        date: DateTime.now(),
      ));
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

 
  void _openCalendar() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CalendarPage(
          focusedDay: _selectedDate ?? DateTime.now(),
          onDaySelected: (selectedDay) {
            setState(() {
              _selectedDate = selectedDay;
            });
          },
        ),
      ),
    );
  }
  // Filter todos by selected date
  List<Todo> get _filteredTodos {
    if (_selectedDate == null) return todos;
    return todos.where((todo) {
      return todo.date.year == _selectedDate!.year &&
          todo.date.month == _selectedDate!.month &&
          todo.date.day == _selectedDate!.day;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo APP'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: _openCalendar,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: _filteredTodos.length, // Use filtered list
          itemBuilder: (context, index) {
            final todo = _filteredTodos[index];
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
