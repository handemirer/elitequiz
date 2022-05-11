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
}
/*

class Database {
  CollectionReference menu = FirebaseFirestore.instance.collection('menu');

  Future<List> getMenu(String type) async {
    List<MenuItem> temp = [];
    await menu.doc("types").collection(type).get().then((value) {
      value.docs.forEach((element) {
        temp.add(MenuItem(
            name: element.data()["name"],
            price: element.data()["price"],
            imgUrl: element.data()["url"]));
      });
    });
    return temp;
  }

  Future<String> getConstant(String icerik, String ozellik) async {
    DocumentSnapshot documentsnapshot = await FirebaseFirestore.instance
        .collection('constant')
        .doc(icerik)
        .get();
    String sonuc = documentsnapshot.data()[ozellik].toString();
    return sonuc;
  }

  void addIstek(String istek) async {
    await FirebaseFirestore.instance
        .collection('masalar')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('istekler')
        .add(
      {
        'text': istek,
      },
    );
  }

  void arttirAzalt(MenuItem food, int deger) async {
    await FirebaseFirestore.instance
        .collection('masalar')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('sepet')
        .doc("${food.id}")
        .update(
      {
        "quantity": FieldValue.increment(deger),
      },
    );
    if (deger > 0) {
      sepetFiyatiGuncelle(food.price);
    } else {
      sepetFiyatiGuncelle(-food.price);
    }
  }

  void urunTemizle(MenuItem food) async {
    await FirebaseFirestore.instance
        .collection('masalar')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('sepet')
        .doc("${food.id}")
        .delete();
    sepetFiyatiGuncelle(-food.price);
  }

  void sepeteEkle(MenuItem food) async {
    // TODO gereksiz kontrolü kaldır
    await FirebaseFirestore.instance
        .collection('masalar')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('sepet')
        .doc("${food.id}")
        .get()
        .then(
      (value) {
        if (value.exists) {
          arttirAzalt(food, 1);
        } else {
          FirebaseFirestore.instance
              .collection('masalar')
              .doc(FirebaseAuth.instance.currentUser.uid)
              .collection('sepet')
              .doc("${food.id}")
              .set({"quantity": 1});
          sepetFiyatiGuncelle(food.price);
        }
      },
    );
  }

  void sepetFiyatiGuncelle(int deger) async {
    await FirebaseFirestore.instance
        .collection('masalar')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .update({
      "hesap": FieldValue.increment(deger),
    });
  }
}
*/