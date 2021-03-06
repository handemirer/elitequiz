import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elitequiz/models/category.dart';
import 'package:elitequiz/models/question.dart';
import 'package:elitequiz/utils/constants.dart';
import 'package:elitequiz/views/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  String selectedCategory = "finance";

  List<Question> questions = [
    Question(
        id: "0",
        question: "question",
        a: "a",
        b: "b",
        c: "c",
        d: "d",
        answer: "a")
  ];

  @override
  Widget build(BuildContext context) {
    List<String> categories = [];
    List<Category> categories2 =
        Provider.of<List<Category>>(context, listen: true);

    for (var e in categories2) {
      categories.add(e.id);
    }
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              decoration: appBarRoundDecor(eqColor),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Text(
                          "Create",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        eqShowDialogLoading(context);

                        QuerySnapshot querySnapshot = await FirebaseFirestore
                            .instance
                            .collection('categories')
                            .doc(selectedCategory)
                            .collection("quizzes")
                            .get();

                        CollectionReference reference =
                            FirebaseFirestore.instance.collection(
                          'categories/${selectedCategory}/quizzes/${querySnapshot.docs.length + 1}/question',
                        );
                        await FirebaseFirestore.instance
                            .collection('categories')
                            .doc("${selectedCategory}")
                            .collection("quizzes")
                            .doc("${querySnapshot.docs.length + 1}")
                            .set({"value": "true"});

                        var questionsMap = [];
                        questions.forEach((element) async {
                          await reference.add({
                            "question": element.question,
                            "answer": element.answer,
                            "a": element.a,
                            "b": element.b,
                            "c": element.c,
                            "d": element.d,
                          });
                        });
                        Navigator.pop(context);
                        eqShowDialogSuccess(context);
                      },
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Text(
                            "Submit",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: eqColor,
                  width: 2,
                ),
              ),
              child: DropdownButton<String>(
                //hint: const Text("Kategori Se??iniz"),
                isExpanded: true,
                value: selectedCategory,
                underline: Container(height: 0),
                icon: const Icon(Icons.arrow_drop_down),
                items: categories.map<DropdownMenuItem<String>>(
                  (String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  },
                ).toList(),
                onChanged: (newValue) {
                  selectedCategory = newValue!;
                  setState(() {});
                },
              ),
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: questions.length,
                itemBuilder: (context, item) {
                  return Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            eqText("${item + 1}.", color: eqColor, size: 32),
                            const SizedBox(
                              width: 8,
                            ),
                            Flexible(
                              child: eqTextField(
                                  onChanged: (text) {
                                    questions[item].question = text;
                                  },
                                  hint: "Question"),
                            ),
                          ],
                        ),
                        questionAnswerRowA(item),
                        questionAnswerRowB(item),
                        questionAnswerRowC(item),
                        questionAnswerRowD(item),
                      ],
                    ),
                  );
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: eqButtonRow(
                textColor: Colors.white,
                title: "Add Question",
                onPressed: () {
                  questions.add(
                    Question(
                        id: "",
                        question: "",
                        a: "",
                        b: "",
                        c: "",
                        d: "",
                        answer: ""),
                  );
                  setState(() {});
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget questionAnswerRowA(int item) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Radio(
            value: "a",
            groupValue: questions[item].answer,
            onChanged: (value) {
              setState(() {
                questions[item].answer = value.toString();
              });
            },
          ),
          Expanded(
            child: eqTextField(
              onChanged: (text) {
                questions[item].a = text;
              },
              hint: "Answer A",
            ),
          ),
        ],
      ),
    );
  }

  Widget questionAnswerRowB(int item) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Radio(
            value: "b",
            groupValue: questions[item].answer,
            onChanged: (value) {
              setState(() {
                questions[item].answer = value.toString();
              });
            },
          ),
          Expanded(
            child: eqTextField(
              onChanged: (text) {
                questions[item].b = text;
              },
              hint: "Answer B",
            ),
          ),
        ],
      ),
    );
  }

  Widget questionAnswerRowC(int item) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Radio(
            value: "c",
            groupValue: questions[item].answer,
            onChanged: (value) {
              setState(() {
                questions[item].answer = value.toString();
              });
            },
          ),
          Expanded(
            child: eqTextField(
              onChanged: (text) {
                questions[item].c = text;
              },
              hint: "Answer C",
            ),
          ),
        ],
      ),
    );
  }

  Widget questionAnswerRowD(int item) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Radio(
            value: "d",
            groupValue: questions[item].answer,
            onChanged: (value) {
              setState(() {
                questions[item].answer = value.toString();
              });
            },
          ),
          Expanded(
            child: eqTextField(
              onChanged: (text) {
                questions[item].d = text;
              },
              hint: "Answer D",
            ),
          ),
        ],
      ),
    );
  }
}

Future eqShowDialogSuccess(context) async {
  await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: eqText("????lem Durumu"),
          content: eqText("????lem Ba??ar??l??"),
          actions: [
            eqButton(
                title: "Tamam",
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );
      });
}

Future eqShowDialogLoading(context) async {
  await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Center(
                child: CircularProgressIndicator(),
              ),
            ],
          ),
        );
      });
}
