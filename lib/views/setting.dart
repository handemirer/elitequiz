import 'dart:convert';

import 'package:elitequiz/models/profile.dart';
import 'package:elitequiz/utils/constants.dart';
import 'package:elitequiz/utils/database.dart';
import 'package:elitequiz/utils/navigator.dart';
import 'package:elitequiz/views/edit.dart';
import 'package:elitequiz/views/score.dart';
import 'package:elitequiz/views/theme.dart' as t;
import 'package:elitequiz/views/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    Profile profile = Provider.of<Profile>(context, listen: true);

    return Container(
      width: double.maxFinite,
      color: eqColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 64,
              backgroundColor: Colors.white,
              child: Image.memory(base64Decode(profile.profilePhoto)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: eqText("Lisa Writer", color: Colors.black, size: 28),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                eqScore(score: profile.type1.toString(), type: 1),
                const SizedBox(width: 8),
                eqScore(score: profile.type2.toString(), type: 2),
                const SizedBox(width: 8),
                eqScore(score: profile.type3.toString(), type: 3),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Container(
              width: double.maxFinite,
              decoration: roundDecor(Colors.grey.shade300),
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
                          Card(
                            child: ListTile(
                              onTap: () {
                                eqNavigatorPush(
                                  context: context,
                                  builder: const Edit(),
                                );
                              },
                              leading: const Icon(
                                Icons.create,
                                color: Colors.amber,
                              ),
                              title: eqText("Edit Profile"),
                              trailing: const Icon(
                                Icons.arrow_forward,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Card(
                            child: ListTile(
                              onTap: () {
                                eqNavigatorPush(
                                  context: context,
                                  builder: const Score(),
                                );
                              },
                              leading: const Icon(
                                Icons.grid_view,
                                color: Colors.blue,
                              ),
                              title: eqText("See All Category Achive"),
                              trailing: const Icon(
                                Icons.arrow_forward,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Card(
                            child: ListTile(
                              onTap: () {
                                eqNavigatorPush(
                                  context: context,
                                  builder: const t.Theme(),
                                );
                              },
                              leading: const Icon(Icons.build),
                              title: eqText("Settings"),
                              trailing: const Icon(
                                Icons.arrow_forward,
                                color: Colors.black,
                              ),
                            ),
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
    );
  }
}
