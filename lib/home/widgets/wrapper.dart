import 'package:flutter/material.dart';
import 'package:tokopedia_ui/styles/color.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({
    Key? key,
    this.title,
    this.customTitle,
    this.color,
    this.height,
    this.child,
  }) : super(key: key);

  final String? title;
  final Widget? customTitle, child;
  final Color? color;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
            child: Row(
              children: [
                customTitle ??
                    Text(
                      title ?? '',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                const Spacer(),
                const Text(
                  "Lihat semua",
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            color: color ?? TKPColor.secondaryColor,
            height: height,
            child: child,
          )
        ],
      ),
    );
  }
}
