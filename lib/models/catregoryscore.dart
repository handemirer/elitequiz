import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryScore {
  String id;
  int type1;
  int type2;
  int type3;

  CategoryScore({
    required this.id,
    required this.type1,
    required this.type2,
    required this.type3,
  });

  factory CategoryScore.fromJson(Map<String, dynamic> json, id) {
    return CategoryScore(
      id: id,
      type1: json["type1"],
      type2: json["type2"],
      type3: json["type3"],
    );
  }

  factory CategoryScore.fromFirestore(DocumentSnapshot documentSnapshot) {
    CategoryScore categoryScore = CategoryScore.fromJson(
        documentSnapshot.data() as Map<String, dynamic>, documentSnapshot.id);

    return categoryScore;
  }
}
