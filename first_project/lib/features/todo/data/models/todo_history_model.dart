class HistoryTodoModel {
  final String uid;
  final String title;
  final bool completed;
  final DateTime date;

  HistoryTodoModel({
    required this.uid,
    required this.title,
    required this.completed,
    required this.date,
  });

  factory HistoryTodoModel.fromMap(Map<String, dynamic> map) {
    return HistoryTodoModel(
      uid: map['uid'],
      title: map['title'],
      completed: map['completed'],
      date: DateTime.parse(map['date']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'title': title,
      'completed': completed,
      'date': date.toIso8601String(),
    };
  }
}
