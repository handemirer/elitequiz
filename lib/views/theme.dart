import 'package:elitequiz/views/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Theme extends StatefulWidget {
  const Theme({Key? key}) : super(key: key);

  @override
  State<Theme> createState() => _ThemeState();
}

class _ThemeState extends State<Theme> {
  get eqColor => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      // backgroundColor: Colors.grey.shade300,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ValueListenableBuilder<Box>(
                    valueListenable: Hive.box('themedata').listenable(),
                    builder: (context, box, widget) {
                      var darkMode = box.get('darkmode', defaultValue: false);
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            eqText("Theme", size: 22),
                            Switch(
                                value: darkMode,
                                onChanged: (value) {
                                  Hive.box('themedata').put("darkmode", value);
                                })
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
