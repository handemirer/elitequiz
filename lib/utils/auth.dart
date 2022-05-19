import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elitequiz/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:elitequiz/models/my_user.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyUser? _userFromFirebaseUser(User? user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  Stream<MyUser?> get myuser {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user));
  }

  Future signInWithEmailandPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }

  Future signUpWithEmailandPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      await FirebaseFirestore.instance.collection('users').doc(user!.uid).set(
        {
          'id': user.uid,
          'point': 0,
          "name": "ABC XYZ",
          "type1": 0,
          "type2": 0,
          "type3": 0,
          "profilePhoto": photoData
        },
      );
      return _userFromFirebaseUser(user);
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      _auth.signOut();
      return _userFromFirebaseUser(null);
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }
}
