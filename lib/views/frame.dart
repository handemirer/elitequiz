import 'package:elitequiz/utils/constants.dart';
import 'package:elitequiz/utils/database.dart';
import 'package:elitequiz/views/create.dart';
import 'package:elitequiz/views/home.dart';
import 'package:elitequiz/views/setting.dart';
import 'package:elitequiz/views/widgets.dart';
import 'package:flutter/material.dart';

class Frame extends StatefulWidget {
  const Frame({Key? key}) : super(key: key);

  @override
  State<Frame> createState() => _FrameState();
}

class _FrameState extends State<Frame> {
  int _currentIndex = 0;
  List<Widget> pages = [
    const Home(),
    const Create(),
    const Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: pages.elementAt(_currentIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: eqColor,
        selectedItemColor: Colors.white,
        onTap: (value) {
          setState(() => _currentIndex = value);
        },
        items: const [
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.add),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
