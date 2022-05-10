import 'package:elitequiz/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar eqAppBar(title, {bool rigthTitle = false}) {
  if (rigthTitle) {
    return AppBar(
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ],
    );
  } else {
    return AppBar(
      title: Text(title),
      elevation: 0,
    );
  }
}

Widget eqText(text, {double size = 14, Color color = Colors.black}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: size,
      color: color,
    ),
  );
}

Widget eqPadding(Widget widget, {double padding = 8}) {
  return Padding(
    padding: EdgeInsets.all(padding),
    child: widget,
  );
}

Widget eqLogo() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SvgPicture.asset(
        "assets/logo/logo.svg",
        height: 96,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            "assets/logo/elite.svg",
            height: 48,
          ),
          SvgPicture.asset(
            "assets/logo/quiz.svg",
            height: 48,
          ),
        ],
      )
    ],
  );
}

BoxDecoration roundDecor(Color color) {
  return BoxDecoration(
    color: color,
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(32.0),
      topRight: Radius.circular(32.0),
    ),
  );
}

Widget eqButton({
  required String title,
  VoidCallback? onPressed,
  Color textColor = Colors.black,
  Color color = eqColor,
}) {
  return ElevatedButton(
    child: Text(
      title,
      style: TextStyle(
        color: textColor,
      ),
    ),
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      elevation: 0,
      primary: color,
    ),
  );
}
