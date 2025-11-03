import 'package:first_project/features/todo/presentation/widgets/todo_calendar.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  final DateTime focusedDay;
  final ValueChanged<DateTime> onDaySelected;

  const CalendarPage({
    super.key,
    required this.focusedDay,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calendar')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TodoCalendar(
          focusedDay: focusedDay,
          onDaySelected: (selectedDay) {
            onDaySelected(selectedDay);
            Navigator.pop(context); // Return to TodoPage
          },
        ),
      ),
    );
  }
}
