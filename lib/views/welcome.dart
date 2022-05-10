import 'package:elitequiz/utils/constants.dart';
import 'package:elitequiz/utils/navigator.dart';
import 'package:elitequiz/views/signin.dart';
import 'package:elitequiz/views/signup.dart';
import 'package:elitequiz/views/widgets.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: eqLogo()),
            Expanded(
              child: Container(
                width: double.maxFinite,
                decoration: roundDecor(eqColor),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 32, right: 32, top: 8.0, bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      eqText(
                        "Welcome",
                        size: 48,
                        color: Colors.white,
                      ),
                      eqText(
                        "Welcome the elite quiz,\njust enjoy.",
                        size: 25,
                        color: Colors.white,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          eqButton(
                            title: 'Sign up',
                            onPressed: () {
                              eqNavigatorPush(
                                context: context,
                                builder: const SignUp(),
                              );
                            },
                            textColor: Colors.white,
                            color: Colors.black,
                          ),
                          eqButton(
                            title: 'Sign in',
                            onPressed: () {
                              eqNavigatorPush(
                                context: context,
                                builder: const SignIn(),
                              );
                            },
                            textColor: Colors.black,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
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
