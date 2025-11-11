import 'package:first_project/features/todo/presentation/pages/calander_page.dart';
import 'package:first_project/features/todo/presentation/widgets/statwidget.dart';
import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  DateTime? _selectedDate;


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
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Weekly and Monthly side by side
                Row(
                  children: [
                    Expanded(child: StatWidget(title: "Weekly", done: 2, total: 35)),
                    SizedBox(width: 16),
                    Expanded(child: StatWidget(title: "Monthly", done: 10, total: 20)),
                  ],
                ),
                SizedBox(height: 16),
                // Daily stat below
                StatWidget(title: "Daily", done: 1, total: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

