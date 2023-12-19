import 'dart:developer';

import 'package:code_task/model/model.dart';
import 'package:code_task/utils/api/api.dart';
import 'package:dio/dio.dart';

class ServiceClass {

  //instance of dio
  Dio dio = Dio();
  String path = Api().baseUrl;

  //service function to get the food details from the api
  Future<List<Category>?> getFoodData() async {
    try {
      Response response = await dio.get(path);

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['categories'];
        final res = data.map((e) => Category.fromJson(e)).toList();

        log(res.toString());
        return res;
      }
    } catch (e) {
      log(e.toString(), name: 'error serveice');
    }
    return null;
  }
}
