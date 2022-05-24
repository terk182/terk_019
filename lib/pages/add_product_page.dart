import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:terk_019/data/variables.dart';
import 'package:terk_019/services/upload.dart';
import 'package:terk_019/theme/colors.dart';
import 'package:terk_019/theme/padding.dart';
import 'package:image_picker/image_picker.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  // ignore: unused_field
  File? image;
  // ignore: prefer_typing_uninitialized_variables
  var imageTemp;
  ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Future getImage() async {
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

  Widget getBody() {
    final GlobalKey<FormState> _formKey = GlobalKey();
  //  customerName = "demo";
  //  customerUid = "demo";
    // ignore: unused_local_variable
    String productname = "";
    // ignore: unused_local_variable
    String productcode = "";
    // ignore: unused_local_variable
    String price = "";
    // ignore: unused_local_variable
    String expirationdate = "";
    // ignore: unused_local_variable
    String warrantydate = "";
    return Padding(
      padding: const EdgeInsets.all(mainPadding),
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    "Add product Page",
                    style: TextStyle(
                        color: primary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            labelText: 'productname',
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.0),
                            ),
                            border: OutlineInputBorder()),
                        onFieldSubmitted: (value) {
                          productname = value;
                        },
                        onChanged: (value) {
                          productname = value;
                        },
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 3) {
                            return 'First Name must contain at least 3 characters';
                          } else if (value
                              .contains(RegExp(r'^[0-9_\-=@,\.;]+$'))) {
                            return 'First Name cannot contain special characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            labelText: 'productcode',
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.0),
                            ),
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 3) {
                            return 'Last Name must contain at least 3 characters';
                          } else if (value
                              .contains(RegExp(r'^[0-9_\-=@,\.;]+$'))) {
                            return 'Last Name cannot contain special characters';
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {
                          productcode = value;
                        },
                        onChanged: (value) {
                          productcode = value;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            labelText: 'price',
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.0),
                            ),
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              // ignore: prefer_is_empty
                              value.length < 1) {
                            return 'Last Name must contain at least 3 characters';
                          } else if (value.contains(RegExp(r'^[-=@,\.;]+$'))) {
                            return 'Last Name cannot contain special characters';
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {
                          price = value;
                        },
                        onChanged: (value) {
                          price = value;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            labelText: 'warrantydate',
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.0),
                            ),
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              // ignore: prefer_is_empty
                              value.length < 1) {
                            return 'Last Name must contain at least 3 characters';
                          } else if (value.contains(RegExp(r'^[-=@,\.;]+$'))) {
                            return 'Last Name cannot contain special characters';
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {
                          warrantydate = value;
                        },
                        onChanged: (value) {
                          warrantydate = value;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            labelText: 'expiration_date',
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.0),
                            ),
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              // ignore: prefer_is_empty
                              value.length < 1) {
                            return 'Last Name must contain at least 3 characters';
                          } else if (value.contains(RegExp(r'^[-=@,\.;]+$'))) {
                            return 'Last Name cannot contain special characters';
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {
                          expirationdate = value;
                        },
                        onChanged: (value) {
                          expirationdate = value;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  getImage();
                  //File('assets/images/promotion.jpg')
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
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
                        "img",
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
                height: 10,
              ),
              image != null
                  ? Image.file(image!)
                  : const Text("No image selected"),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    // ignore: avoid_print

                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    uploadImage(
                        imageTemp,
                        customerName,
                        customerUid,
                        productname,
                        productcode,
                        price,
                        expirationdate,
                        warrantydate);
                    Navigator.pop(context);
                  } else {}
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
                        "submit",
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
      ),
    );
  }
}
