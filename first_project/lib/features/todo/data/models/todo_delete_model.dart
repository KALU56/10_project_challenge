class DeleteTodoDto {
  final String deletedId;
  final String status;

  DeleteTodoDto({
    required this.deletedId,
    required this.status,
  });

  factory DeleteTodoDto.fromJson(Map<String, dynamic> json) => DeleteTodoDto(
        deletedId: json['deleted_id'],
        status: json['status'],
      );
}
