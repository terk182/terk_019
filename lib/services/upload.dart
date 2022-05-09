import 'dart:io';

import 'package:flutter/services.dart';
import 'package:terk_019/theme/api_path.dart';

import 'package:http/http.dart' as http;

uploadImage(
    File file,
    String customername,
    String customeruid,
    String productname,
    String productcode,
    String price,
    String expirationdate,
    String warrantydate) async {
  var request = http.MultipartRequest("POST", Uri.parse(urlupload));

  request.fields['customername'] = customername;
  request.fields['customeruid'] = customeruid;
  request.fields['product_name'] = productname;
  request.fields['product_code'] = productcode;
  request.fields['price'] = price;
  request.fields['expiration_date'] = expirationdate;
  request.fields['warranty_date'] = warrantydate;

  var picture = http.MultipartFile.fromBytes(
      'image', (await rootBundle.load(file.path)).buffer.asUint8List(),
      filename: 'terk.jpg');

  request.files.add(picture);

  var response = await request.send();

  var responseData = await response.stream.toBytes();

  var result = String.fromCharCodes(responseData);

  // ignore: avoid_print
  print(result);
}
