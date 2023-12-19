import 'dart:async';

import 'package:code_task/view/home_scree.dart';
import 'package:flutter/material.dart';

class SplashController with ChangeNotifier {
  splashTimer(BuildContext context) async {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ));
    });
  }
}
