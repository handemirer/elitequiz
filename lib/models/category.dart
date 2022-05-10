import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  String id;
  String categoryName;
  String categoryPhoto;
  String quizCount;

  Category({
    required this.id,
    required this.categoryName,
    required this.categoryPhoto,
    required this.quizCount,
  });

  factory Category.fromJson(Map<String, dynamic> json, id) {
    return Category(
      id: id,
      categoryName: json["categoryName"],
      categoryPhoto: json["categoryPhoto"],
      quizCount: json["quizCount"],
    );
  }

/*
  Map<dynamic, dynamic> toJson() {
    return {"quantity": this.quantity};
  }
*/
  factory Category.fromFirestore(DocumentSnapshot documentSnapshot) {
    Category category = Category.fromJson(
        documentSnapshot.data() as Map<String, dynamic>, documentSnapshot.id);

    return category;
  }
}
