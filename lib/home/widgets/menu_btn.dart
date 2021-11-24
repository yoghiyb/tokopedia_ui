import 'package:flutter/material.dart';

class MenuBtn extends StatelessWidget {
  const MenuBtn({
    Key? key,
    this.label,
    required this.imageUri,
  }) : super(key: key);

  final String? label;
  final String imageUri;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.pink,
      // margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 70,
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Image.asset(imageUri),
            ),
          ),
          Text(
            "$label",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 10,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
