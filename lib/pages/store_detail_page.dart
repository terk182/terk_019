import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:terk_019/data/variables.dart';
import 'package:terk_019/pages/booking_page.dart';

import 'package:terk_019/pages/root_app.dart';
import 'package:terk_019/services/get_promotion_list.dart';
import 'package:terk_019/theme/colors.dart';
import 'package:terk_019/theme/padding.dart';

class StoreDetailPage extends StatefulWidget {
  final String image;
  final String name;
  final String uid;
  final String customeruid;
  final String owphone;
  const StoreDetailPage({
    Key? key,
    required this.image,
    required this.name,
    required this.uid,
    required this.customeruid,
    required this.owphone,
  }) : super(key: key);

  @override
  _StoreDetailPageState createState() => _StoreDetailPageState();
}

class _StoreDetailPageState extends State<StoreDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: getAppBar(), preferredSize: const Size.fromHeight(200)),
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const RootApp()));
          },
          icon: SvgPicture.asset(
            "assets/icons/arrow_back_icon.svg",
            color: textWhite,
          )),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.info))],
      backgroundColor: primary,
      flexibleSpace: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.image), fit: BoxFit.cover)),
          ),
          Container(
            decoration: BoxDecoration(color: textBlack.withOpacity(0.5)),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Text(
                      widget.name,
                      style: const TextStyle(
                          color: textWhite,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 2, color: textWhite)),
                    child: const Padding(
                      padding: EdgeInsets.only(
                          left: 12, right: 12, bottom: 8, top: 8),
                      child: Text(
                        "Delivery 10 Min",
                        style: TextStyle(
                            fontSize: 16,
                            color: textWhite,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Icon(Icons.star, color: textWhite, size: 18),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "4.5",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: textWhite),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "(2591)",
                        style: TextStyle(fontSize: 15, color: textWhite),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    // ignore: prefer_typing_uninitialized_variables
    var list;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(mainPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black45),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Colors.blue.withOpacity(0.04);
                          }
                          if (states.contains(MaterialState.focused) ||
                              states.contains(MaterialState.pressed)) {
                            return Colors.blue.withOpacity(0.12);
                          }
                          return null; // Defer to the widget's default.
                        },
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black12),
                    ),
                    onPressed: () {
                      ownerUid = widget.uid;
                      Navigator.popAndPushNamed(context, '/wallet_page');
                    },
                    child: const Text('wallet')),
                const SizedBox(
                  width: 10,
                ),
                TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black45),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Colors.blue.withOpacity(0.04);
                          }
                          if (states.contains(MaterialState.focused) ||
                              states.contains(MaterialState.pressed)) {
                            return Colors.blue.withOpacity(0.12);
                          }
                          return null; // Defer to the widget's default.
                        },
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black12),
                    ),
                    onPressed: () {
                      ownerphone = widget.owphone;
                      ownerUid = widget.uid;
                      Navigator.popAndPushNamed(context, '/topup_page');
                    },
                    child: const Text('Topup')),
                const SizedBox(
                  width: 10,
                ),
                TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black45),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Colors.blue.withOpacity(0.04);
                          }
                          if (states.contains(MaterialState.focused) ||
                              states.contains(MaterialState.pressed)) {
                            return Colors.blue.withOpacity(0.12);
                          }
                          return null; // Defer to the widget's default.
                        },
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black12),
                    ),
                    onPressed: () {
                      ownerphone = widget.owphone;
                      ownerUid = widget.uid;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookingDetailPage(
                                    customeruid: widget.customeruid,
                                    image: widget.image,
                                    name: widget.name,
                                    owphone: ownerphone,
                                    uid: ownerUid,
                                  )));
                    },
                    child: const Text('Booking'))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Top Menu",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Most ordered right now",
                  style: TextStyle(
                      fontSize: 15, color: textBlack.withOpacity(0.8)),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            FutureBuilder(
                future: Getpromotionlist().uid(widget.uid),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    var result = snapshot.data;

                    if (result != null) {
                      list = result.promotion;
                      return Column(
                        children: List.generate(list.length, (index) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // ignore: sized_box_for_whitespace
                                    Container(
                                      width: (size.width * 0.75) - 50,
                                      height: 80,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            list[index].promotionName,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                list[index].discount,
                                                style: const TextStyle(
                                                    color: textBlack,
                                                    fontSize: 16),
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                list[index].discounType,
                                                style: const TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    color: textBlack,
                                                    fontSize: 16),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  list[index].imgPath),
                                              fit: BoxFit.cover)),
                                    )
                                  ],
                                ),
                              ),
                              const Divider(
                                thickness: 0.8,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          );
                        }),
                      );
                    }
                  } else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [const Text("no data")],
                    );
                  }

                  return const Text("no data");
                }),
          ],
        ),
      ),
    );
  }

  Widget getFooter() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 90,
      decoration: BoxDecoration(
          color: textWhite,
          border: Border(
              top: BorderSide(width: 2, color: textBlack.withOpacity(0.06)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size.width - 40,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: primary),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: textWhite)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "2",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: textWhite),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "View your cart",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: textWhite),
                  ),
                  const Text(
                    "\$ 3.98",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: textWhite),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
