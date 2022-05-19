import 'package:cloud_firestore/cloud_firestore.dart';

class Quiz {
  String id;

  Quiz({
    required this.id,
  });

  factory Quiz.fromJson(
    //  Map<String, dynamic> json,
    id,
  ) {
    return Quiz(
      id: id,
    );
  }

/*
  Map<dynamic, dynamic> toJson() {
    return {"quantity": this.quantity};
  }
*/
  factory Quiz.fromFirestore(DocumentSnapshot documentSnapshot) {
    Quiz quiz = Quiz.fromJson(
        //documentSnapshot.data() as Map<String, dynamic>,
        documentSnapshot.id);
    return quiz;
  }
}
