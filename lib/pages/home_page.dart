import 'package:flutter/material.dart';
import 'package:terk_019/data/category_json.dart';
import 'package:terk_019/data/variables.dart';
import 'package:terk_019/pages/store_detail_page.dart';
import 'package:terk_019/services/get_main_data.dart';
import 'package:terk_019/services/get_promotion_data.dart';
import 'package:terk_019/theme/colors.dart';
import 'package:terk_019/theme/fontsizes.dart';
import 'package:terk_019/theme/helper.dart';
import 'package:terk_019/theme/padding.dart';
import 'package:terk_019/widgets/dish_card2.dart';
import 'package:terk_019/widgets/main_app_bar.dart';
import 'package:terk_019/widgets/store_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    //print(customerName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: textWhite,
      appBar: PreferredSize(
          child: MainAppBar(size: size), preferredSize: const Size.fromHeight(80)),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          // ignore: sized_box_for_whitespace
          Container(
            height: getHeight(size.width, "21:9"),
            child: Image.asset(
              getImage("promotion.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          // ignore: sized_box_for_whitespace
          Container(
            width: double.infinity,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: mainPadding, bottom: mainPadding),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(storeTypes.length, (index) {
                    // ignore: sized_box_for_whitespace
                    return Container(
                      width: 120,
                      height: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          getSvgIcon(storeTypes[index]['image']),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(storeTypes[index]['name'])
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(color: light),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: topMainPadding, bottom: bottomMainPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        left: leftMainPadding, right: rightMainPadding),
                    child: Text(
                      "Special Offers",
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FutureBuilder(
                      future: Getmain().getdataapi(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          var result = snapshot.data;

                          // print(promotiondata);
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children:
                                  List.generate(result.shop.length, (index) {
                                //var store = result.shop[index];
                                if (index == 0) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: leftMainPadding,
                                        right: rightMainPadding),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    StoreDetailPage(
                                                      image: result
                                                          .shop[index].image,
                                                      name: result
                                                          .shop[index].name,
                                                      uid: result
                                                          .shop[index].tags,
                                                      customeruid: customerUid,
                                                      owphone: result
                                                          .shop[index]
                                                          .onwerPhone,
                                                    )));
                                      },
                                      // ignore: avoid_unnecessary_containers
                                      child: Container(
                                        child: StoreCard(
                                          width: 280,
                                          img: result.shop[index].image,
                                          name: result.shop[index].name,
                                          isOpen: result.shop[index].isOpen,
                                          tags: result.shop[index].tags,
                                          deliveryTime:
                                              result.shop[index].deliveryTime,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      right: rightMainPadding),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  StoreDetailPage(
                                                    image: result
                                                        .shop[index].image,
                                                    name:
                                                        result.shop[index].name,
                                                    uid:
                                                        result.shop[index].tags,
                                                    customeruid: customerUid,
                                                    owphone: result
                                                        .shop[index].onwerPhone,
                                                  )));
                                    },
                                    // ignore: avoid_unnecessary_containers
                                    child: Container(
                                      child: StoreCard(
                                        width: 280,
                                        img: result.shop[index].image,
                                        name: result.shop[index].name,
                                        isOpen: result.shop[index].isOpen,
                                        tags: result.shop[index].tags,
                                        deliveryTime:
                                            result.shop[index].deliveryTime,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          );
                        }
                        return const LinearProgressIndicator();
                      }),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(color: light),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: topMainPadding, bottom: bottomMainPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        left: leftMainPadding, right: rightMainPadding),
                    child: Text(
                      "Recommeded Dishes",
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FutureBuilder(
                      future: Getpromotion().getdataapi(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> promotionsnapshot) {
                        if (promotionsnapshot.connectionState ==
                            ConnectionState.done) {
                          var result = promotionsnapshot.data;

                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(result.promotion.length,
                                  (index) {
                                if (index == 0) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: leftMainPadding,
                                        right: rightMainPadding),
                                    child: GestureDetector(
                                      onTap: () {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             StoreDetailPage(
                                        //               image: result
                                        //                   .promotion[index]
                                        //                   .image,
                                        //               name: result
                                        //                   .promotion[index]
                                        //                   .name,
                                        //               uid: result
                                        //                   .shop[index].tags,
                                        //             )));
                                      },
                                      // ignore: avoid_unnecessary_containers
                                      child: Container(
                                        child: DishCard2(
                                          width: 180,
                                          deliverytime: result
                                              .promotion[index].deliveryTime,
                                          image: result.promotion[index].image,
                                          name: result.promotion[index].name,
                                          store: result.promotion[index].store,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      right: rightMainPadding),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  StoreDetailPage(
                                                    image: result
                                                        .promotion[index].image,
                                                    name: result
                                                        .promotion[index].name,
                                                    uid:
                                                        result.shop[index].tags,
                                                    customeruid: customerUid,
                                                    owphone: result
                                                        .shop[index].onwerPhone,
                                                  )));
                                    },
                                    // ignore: avoid_unnecessary_containers
                                    child: Container(
                                      child: DishCard2(
                                        width: 180,
                                        deliverytime: result
                                            .promotion[index].deliveryTime,
                                        image: result.promotion[index].image,
                                        name: result.promotion[index].name,
                                        store: result.promotion[index].store,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          );
                        }
                        return const LinearProgressIndicator();
                      }),
                ],
              ),
            ),
          ),
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
                      future: Getmain().getdataapi(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot2) {
                        if (snapshot2.connectionState == ConnectionState.done) {
                          var result2 = snapshot2.data;
                          return Column(
                            children:
                                List.generate(result2.shop.length, (index) {
                              return Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: bottomMainPadding),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  StoreDetailPage(
                                                    image: result2
                                                        .shop[index].image,
                                                    name: result2
                                                        .shop[index].name,
                                                    uid: result2
                                                        .shop[index].tags,
                                                    customeruid: customerUid,
                                                    owphone: result2
                                                        .shop[index].onwerPhone,
                                                  )));
                                    },
                                    // ignore: avoid_unnecessary_containers
                                    child: Container(
                                      child: StoreCard(
                                        width: size.width - (mainPadding * 2),
                                        name: result2.shop[index].name,
                                        img: result2.shop[index].image,
                                        isOpen: result2.shop[index].isOpen,
                                        tags: result2.shop[index].tags,
                                        deliveryTime:
                                            result2.shop[index].deliveryTime,
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
}
