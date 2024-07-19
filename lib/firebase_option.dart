import 'package:firebase_core/firebase_core.dart';

class FirebaseOptions {
  static Future<void> initializeFirebaseApp() async {
    await Firebase.initializeApp();
  }
}
