import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:task_reasource_manager/screen/auth_screen.dart';
import 'package:task_reasource_manager/screen/task_screen.dart';
import 'package:task_reasource_manager/screen/calendar_screen.dart';
import 'package:task_reasource_manager/screen/dashboard_screen.dart';
import 'package:task_reasource_manager/screen/notification_screen.dart';
import 'package:task_reasource_manager/screen/home_screen';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Management App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/tasks': (context) => TaskScreen(),
        '/calendar': (context) => CalendarScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/notifications': (context) => NotificationScreen(),
      },
    );
  }
}
