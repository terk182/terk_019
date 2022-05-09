import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:terk_019/data/variables.dart';
import 'package:terk_019/pages/booking_page.dart';
import 'package:terk_019/services/set_booking.dart';
import 'package:terk_019/theme/colors.dart';
import 'package:intl/intl.dart';

class Addbookingpage extends StatelessWidget {
  const Addbookingpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final MyObject data = arguments['myData'];
    // print(data.title);

    return const MaterialApp(
      title: 'Flutter DateTimePicker Demo',
      home: MyHomePage(),
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('th', 'TH')], //, Locale('pt', 'BR')],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();

  late TextEditingController _controller2;

  String _initialValue = '';

  // ignore: unused_field
  String _valueChanged2 = '';
  String _valueToValidate2 = '';
  // ignore: unused_field
  String _valueSaved2 = '';

  // ignore: unused_field
  String _memberChanged = '';
  String _memberToValidate = '';
  // ignore: unused_field
  String _memberSaved = '';
  @override
  void initState() {
    super.initState();
    Intl.defaultLocale = 'pt_BR';
    _initialValue = DateTime.now().toString();

    _controller2 = TextEditingController(text: DateTime.now().toString());

    // ignore: unused_local_variable
    String lsHour = TimeOfDay.now().hour.toString().padLeft(2, '0');
    // ignore: unused_local_variable
    String lsMinute = TimeOfDay.now().minute.toString().padLeft(2, '0');

    _getValue();
  }

  Widget getAppBar() {
    return AppBar(
      title: const Text("booking"),
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BookingDetailPage(
                          customeruid: customerUid,
                          image: imgs,
                          name: customerName,
                          owphone: ownerphone,
                          uid: ownerUid,
                        )));
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

  /// This implementation is just to simulate a load data behavior
  /// from a data base sqlite or from a API
  Future<void> _getValue() async {
    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        //_initialValue = '2000-10-22 14:30';

        _controller2.text = _initialValue;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //if you passed object
    // final MyObject data = arguments['myData'];
    // print(data.title);

    return Scaffold(
      appBar:
          PreferredSize(child: getAppBar(), preferredSize: const Size.fromHeight(60)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Form(
          key: _oFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DateTimePicker(
                type: DateTimePickerType.dateTime,
                dateMask: 'd MMMM, yyyy - hh:mm a',
                controller: _controller2,
                //initialValue: _initialValue,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                //icon: Icon(Icons.event),
                dateLabelText: 'Date Time',
                use24HourFormat: false,
                locale: const Locale('th', 'TH'),

                onChanged: (val) => setState(() => _valueChanged2 = val),
                validator: (val) {
                  setState(() => _valueToValidate2 = val ?? '');
                  return null;
                },
                onSaved: (val) => setState(() => _valueSaved2 = val ?? ''),
                decoration: const InputDecoration(
                    labelText: 'วันเวลาจอง',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    labelText: 'จำนวนท่าน',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    border: OutlineInputBorder()),
                onFieldSubmitted: (value) {
                  setState(() {
                    _memberChanged = value;
                  });
                },
                onSaved: (value) {
                  setState(() {
                    _memberToValidate = value.toString();
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: primary,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                onPressed: () async {
                  final loForm = _oFormKey.currentState;

                  if (loForm?.validate() == true) {
                    loForm?.save();
                   // print(_valueToValidate2);
                  //  print(_memberToValidate);
                    var result = await Setbooking().value(
                        customerName,
                        _memberToValidate,
                        customerPhone,
                        _valueToValidate2,
                        "",
                        ownerUid,
                        itemUids,
                        itemnames,
                        customerUid);
                  
                    if (result == 'ok') {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: const Text('complete'),
                              actions: <Widget>[
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BookingDetailPage(
                                                    customeruid: customerUid,
                                                    image: imgs,
                                                    name: customerName,
                                                    owphone: ownerphone,
                                                    uid: ownerUid,
                                                  )));
                                    },
                                    child: const Text('Close')),
                              ],
                            );
                          });
                    }
                  }
                },
                child: const Text('Submit'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: primary,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                onPressed: () {
                  final loForm = _oFormKey.currentState;
                  loForm?.reset();

                  setState(() {
                    _valueChanged2 = '';

                    _valueToValidate2 = '';

                    _valueSaved2 = '';

                    _memberChanged = '';

                    _memberSaved = '';
                    _memberToValidate = '';
                  });

                  _controller2.clear();
                },
                child: const Text('Reset'),
              ),
              const SizedBox(height: 30),
              const Text(
                'DateTimePicker data value validator:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SelectableText(_valueToValidate2),
              SelectableText(_memberToValidate),
            ],
          ),
        ),
      ),
    );
  }
}
