import 'package:code_task/controller/controller.dart';
import 'package:code_task/utils/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<FoodController>(context, listen: false).getFoodDetails();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        actions: [
          SizedBox(
            height: 40,
            width: 250,
            child: searchBar(context)
          ),
        ],
      ),
      body: SafeArea(
        child: Consumer<FoodController>(
          builder: (context, value, child) {
            return Container(
              margin: const EdgeInsets.fromLTRB(20, 5, 15, 0),
              height: MediaQuery.of(context).size.height,
              // width: MediaQuery.of(context).size.width * 0.85,
              child: ListView.builder(
                itemCount: value.resData?.length,
                itemBuilder: (context, index) {
                  final data = value.resData![index];
                  return feedContainer(
                      url: data.strCategoryThumb.toString(),
                      context: context,
                      foodName: data.strCategory.toString(),
                      foodDescription: data.strCategoryDescription.toString());
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
