import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:terk_019/data/variables.dart';
import 'package:terk_019/services/get_wallet.dart';
import 'package:terk_019/theme/colors.dart';
import 'package:terk_019/theme/padding.dart';

// ignore: camel_case_types
class walletpage extends StatefulWidget {
  const walletpage({Key? key}) : super(key: key);

  @override
  _walletpageState createState() => _walletpageState();
}

// ignore: camel_case_types
class _walletpageState extends State<walletpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          PreferredSize(child: getAppBar(), preferredSize: const Size.fromHeight(60)),
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      title: const Text("wallet"),
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
    var size = MediaQuery.of(context).size;
    // ignore: prefer_typing_uninitialized_variables, unused_local_variable
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
                    onPressed: () {},
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
                      Navigator.popAndPushNamed(context, '/topup_page');
                    },
                    child: const Text('Topup'))
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
                future: Getwallet().uid(customerUid),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    var result = snapshot.data;
                    // ignore: avoid_print
                    print(customerUid);
                    // ignore: avoid_print
                    print(result.wallet);
                    var list = result.wallet;
                    // ignore: avoid_print
                    print(list.length);
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
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    color: list[index].status == "wait"
                                        ? Colors.redAccent
                                        : Colors.green,
                                    width: (size.width * 0.75) - 40,
                                    height: 80,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          list[index].shop,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              list[index].balance,
                                              style: const TextStyle(
                                                  color: textBlack,
                                                  fontSize: 16),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              list[index].status,
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
                                  // Container(
                                  //   width: 80,
                                  //   height: 80,
                                  //   decoration: BoxDecoration(
                                  //       borderRadius: BorderRadius.circular(12),
                                  //       image: DecorationImage(
                                  //           image: NetworkImage(
                                  //               list[index].imgPath),
                                  //           fit: BoxFit.cover)),
                                  // )
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
                  } else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [const Text("no data")],
                    );
                  }
                }),
          ],
        ),
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
                setState(() {
                  //pageIndex = index;
                });
              },
              child: Column(
                children: [
                  SvgPicture.asset(
                    iconItems[index],
                    width: 22,
                  //  color: pageIndex == index ? primary : textBlack,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    textItems[index],
                    style: const TextStyle(
                        fontSize: 10,)
                   //     color: pageIndex == index ? primary : textBlack),
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
