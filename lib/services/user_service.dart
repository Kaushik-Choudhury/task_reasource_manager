import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return result.user;
  }

  Future<User?> registerWithEmailAndPassword(String email, String password) async {
    UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    User? user = result.user;
    if (user != null) {
      await createUser(user.uid, user.email);
    }
    return user;
  }

  Future<void> signOut() async {
    return await _auth.signOut();
  }

  Future<void> createUser(String uid, String? email) async {
    return await usersCollection.doc(uid).set({
      'uid': uid,
      'email': email,
      'displayName': '',
      'photoUrl': '',
      'bio': '',
      'contactInfo': {
        'email': email,
        'phone': '',
        'address': ''
      }
    });
  }

  Future<DocumentSnapshot> getUser(String uid) async {
    return await usersCollection.doc(uid).get();
  }

  Future<void> updateUser(String uid, Map<String, dynamic> data) async {
    return await usersCollection.doc(uid).update(data);
  }
}
