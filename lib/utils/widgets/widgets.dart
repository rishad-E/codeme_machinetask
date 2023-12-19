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
                child: Image.network(url,fit: BoxFit.fill,),
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
