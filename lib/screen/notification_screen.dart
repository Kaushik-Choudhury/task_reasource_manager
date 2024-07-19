import 'package:flutter/material.dart';
import 'package:task_reasource_manager/services/notification_service.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final NotificationService _notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    _notificationService.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _notificationService.showNotification('New Task', 'You have a new task assigned');
          },
          child: Text('Show Notification'),
        ),
      ),
    );
  }
}
