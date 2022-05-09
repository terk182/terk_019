import 'package:terk_019/theme/api_path.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class Settopup {
  value(String customername, String customeruid, String owneruid,
      String topupuid, String balance, String topupdata, String crckey) async {
    var uuid = const Uuid();

    // Generate a v1 (time-based) id
    var v1 = uuid.v1(); // -> '6c84fb90-12c4-11e1-840d-7b25c5ee775a'
    var url = Uri.parse(urltopup);
    var response = await http.post(url, body: {
      "customer_name": customername,
      "customer_uid": customeruid,
      "owner_uid": owneruid,
      "topup_uid": v1,
      "balance": balance,
      "topup_data": topupdata,
      "crc_key": crckey,
    });

    var status = response.body.length;
    // print(status);
    return status;
  }
}
