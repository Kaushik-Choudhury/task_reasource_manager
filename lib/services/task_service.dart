import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_reasource_manager/models/task_model.dart';

class TaskService {
  final CollectionReference taskCollection = FirebaseFirestore.instance.collection('tasks');

  // Create a new task
  Future<void> createTask(Task task) async {
    try {
      await taskCollection.doc(task.id).set(task.toJson());
    } catch (e) {
      print(e.toString());
    }
  }

  // Update a task
  Future<void> updateTask(Task task) async {
    try {
      await taskCollection.doc(task.id).update(task.toJson());
    } catch (e) {
      print(e.toString());
    }
  }

  // Delete a task
  Future<void> deleteTask(String id) async {
    try {
      await taskCollection.doc(id).delete();
    } catch (e) {
      print(e.toString());
    }
  }

  // Get a list of tasks
  Stream<List<Task>> getTasks() {
    return taskCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Task.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}
