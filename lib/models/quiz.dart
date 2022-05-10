import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elitequiz/models/question.dart';

class Quiz {
  String id;
  List<Question> questions;

  Quiz({
    required this.id,
    required this.questions,
  });

  factory Quiz.fromJson(Map<String, dynamic> json, id) {
    return Quiz(
      id: id,
      questions: json["questions"],
    );
  }

/*
  Map<dynamic, dynamic> toJson() {
    return {"quantity": this.quantity};
  }
*/
  factory Quiz.fromFirestore(DocumentSnapshot documentSnapshot) {
    Quiz quiz = Quiz.fromJson(
        documentSnapshot.data() as Map<String, dynamic>, documentSnapshot.id);
    return quiz;
  }
}
