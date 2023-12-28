import 'package:code_task/model/model.dart';
import 'package:code_task/service/service.dart';
import 'package:flutter/material.dart';

class FoodController with ChangeNotifier {
  List<Category>? resData;

  late List<Category> allData;
  List<Category> foundData = [];

  //provider function to get the food details
  Future<void> getFoodDetails() async {
    await ServiceClass().getFoodData().then(
      (value) {
        resData = value;
        fetchAndAssingtoFounddata();
        notifyListeners();
      },
    );
  }

  void fetchAndAssingtoFounddata() async {
    allData = await ServiceClass().getFoodData() as List<Category>;
    foundData = allData;
    notifyListeners();
  }

  void runFilter(String enterdKeyword) {
    List<Category> result = [];
    if (enterdKeyword.isEmpty) {
      allData = result;
      notifyListeners();
    } else {
      result = allData
          .where((element) => element.strCategory!
              .toLowerCase()
              .contains(enterdKeyword.toLowerCase().trimRight()))
          .toList();
      foundData = result;
    }
    notifyListeners();
  }

  Widget? showResult() {
    if (foundData.isNotEmpty) {
      return ListView.separated(
          padding: const EdgeInsets.all(15),
          itemBuilder: ((context, index) {
            return ListTile(
              tileColor: const Color.fromARGB(255, 223, 219, 229),
              leading: SizedBox(
                height: 50,
                width: 50,
                child:
                    Image.network(foundData[index].strCategoryThumb.toString()),
              ),
              title: Text(
                foundData[index].strCategory.toString(),
                maxLines: 1,
                style: const TextStyle(
                    // fontFamily: 'UbuntuCondensed',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    overflow: TextOverflow.clip),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              onTap: () {},
            );
          }),
          separatorBuilder: (context, index) => SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
          itemCount: foundData.length);
    } else {
      return null;
    }
  }
}
