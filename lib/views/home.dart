import 'dart:convert';

import 'package:elitequiz/models/category.dart';
import 'package:elitequiz/models/profile.dart';
import 'package:elitequiz/utils/color.dart';
import 'package:elitequiz/utils/constants.dart';
import 'package:elitequiz/utils/navigator.dart';
import 'package:elitequiz/views/quizzes.dart';
import 'package:elitequiz/views/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<Category> categories =
        Provider.of<List<Category>>(context, listen: true);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: eqColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.military_tech,
                            color: Colors.amber,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          children: [
                            eqText(
                                Provider.of<Profile>(context, listen: true)
                                    .point
                                    .toString(),
                                color: Colors.white),
                            eqText("Point", color: Colors.white),
                          ],
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                ),
                const CircleAvatar(
                  radius: 32,
                  backgroundColor: eqColor,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [
                      0.3,
                      0.9,
                    ],
                    colors: [
                      eqColors[categories.first.categoryColor]!.shade400,
                      eqColors[categories.first.categoryColor]!.shade600,
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 16),
                    SizedBox(
                      width: 160,
                      height: 160,
                      child: Image.memory(
                        base64Decode(categories.first.categoryPhoto),
                      ),
                    ),
                    Center(
                      child: eqText(
                        categories.first.categoryName,
                        color:
                            eqColors[categories.first.categoryColor]!.shade800,
                        size: 32,
                      ),
                    ),
                    Center(
                      child: eqText(
                        categories.first.quizCount + " Quiz",
                        size: 22,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: eqText("Category", size: 26, color: Colors.black),
          ),
          Expanded(
              child: Container(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      eqNavigatorPush(
                          context: context,
                          builder: Quizzes(id: categories[index].id));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [
                            0.3,
                            0.9,
                          ],
                          colors: [
                            eqColors[categories[index].categoryColor]!.shade400,
                            eqColors[categories[index].categoryColor]!.shade600,
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 80,
                            height: 80,
                            child: Image.memory(
                              base64Decode(categories[index].categoryPhoto),
                            ),
                          ),
                          eqText(
                            categories[index].categoryName,
                            color: eqColors[categories[index].categoryColor]!
                                .shade800,
                            size: 18,
                          ),
                          eqText(categories[index].quizCount + " Quiz"),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )),
        ],
      ),
    );
  }
}
