import 'package:elitequiz/models/my_user.dart';
import 'package:elitequiz/views/home.dart';
import 'package:elitequiz/views/welcome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyUser? user = Provider.of<MyUser?>(context, listen: true);
    if (user == null) {
      return const Welcome();
    } else {
      return const Home();
    }
  }
}
