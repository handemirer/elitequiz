import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elitequiz/utils/constants.dart';
import 'package:elitequiz/utils/navigator.dart';
import 'package:elitequiz/views/resolve.dart';
import 'package:elitequiz/views/widgets.dart';
import 'package:flutter/material.dart';
import 'package:elitequiz/models/quiz.dart';

class Quizzes extends StatelessWidget {
  final String id;
  const Quizzes({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: eqAppBar(id.substring(0, 1).toUpperCase() +
          id.substring(1, id.length) +
          " Category"),
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            decoration: const BoxDecoration(
              color: eqColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32.0),
                bottomRight: Radius.circular(32.0),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, left: 32, right: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  eqText("Your Progress", color: Colors.black, size: 18)
                ],
              ),
            ),
          ),
          Flexible(
              child: StreamBuilder<List<Quiz>>(
            stream: quizzes(id),
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: snapshot.data == null ? 0 : snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ListTile(
                        onTap: () {
                          eqNavigatorPush(
                              context: context,
                              builder: Resolve(
                                index: index,
                                quizid: id,
                                id: snapshot.data![index].id,
                              ));
                        },
                        title: eqText("${index + 1}. Quiz"),
                        trailing: Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          )),
        ],
      ),
    );
  }

  Stream<List<Quiz>> quizzes(id) {
    var ref = FirebaseFirestore.instance.collection('categories/$id/quizzes');

    return ref.snapshots().map(
        (list) => list.docs.map((doc) => Quiz.fromFirestore(doc)).toList());
  }
}
