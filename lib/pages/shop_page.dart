import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:terk_019/data/variables.dart';

import 'package:terk_019/services/get_promotion_list.dart';
import 'package:terk_019/theme/colors.dart';

import 'package:terk_019/theme/padding.dart';

import 'package:terk_019/widgets/main_app_bar.dart';
import 'package:terk_019/widgets/store_card.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  void initState() {
  //  print(customerName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: textWhite,
      appBar: PreferredSize(
          child: MainAppBar(size: size), preferredSize: const Size.fromHeight(80)),
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(color: light),
            child: Padding(
              padding: const EdgeInsets.all(mainPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder(
                      future: Getpromotionlist().uid("62345c9c5d1ba"),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot2) {
                        if (snapshot2.connectionState == ConnectionState.done) {
                          var result2 = snapshot2.data;
                          return Column(
                            children: List.generate(result2.promotion.length,
                                (index) {
                              return Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: bottomMainPadding),
                                  child: GestureDetector(
                                    onTap: () {
                                      promotionuid =
                                          result2.promotion[index].promotionUid;
                                      Navigator.of(context).pushNamed(
                                        "/qr_promotion",
                                      );
                                    },
                                    // ignore: avoid_unnecessary_containers
                                    child: Container(
                                      child: StoreCard(
                                        width: size.width - (mainPadding * 2),
                                        name: result2
                                            .promotion[index].promotionName,
                                        img: result2.promotion[index].imgPath,
                                        isOpen: true,
                                        tags: result2
                                            .promotion[index].promotionUid,
                                        deliveryTime: result2
                                            .promotion[index].startDate
                                            .toString(),
                                      ),
                                    ),
                                  ));
                            }),
                          );
                        }
                        return const LinearProgressIndicator();
                      }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getFooter() {
    List iconItems = [
      "assets/icons/home_icon.svg",
      "assets/icons/order_icon.svg",
      "assets/icons/bell_icon.svg",
      "assets/icons/profile_icon.svg"
    ];
    List textItems = ["Home", "Order", "Notification", "Profile"];
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
          color: textWhite,
          border: Border(
              top: BorderSide(width: 2, color: textBlack.withOpacity(0.06)))),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(iconItems.length, (index) {
            return InkWell(
              onTap: () {
                setState(() {});
              },
              child: Column(
                children: [
                  SvgPicture.asset(
                    iconItems[index],
                    width: 22,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    textItems[index],
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
