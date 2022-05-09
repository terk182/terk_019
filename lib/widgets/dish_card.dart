import 'package:flutter/material.dart';
import 'package:terk_019/theme/colors.dart';
import 'package:terk_019/theme/fontsizes.dart';
import 'package:terk_019/theme/helper.dart';

class DishCard extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final dish;
  final double width;

  const DishCard({
    Key? key,
    required this.dish,
    this.width = 250,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: textWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ignore: sized_box_for_whitespace
          Container(
              width: width,
              height: getHeight(width, "4:3"),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image.network(
                  getImageNetwork(dish["image"]),
                  fit: BoxFit.cover,
                ),
              )),
          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dish["name"] ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: textBlack,
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "By " + dish["store"],
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: grey,
                    fontSize: subTitleFontSize,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    getSvgIcon("clock_icon.svg"),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Est: " + dish["delivery_time"],
                      style: const TextStyle(
                          color: primary,
                          fontSize: hintTextFontSize,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
