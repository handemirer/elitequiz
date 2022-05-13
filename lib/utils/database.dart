import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elitequiz/models/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Database {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference quiz = FirebaseFirestore.instance.collection('quiz');

  Future<Profile> getProfile(String type) async {
    var temp;
    await users
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(type)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        temp = Profile(
            id: "",
            name: element.data()["name"],
            point: 8,
            profilePhoto: "",
            type1: 0,
            type2: 0,
            type3: 0);
      });
    });
    return temp;
  }

  void CreateProfile() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(
      {
        'id': FirebaseAuth.instance.currentUser!.uid,
        'point': 0,
      },
    );
  }

  void updateProfileScore(type1, type2, type3, quizid) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(
      {
        "point": FieldValue.increment(type1 * 5),
        "type1": FieldValue.increment(type1),
        "type2": FieldValue.increment(type2),
        "type3": FieldValue.increment(type3),
      },
    );
    DocumentSnapshot ds = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("score")
        .doc(quizid)
        .get();

    if (ds.exists) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("score")
          .doc(quizid)
          .update(
        {
          "type1": FieldValue.increment(type1),
          "type2": FieldValue.increment(type2),
          "type3": FieldValue.increment(type3),
        },
      );
    } else {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("score")
          .doc(quizid)
          .set(
        {
          "type1": FieldValue.increment(type1),
          "type2": FieldValue.increment(type2),
          "type3": FieldValue.increment(type3),
        },
      );
    }
  }

  void updateProfile(profilePhoto, name) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(
      {
        "profilePhoto": profilePhoto,
        "name": name,
      },
    );
  }
}
