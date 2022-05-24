import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:terk_019/services/upload.dart';


class MyApptt extends StatelessWidget {
  const MyApptt({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? image;
  // ignore: prefer_typing_uninitialized_variables
  var imageTemp;
  Future pickImage() async {
    try {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 40);

      if (image == null) return;

      imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to pick image: $e');
    }
  }

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            MaterialButton(
                color: Colors.blue,
                child: const Text("Pick Image from Gallery",
                    style: TextStyle(
                        color: Colors.white70, fontWeight: FontWeight.bold)),
                onPressed: () {
                  pickImage();
                }),
            MaterialButton(
                color: Colors.blue,
                child: const Text("Pick Image from Camera",
                    style: TextStyle(
                        color: Colors.white70, fontWeight: FontWeight.bold)),
                onPressed: () {
                  pickImageC();
                }),
            const SizedBox(
              height: 20,
            ),
            image != null
                ? Image.file(image!)
                : const Text("No image selected"),
           
            InkWell(
              onTap: () async {
                // ignore: avoid_print
                // var terk = File('assets/images/promotion.jpg');
                // ignore: avoid_print
                print(imageTemp);
                // ignore: unused_local_variable
                String fileName = imageTemp.path.split('/').last;
                //String fileName = basename(imageTemp.path);
                uploadImage(imageTemp, "pp00pp", "pp00pp", "pp00pp", "pp00pp",
                    "100", "00", "00");
              },
              child: Container(
                width: 141,
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "submit",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.amberAccent,
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
          ],
        ),
      ),
    ));
  }
}
