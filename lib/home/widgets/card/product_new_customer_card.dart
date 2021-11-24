import 'package:flutter/material.dart';

class ProductNewCustomerCard extends StatelessWidget {
  const ProductNewCustomerCard({
    Key? key,
    required this.title,
    this.subTtitle,
    this.secondSubTitle,
    this.color,
    this.blankCard = false,
    this.height,
    this.width,
  }) : super(key: key);

  final Color? color;
  final String title;
  final String? subTtitle, secondSubTitle;
  final bool blankCard;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    if (blankCard) {
      return SizedBox(
        height: height ?? 230,
        width: width ?? 120,
      );
    }
    return SizedBox(
      height: height ?? 230,
      width: width ?? 120,
      child: Card(
        color: color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Container(
                height: 120,
                width: double.infinity,
                color: Colors.white,
                child: Image.asset(
                  "assets/product/telkomsel_300px.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(
              height: 98,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subTtitle ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      secondSubTitle ?? '',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
