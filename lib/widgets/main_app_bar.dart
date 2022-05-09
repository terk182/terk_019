import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: import_of_legacy_library_into_null_safe

import 'package:terk_019/theme/colors.dart';
import 'package:terk_019/theme/fontsizes.dart';
import 'package:terk_019/theme/helper.dart';
import 'package:terk_019/theme/padding.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
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
            padding: const EdgeInsets.only(
                left: leftMainPadding, right: rightMainPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Delivery Details",
                          style: TextStyle(
                              color: textBlack,
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        getSvgIcon("arrow_right_icon.svg"),
                      ],
                    ),
                    Row(
                      children: [
                        getSvgIcon("search_icon.svg"),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/shop_page");
                            },
                            icon: Badge(
                              // badgeContent: Text(
                              //   '2',
                              //   style: TextStyle(color: textWhite),
                              // ),
                              child: const Icon(
                                Icons.abc,
                                size: 30,
                              ),
                            ))
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width:
                      (size.width - (leftMainPadding + rightMainPadding + 60)),
                  child: const Text(
                    "66 Preah Monivong Blvd (93), Phnom Penh 66 Preah Monivong Blvd (93), Phnom Penh",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: primary,
                      fontSize: subTitleFontSize,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark);
  }
}
