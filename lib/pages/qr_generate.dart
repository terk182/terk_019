// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:terk_019/data/variables.dart';
import 'package:terk_019/services/set_topup.dart';
import 'package:terk_019/theme/colors.dart';
import 'package:terk_019/theme/helper.dart';
import 'package:qr_flutter/qr_flutter.dart';


class GeneratePage extends StatefulWidget {
  const GeneratePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => GeneratePageState();
}

class GeneratePageState extends State<GeneratePage> {
  String qrData = promptpay(
      ownerphone, amount); // already generated qr code when the page opens

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: const Text('QR Code Generator'),
     
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            QrImage(
              //plce where the QR Image will be shown
              data: qrData,
            ),
            const SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
              child: FlatButton(
                padding: const EdgeInsets.all(15.0),
                onPressed: () {
                  Settopup().value(customerName, customerUid, ownerUid, "",
                      amount.toString(), qrData, "demo");
                  Navigator.pop(context);
                },
                child: const Text(
                  "ยืนยันการโอน",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.blue, width: 3.0),
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            )
          ],
        ),
      ),
    );
  }

  final qrdataFeed = TextEditingController();
}
