// material
import 'package:flutter/material.dart';

class Utils {
  static final GlobalKey<ScaffoldMessengerState> messegerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(
      content: Text(text),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    );

    messegerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
