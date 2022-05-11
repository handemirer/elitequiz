import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elitequiz/models/question.dart';
import 'package:elitequiz/utils/constants.dart';
import 'package:elitequiz/views/widgets.dart';
import 'package:flutter/material.dart';

class Resolve extends StatefulWidget {
  final int index;
  final String quizid;
  final String id;
  const Resolve(
      {Key? key, required this.index, required this.quizid, required this.id})
      : super(key: key);

  @override
  State<Resolve> createState() => _ResolveState();
}

class _ResolveState extends State<Resolve> {
  double progress = 0.0;
  List<Widget> cardList = [];

  void initialize() async {
    List<Question> questions = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc(widget.quizid)
        .collection("quizzes")
        .doc(widget.id)
        .collection("question")
        .get();

    questions = querySnapshot.docs
        .map((doc) =>
            Question.fromJson(doc.data() as Map<String, dynamic>, doc.id))
        .toList();

    cardList = _generateCards(questions);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initialize();
    //finishCard();
  }

  void finishCard() {
    cardList.add(
      Container(
        height: 460,
        width: 320,
        decoration: boxDecoration(
          radius: 20,
          bgColor: Colors.white,
          showShadow: true,
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              eqText("Congrats, you finished the quiz.", size: 24),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    eqScore(score: "10", type: 1),
                    eqScore(score: "0", type: 2),
                    eqScore(score: "1", type: 3),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              eqButtonRow(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  title: "Go Back!",
                  color: eqColor,
                  textColor: Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: eqAppBar("${widget.index + 1}. Quiz"),
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
                  eqText("Your Progress", color: Colors.black, size: 18),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    backgroundColor: Colors.white,
                    color: Colors.black,
                    value: progress,
                    semanticsLabel: 'Linear progress indicator',
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
          const SizedBox(height: 36),
          Flexible(
            child: Stack(
              alignment: Alignment.center,
              children: cardList,
            ),
          ),
        ],
      ),
    );
  }

  void removeCards(index) {
    setState(() {
      cardList.removeAt(index);
    });
  }

  List<Widget> _generateCards(List<Question> questions) {
    List<Widget> cardList = [];
    for (int x = 0; x < questions.length; x++) {
      cardList.add(
        Positioned(
          top: 10,
          child: Draggable(
            onDragEnd: (drag) {
              if (x == 0) {
                setState(() {
                  finishCard();
                });
              }
              removeCards(x);
            },
            childWhenDragging: Container(),
            feedback: Material(
              child: GestureDetector(
                child: Container(
                  decoration: boxDecoration(
                      radius: 20, bgColor: Colors.white, showShadow: true),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 200.0,
                        width: 320.0,
                        child: Container(
                          margin: const EdgeInsets.only(top: 50),
                          padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                          child: Center(
                            child: Text(
                              questions[x].question,
                              style: const TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Column(
                            children: <Widget>[
                              quizCardSelection("A.", questions[x].a, () {
                                /*
                                if (x == 0) {
                                  setState(() {
                                    const QuizResult().launch(context);
                                  });
                                }
                                removeCards(x);*/
                              }),
                              quizCardSelection("B.", questions[x].b, () {}),
                              quizCardSelection("C.", questions[x].c, () {}),
                              quizCardSelection("D.", questions[x].d, () {}),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
            child: GestureDetector(
              child: Container(
                decoration: boxDecoration(
                    radius: 20, bgColor: Colors.white, showShadow: true),
                child: Column(
                  children: <Widget>[
                    Container(
                        height: 200.0,
                        width: 320.0,
                        child: Container(
                          margin: const EdgeInsets.only(top: 50),
                          padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                          child: Center(
                            child: Text(
                              questions[x].question,
                              style: const TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ),
                        )),
                    Container(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Column(
                        children: <Widget>[
                          quizCardSelection("A.", questions[x].a, () {
                            /*
                                if (x == 0) {
                                  setState(() {
                                    const QuizResult().launch(context);
                                  });
                                }
                                removeCards(x);*/
                          }),
                          quizCardSelection("B.", questions[x].b, () {}),
                          quizCardSelection("C.", questions[x].c, () {}),
                          quizCardSelection("D.", questions[x].d, () {}),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
    return cardList;
  }

  Widget quizCardSelection(var option, var option1, onPressed) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        decoration: boxDecoration(
          showShadow: false,
          bgColor: Colors.white,
          radius: 10,
          color: Colors.amber,
        ),
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
        width: 320,
        child: Row(
          children: <Widget>[
            Text(option, style: TextStyle(color: Colors.blue)),
            SizedBox(width: 5),
            Text(option1, style: TextStyle(color: Colors.blue)),
          ],
        ),
      ),
    );
  }

  BoxDecoration boxDecoration(
      {double radius = 2,
      Color color = Colors.transparent,
      Color? bgColor,
      var showShadow = false}) {
    if (showShadow) {
      return BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: bgColor ?? Colors.white,
        border: Border.all(color: color),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      );
    } else {
      return BoxDecoration(
        color: bgColor ?? Colors.white,
        boxShadow: const [BoxShadow(color: Colors.transparent)],
        border: Border.all(color: color),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      );
    }
  }
}
