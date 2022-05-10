import 'package:flutter/material.dart';

void eqNavigatorPush({
  required context,
  required Widget builder,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => builder),
  );
}
