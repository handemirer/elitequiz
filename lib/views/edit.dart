import 'dart:convert';

import 'package:elitequiz/models/profile.dart';
import 'package:elitequiz/utils/constants.dart';
import 'package:elitequiz/views/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Edit extends StatefulWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  Widget build(BuildContext context) {
    Profile profile = Provider.of<Profile>(context, listen: true);
    return Scaffold(
      backgroundColor: eqColor,
      appBar: eqAppBar("Edit Profile", actions: [
        InkWell(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: eqText(
                "Save",
                color: Colors.white,
                size: 26,
              ),
            ),
          ),
        ),
      ]),
      body: Container(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 64,
                backgroundColor: Colors.white,
                child: Image.memory(base64Decode(profile.profilePhoto)),
              ),
            ),
            Expanded(
              child: Container(
                width: double.maxFinite,
                decoration: roundDecor(Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 32, right: 32, top: 8.0, bottom: 8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const SizedBox(height: 32),
                            eqTextField(
                              hint: "Name",
                              onChanged: (val) {},
                            ),
                            const SizedBox(height: 8),
                            eqTextField(
                              hint: "Surname",
                              onChanged: (val) {},
                            ),
                            const SizedBox(height: 8),
                            eqTextField(
                              hint: "Mail",
                              onChanged: (val) {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
