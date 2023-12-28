import 'package:code_task/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodController>(
      builder: (context, data, child) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            actions: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 15, 50, 0),
                width: MediaQuery.of(context).size.width * 0.85,
                child: TextField(
                  style: const TextStyle(fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                    filled: true,
                    fillColor: Colors.black.withOpacity(.3),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none),
                    hintText: 'search for food',
                    hintStyle: const TextStyle(color: Colors.white70),
                    prefixIcon: const Icon(Icons.search),
                  ),
                  onChanged: ((value) {
                    data.runFilter(value);
                  }),
                ),
              ),
            ],
          ),
          body: data.showResult() ?? Container(),
        );
      },
    );
  }
}
