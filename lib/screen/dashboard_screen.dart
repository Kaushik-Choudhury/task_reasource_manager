import 'package:flutter/material.dart';
import 'package:task_reasource_manager/services/task_service.dart';
import 'package:task_reasource_manager/models/task_model.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final TaskService _taskService = TaskService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: FutureBuilder(
        future: _taskService.getTasks().first,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          List<Task> tasks = snapshot.data as List<Task>;
          int completedTasks = tasks.where((task) => task.completed).length;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Total Tasks: ${tasks.length}'),
              Text('Completed Tasks: $completedTasks'),
              Text('Pending Tasks: ${tasks.length - completedTasks}'),
            ],
          );
        },
      ),
    );
  }
}
