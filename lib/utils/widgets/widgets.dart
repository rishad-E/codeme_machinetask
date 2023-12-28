import 'package:code_task/view/search_screen.dart';
import 'package:flutter/material.dart';

Widget feedContainer(
    {required BuildContext context,
    required String foodName,
    required String foodDescription,
    required String url}) {
  return Container(
    margin: const EdgeInsets.fromLTRB(15, 15, 15, 10),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(color: Colors.black, offset: Offset(2, 2), blurRadius: 2),
        BoxShadow(
          color: Colors.white,
        ),
      ],
    ),
    height: MediaQuery.of(context).size.height * 0.32,
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(foodName,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                  // color: kblack.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  url,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(foodDescription,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w300))
        ],
      ),
    ),
  );
}

Widget searchText(String data) {
  return Text(
    data,
    style: const TextStyle(
        color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 16),
  );
}

Widget searchBar(BuildContext context) {
  return Container(
    height: 50,
    padding: const EdgeInsets.only(right: 18, left: 15),
    child: TextField(
      readOnly: true,
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const SearchScreen()));
      },
      decoration: InputDecoration(
          fillColor: Colors.grey.withOpacity(0.5),
          filled: true,
          hintText: 'search items',
          hintStyle: const TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 16),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: Colors.black,
            iconSize: 28,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(25),
          ),
          contentPadding: const EdgeInsets.only(left: 15)),
    ),
  );
}
