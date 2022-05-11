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
  List<Widget> cardList = [];
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
                  eqText("Your Progress", color: Colors.black, size: 18)
                ],
              ),
            ),
          ),
          Flexible(
            child: Stack(alignment: Alignment.center, children: cardList),
          )
        ],
      ),
    );
  }
}
