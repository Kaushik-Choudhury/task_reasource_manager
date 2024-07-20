class Task {
  final String id;
  final String task;
  final String userId;

  Task({required this.id, required this.task, required this.userId});

  factory Task.fromDocument(doc) {
    return Task(
      id: doc.id,
      task: doc['task'],
      userId: doc['userId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'task': task,
      'userId': userId,
    };
  }
}
