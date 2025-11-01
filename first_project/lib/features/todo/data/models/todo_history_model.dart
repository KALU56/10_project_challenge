class TodoHistoryDto {
  final String uid;
  final String title;
  final bool completed;
  final String date;

  TodoHistoryDto({
    required this.uid,
    required this.title,
    required this.completed,
    required this.date,
  });

  factory TodoHistoryDto.fromJson(Map<String, dynamic> json) => TodoHistoryDto(
        uid: json['uid'],
        title: json['title'],
        completed: json['completed'],
        date: json['date'],
      );
}
