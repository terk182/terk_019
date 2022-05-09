import 'package:flutter/material.dart';
import 'package:terk_019/theme/colors.dart';
import 'package:terk_019/theme/fontsizes.dart';
import 'package:terk_019/theme/helper.dart';

class StoreCard extends StatelessWidget {
  final String img;
  final String name;
  final String tags;
  final String deliveryTime;
  final double width;
  final bool isOpen;
  const StoreCard({
    Key? key,
    required this.img,
    required this.name,
    required this.tags,
    required this.deliveryTime,
    required this.isOpen,
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
              height: 100,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image.network(
                  getImageNetwork(img),
                  fit: BoxFit.cover,
                ),
              )),
          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isOpen ? "Open" : "Close",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: isOpen ? success : danger,
                    fontSize: subTitleFontSize,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  name,
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
                  tags,
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
                      "Est: " + deliveryTime,
                      style: const TextStyle(
                          color: primary,
                          fontSize: hintTextFontSize,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
