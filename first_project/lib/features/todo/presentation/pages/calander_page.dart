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
    final tasks = [
      {'time': '08:00 AM', 'title': 'Morning Exercise'},
      {'time': '10:00 AM', 'title': 'Team Meeting'},
      {'time': '02:00 PM', 'title': 'Project Work'},
    ];

    final primaryColor = Theme.of(context).colorScheme.primary;
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          // 🔹 Top Section — Blue background with centered calendar
          Container(
            width: double.infinity,
            // height: 250, // fixed height for header section
            color: primaryColor,
             padding: const EdgeInsets.all(16),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85, // 85% of screen width
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white, // calendar background
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TodoCalendar(
                focusedDay: focusedDay,
                onDaySelected: (selectedDay) {
                  onDaySelected(selectedDay);
                  Navigator.pop(context);
                },
              ),
            ),
          ),

          // 🔸 Bottom Section — White background with task list
          Expanded(
            child: Container(
              width: double.infinity,
              color: backgroundColor,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'My Tasks',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task = tasks[index];
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 2,
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            leading: const Icon(Icons.access_time),
                            title: Text(task['title']!),
                            subtitle: Text(task['time']!),
                            trailing: IconButton(
                              icon: const Icon(Icons.check_circle_outline),
                              onPressed: () {},
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
