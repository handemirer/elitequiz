import 'dart:convert';

import 'package:elitequiz/models/category.dart';
import 'package:elitequiz/models/profile.dart';
import 'package:elitequiz/utils/constants.dart';
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
          Expanded(
              child: Container(
            color: Colors.red,
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: eqText("Category", size: 26, color: Colors.black),
          ),
          Expanded(
              child: Container(
            color: Colors.amber,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      eqText(categories[index].categoryName),
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: Image.memory(
                          base64Decode(categories[index].categoryPhoto),
                        ),
                      ),
                      eqText(categories[index].quizCount + " Quiz"),
                    ],
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
