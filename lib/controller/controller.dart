import 'package:code_task/model/model.dart';
import 'package:code_task/service/service.dart';
import 'package:flutter/material.dart';

class FoodController with ChangeNotifier {
  List<Category>? resData; 

  //provider function to get the food details
  Future<void>getFoodDetails() async{
    await ServiceClass().getFoodData().then((value) => {  
        resData = value
    },);
  }
}