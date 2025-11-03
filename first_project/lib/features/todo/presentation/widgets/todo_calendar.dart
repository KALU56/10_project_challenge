import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TodoCalendar extends StatefulWidget {
  const TodoCalendar({super.key, required Null Function(dynamic selectedDay) onDaySelected, required DateTime focusedDay});

  @override
  State<TodoCalendar> createState() => _TodoCalendarState();
}

class _TodoCalendarState extends State<TodoCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
          print('Selected Day: $_selectedDay');
        });
      },
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.orange,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
