import 'package:cloud_firestore/cloud_firestore.dart';

class Profile {
  String id;
  String name;
  String profilePhoto;
  int point;
  int type1;
  int type2;
  int type3;

  Profile({
    required this.id,
    required this.name,
    required this.profilePhoto,
    required this.point,
    required this.type1,
    required this.type2,
    required this.type3,
  });

  factory Profile.fromJson(Map<String, dynamic> json, id) {
    return Profile(
      id: id,
      name: json["name"],
      profilePhoto: json["profilePhoto"],
      point: json["point"].toInt(),
      type1: json["type1"].toInt(),
      type2: json["type2"].toInt(),
      type3: json["type3"].toInt(),
    );
  }

/*
  Map<dynamic, dynamic> toJson() {
    return {"quantity": this.quantity};
  }
*/
  factory Profile.fromFirestore(DocumentSnapshot documentSnapshot) {
    Profile profile = Profile.fromJson(
        documentSnapshot.data() as Map<String, dynamic>, documentSnapshot.id);

    return profile;
  }
}
