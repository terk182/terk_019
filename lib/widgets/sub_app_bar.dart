import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:terk_019/theme/colors.dart';
import 'package:terk_019/theme/fontsizes.dart';
import 'package:terk_019/theme/padding.dart';

class SubAppBar extends StatelessWidget {
  const SubAppBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0.8,
        backgroundColor: textWhite,
        automaticallyImplyLeading: false,
        primary: false,
        excludeHeaderSemantics: true,
        flexibleSpace: SafeArea(
          child: Container(
            padding:
                const EdgeInsets.only(left: leftMainPadding, right: rightMainPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Notification",
                          style: TextStyle(
                              color: textBlack,
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          "Clear",
                          style: TextStyle(
                              color: textBlack,
                              fontSize: subTitleFontSize,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ), systemOverlayStyle: SystemUiOverlayStyle.dark);
  }
}
