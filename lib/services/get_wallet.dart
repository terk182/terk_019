import 'package:terk_019/models/wallet.dart';
import 'package:terk_019/theme/api_path.dart';
import 'package:http/http.dart' as http;

class Getwallet {
  Future<Wallet> uid(String uid) async {
    //var url = "https://hoolha.com/terk/api/gen/products";
   // print(uid);
    var url = Uri.parse(urlwallet);
    var response = await http.post(url, body: {"uid": uid});
   // print("***********");
   // print(uid);
   // print("***********");
   // print(response.body);
    var list = walletFromJson(response.body);

    return list;
  }
}
