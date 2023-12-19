import 'dart:developer';

import 'package:code_task/controller/controller.dart';
import 'package:code_task/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
     Provider.of<SplashController>(context, listen: false)
        .splashTimer(context);
      WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<FoodController>(context, listen: false)
          .getFoodDetails();
      log('Post frame callback executed');
    });
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 300,
                height: 350,
                child: Image.asset(
                  "assets/images/food.png",
                  fit: BoxFit.cover,
                ),
              ),
              const Text(
                "Heey Foodiee",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
        ),
      ),
    );
  }
}