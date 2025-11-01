class DeleteTodoModel {
  final String deletedId;
  final String status;

  DeleteTodoModel({
    required this.deletedId,
    required this.status,
  });

  factory DeleteTodoModel.fromMap(Map<String, dynamic> map) {
    return DeleteTodoModel(
      deletedId: map['deleted_id'],
      status: map['status'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'deleted_id': deletedId,
      'status': status,
    };
  }
}
