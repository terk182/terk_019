import 'package:flutter/material.dart';
import 'package:terk_019/services/set_register.dart';
import 'package:terk_019/theme/colors.dart';
import 'package:terk_019/theme/padding.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    final GlobalKey<FormState> _formKey = GlobalKey();

    String firstName = "";
    String lastName = "";
    String phone = "";
    String password = "";
    String passwordconfirm = "";
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
                  "Register Page",
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
            Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          labelText: 'First Name',
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          border: OutlineInputBorder()),
                      onFieldSubmitted: (value) {
                        firstName = value;
                      },
                      onChanged: (value) {
                        firstName = value;
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
                          labelText: 'Last Name',
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
                        lastName = value;
                      },
                      onChanged: (value) {
                        lastName = value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      // keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          labelText: 'Phone Number',
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
                            value.length != 10) {
                          return 'หมายเลขโทรศัพท์ ต้องมี 10ตัวเลข';
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {
                        phone = value;
                      },
                      onChanged: (value) {
                        phone = value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: 'Password',
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
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {
                        password = value;
                      },
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: 'confirm Password',
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
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {
                        passwordconfirm = value;
                      },
                      onChanged: (value) {
                        passwordconfirm = value;
                      },
                    ),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
              //  print(firstName);
              //  print(lastName);
              //  print(phone.length);
              //  print(password);
              //  print(passwordconfirm);

                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.

                  if (password != passwordconfirm) {
                    // var context;

                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: const Text('รหัสผ่านไม่ถูกต้อง'),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Close')),
                            ],
                          );
                        });
                  } else {
                    Setregister()
                        .register(firstName, lastName, phone, password);
                 //   print(status);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('บันทึกข้อมูลสำเร็จ')),
                    );
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        "/login_page", (route) => false);
                  }
                } else {}

                // var context;
                // showDialog(
                //     context: context,
                //     builder: (context) {
                //       return AlertDialog(
                //         content: Text('รหัสผ่านไม่ถูกต้อง'),
                //         actions: <Widget>[
                //           TextButton(
                //               onPressed: () {
                //                 Navigator.pop(context);
                //               },
                //               child: Text('Close')),
                //         ],
                //       );
                //     });
                // Navigator.of(context)
                //     .pushNamedAndRemoveUntil("/root_app", (route) => false);

                // ignore: unused_local_variable
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
    );
  }
}
