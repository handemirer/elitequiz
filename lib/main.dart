import 'package:elitequiz/utils/constants.dart';
import 'package:elitequiz/views/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
//      statusBarColor: Colors.transparent,
      statusBarColor: eqColor,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Elite Quiz',
      theme: ThemeData(
        primarySwatch: eqColor,
      ),
      home: const Welcome(),
    );
  }
}
