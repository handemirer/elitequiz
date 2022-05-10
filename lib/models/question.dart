import 'package:cloud_firestore/cloud_firestore.dart';

class Question {
  String id;
  String question;
  String a;
  String b;
  String c;
  String d;
  String answer;

  Question({
    required this.id,
    required this.question,
    required this.a,
    required this.b,
    required this.c,
    required this.d,
    required this.answer,
  });

  factory Question.fromJson(Map<String, dynamic> json, id) {
    return Question(
      id: id,
      question: json["question"],
      a: json["a"],
      b: json["b"],
      c: json["c"],
      d: json["d"],
      answer: json["answer"],
    );
  }

/*
  Map<dynamic, dynamic> toJson() {
    return {"quantity": this.quantity};
  }
*/
  factory Question.fromFirestore(DocumentSnapshot documentSnapshot) {
    Question question = Question.fromJson(
        documentSnapshot.data() as Map<String, dynamic>, documentSnapshot.id);
    return question;
  }
}
