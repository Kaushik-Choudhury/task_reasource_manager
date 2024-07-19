import 'package:flutter/material.dart';
import 'package:task_reasource_manager/services/task_service.dart';
import 'package:task_reasource_manager/models/task_model.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final TaskService _taskService = TaskService();
  late Stream<List<Task>> _taskStream;

  @override
  void initState() {
    super.initState();
    _taskStream = _taskService.getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tasks')),
      body: StreamBuilder<List<Task>>(
        stream: _taskStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          List<Task> tasks = snapshot.data!;
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              Task task = tasks[index];
              return ListTile(
                title: Text(task.title),
                subtitle: Text(task.description),
                trailing: Checkbox(
                  value: task.completed,
                  onChanged: (value) {
                    setState(() {
                      task.completed = value!;
                      _taskService.updateTask(task);
                    });
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to task creation screen
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
