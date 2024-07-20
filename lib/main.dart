import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:task_resource_manager/screens/auth_screen.dart';
import 'package:task_resource_manager/screens/home_screen.dart';
import 'package:task_resource_manager/firebase_option.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Management App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AuthScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
