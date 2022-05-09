import 'package:terk_019/theme/api_path.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class Setbooking {
  Future<dynamic> value(
      String name,
      String num,
      String phone,
      String date,
      String uid,
      String owner,
      String item,
      String itemname,
      String customeruid) async {
    var uuid = const Uuid();

    // Generate a v1 (time-based) id
    var v1 = uuid.v1(); // -> '6c84fb90-12c4-11e1-840d-7b25c5ee775a'
    var url = Uri.parse(urladdbooking);
    var response = await http.post(url, body: {
      "name": name,
      "num": num,
      "phone": phone,
      "date": date,
      "uid": v1,
      "owner": owner,
      "item": item,
      "item_name": itemname,
      "customer_uid": customeruid,
    });

    var status = response.body;
    // print(status);
    return status;
  }
}
