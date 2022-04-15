import 'package:flutter/material.dart';

const MaterialColor eqColor = MaterialColor(eqPrimaryColor, <int, Color>{
  50: Color(0xFFECECFD),
  100: Color(0xFFCECFFA),
  200: Color(0xFFAEAFF7),
  300: Color(0xFF8E8FF4),
  400: Color(0xFF7577F1),
  500: Color(eqPrimaryColor),
  600: Color(0xFF5557ED),
  700: Color(0xFF4B4DEB),
  800: Color(0xFF4143E8),
  900: Color(0xFF3032E4),
});
const int eqPrimaryColor = 0xFF5D5FEF;

const MaterialColor eqColorAccent = MaterialColor(eqAccentColor, <int, Color>{
  100: Color(0xFFFFFFFF),
  200: Color(eqAccentColor),
  400: Color(0xFFC1C2FF),
  700: Color(0xFFA7A8FF),
});
const int eqAccentColor = 0xFFF4F4FF;