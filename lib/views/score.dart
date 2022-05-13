import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elitequiz/models/catregoryscore.dart';
import 'package:elitequiz/utils/constants.dart';
import 'package:elitequiz/views/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Score extends StatefulWidget {
  const Score({Key? key}) : super(key: key);

  @override
  State<Score> createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scores"),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade300,
      body: StreamBuilder<List<CategoryScore>>(
        stream: scores(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data == null ? 0 : snapshot.data!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 8.0, bottom: 8, left: 32, right: 32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: eqText(
                            snapshot.data![index].id
                                    .substring(0, 1)
                                    .toUpperCase() +
                                snapshot.data![index].id.substring(
                                    1, snapshot.data![index].id.length) +
                                " Category",
                            size: 28),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            eqScore(
                                score: snapshot.data![index].type1.toString(),
                                type: 1),
                            eqScore(
                                score: snapshot.data![index].type2.toString(),
                                type: 2),
                            eqScore(
                                score: snapshot.data![index].type3.toString(),
                                type: 3),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Stream<List<CategoryScore>> scores() {
    var ref = FirebaseFirestore.instance
        .collection('users/${FirebaseAuth.instance.currentUser!.uid}/score');

    return ref.snapshots().map((list) =>
        list.docs.map((doc) => CategoryScore.fromFirestore(doc)).toList());
  }
}
