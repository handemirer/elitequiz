import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elitequiz/models/category.dart';
import 'package:elitequiz/models/my_user.dart';
import 'package:elitequiz/models/profile.dart';
import 'package:elitequiz/utils/auth.dart';
import 'package:elitequiz/utils/constants.dart';
import 'package:elitequiz/views/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        ),*/
        StreamProvider<List<Category>>(
          create: (context) => categories(),
          initialData: const [],
        ),
        StreamProvider<Profile>(
          create: (context) => profile(),
          initialData: Profile(id: "", name: "", point: 0, profilePhoto: ""),
        ),
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
        home: const Wrapper(),
      ),
    );
  }

  Stream<Profile> profile() {
    var ref = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    return ref.snapshots().map((event) => Profile.fromFirestore(event));
  }

  Stream<List<Category>> categories() {
    var ref = FirebaseFirestore.instance.collection('categories');
    return ref.snapshots().map(
        (list) => list.docs.map((doc) => Category.fromFirestore(doc)).toList());
  }
}
