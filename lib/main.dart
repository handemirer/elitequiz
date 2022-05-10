import 'package:elitequiz/models/my_user.dart';
import 'package:elitequiz/utils/auth.dart';
import 'package:elitequiz/utils/constants.dart';
import 'package:elitequiz/views/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      //statusBarColor: Colors.transparent,
      statusBarColor: eqColor,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /*
        StreamProvider<List<MenuItem>>(
          create: (context) => streamOfMenuV2(),
          initialData: null,
        ),
        StreamProvider<List<CartItem>>(
          create: (context) => streamOfCart(),
          initialData: null,
        ),
        StreamProvider<int>(
          create: (context) => hesap(),
          initialData: null,
        ),*/
        StreamProvider<MyUser?>(
          create: (context) => AuthServices().myuser,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Elite Quiz',
        theme: ThemeData(
          primarySwatch: eqColor,
        ),
        home: const Welcome(),
      ),
    );
  }
}
