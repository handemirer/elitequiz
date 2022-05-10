import 'package:cloud_firestore/cloud_firestore.dart';

class Profile {
  String id;
  String name;
  String profilePhoto;
  int point;

  Profile({
    required this.id,
    required this.name,
    required this.profilePhoto,
    required this.point,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json["id"],
      name: json["name"],
      profilePhoto: json["profilePhoto"],
      point: json["point"].toInt(),
    );
  }

/*
  Map<dynamic, dynamic> toJson() {
    return {"quantity": this.quantity};
  }
*/
  factory Profile.fromFirestore(DocumentSnapshot documentSnapshot) {
    Profile profile =
        Profile.fromJson(documentSnapshot.data() as Map<String, dynamic>);
    profile.id = documentSnapshot.id;
    return profile;
  }
}
