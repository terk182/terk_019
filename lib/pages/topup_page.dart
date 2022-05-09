import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:terk_019/data/variables.dart';
import 'package:terk_019/theme/colors.dart';

import 'package:terk_019/theme/padding.dart';

class TopupPage extends StatefulWidget {
  const TopupPage({Key? key}) : super(key: key);

  @override
  _TopupPageState createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  TextEditingController topupValue = TextEditingController();
  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          PreferredSize(child: getAppBar(), preferredSize: const Size.fromHeight(60)),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            "assets/icons/arrow_back_icon.svg",
            color: textWhite,
          )),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.info))],
      backgroundColor: primary,
      flexibleSpace: Stack(
        children: const [],
      ),
    );
  }

  Widget getBody() {
    return Padding(
      padding: const EdgeInsets.all(mainPadding),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  "เติมเงิน",
                  style: TextStyle(
                      color: primary,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "จำนวนเงิน",
                  style: TextStyle(
                      fontSize: 16, color: grey, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                      color: textFieldBg,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      children: [
                        Flexible(
                          child: TextField(
                            controller: topupValue,
                            cursorColor: textBlack,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "จำนวนเงิน"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                //arguments
                // ignore: avoid_print
                print("******");
                // ignore: avoid_print
                print(topupValue.text);
                amount = double.parse(topupValue.text);
                // ignore: avoid_print
                print("******");
                Navigator.of(context).pushNamed(
                  "/qr_generate",
                );
              },
              child: Container(
                width: 141,
                height: 45,
                decoration: BoxDecoration(
                    color: primary, borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "QR Code",
                      style: TextStyle(
                          fontSize: 16,
                          color: textWhite,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    // getSvgIcon("arrow_forward_icon.svg")
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
