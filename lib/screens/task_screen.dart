import 'package:flutter/material.dart';
import 'package:task_resource_manager/services/task_service.dart';
import 'package:task_resource_manager/models/task_model.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final _taskController = TextEditingController();
  final _taskService = TaskService();
  bool _isLoading = false;

  void _addTask() async {
    final taskText = _taskController.text.trim();
    if (taskText.isEmpty) return;

    setState(() {
      _isLoading = true;
    });

    try {
      await _taskService.addTask(Task(id: '', task: taskText, userId: 'dummyUserId'));
      _taskController.clear();
    } catch (err) {
      print(err);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _taskController,
            decoration: InputDecoration(labelText: 'New Task'),
          ),
        ),
        if (_isLoading) CircularProgressIndicator(),
        ElevatedButton(
          child: Text('Add Task'),
          onPressed: _addTask,
        ),
        Expanded(
          child: StreamBuilder<List<Task>>(
            stream: _taskService.getTasks(),
            builder: (ctx, taskSnapshot) {
              if (taskSnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              final taskDocs = taskSnapshot.data!;
              return ListView.builder(
                itemCount: taskDocs.length,
                itemBuilder: (ctx, index) => ListTile(
                  title: Text(taskDocs[index].task),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
