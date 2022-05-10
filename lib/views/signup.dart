import 'package:elitequiz/utils/auth.dart';
import 'package:elitequiz/utils/constants.dart';
import 'package:elitequiz/utils/navigator.dart';
import 'package:elitequiz/views/signin.dart';
import 'package:elitequiz/views/widgets.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthServices _auth = AuthServices();
  bool loading = false;

  late String email;
  late String password;
  late String passwordConfirm;
  late String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: eqAppBar("", actions: [
        InkWell(
          onTap: () {
            eqNavigatorPush(context: context, builder: const SignIn());
          },
          child: const Center(
            child: Padding(
              padding: EdgeInsets.all(14.0),
              child: Text(
                "Sign In",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ]),
      backgroundColor: eqColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      eqText(
                        "Sign Up",
                        color: Colors.white,
                        size: 34,
                      ),
                      const SizedBox(height: 26),
                      eqText(
                        "Sign up a account and enjoy the app.",
                        color: Colors.white,
                        size: 26,
                      ),
                    ],
                  ),
                ),
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
                              hint: "Email",
                              onChanged: (val) {},
                            ),
                            const SizedBox(height: 8),
                            eqTextField(
                                hint: "Password",
                                onChanged: (val) {},
                                password: true),
                            const SizedBox(height: 8),
                            eqTextField(
                                hint: "Confirm Password",
                                onChanged: (val) {},
                                password: true),
                            const SizedBox(height: 8),
                            eqButtonRow(
                              title: 'Sign In',
                              onPressed: () {},
                              textColor: Colors.white,
                              color: eqColor,
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
