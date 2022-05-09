import 'package:terk_019/models/booking.dart';
import 'package:terk_019/theme/api_path.dart';
import 'package:http/http.dart' as http;

class Getbooking {
  Future<Booking> uid(String uid) async {
    //var url = "https://hoolha.com/terk/api/gen/products";
    // ignore: avoid_print
    print(uid);
    var url = Uri.parse(urlbooking);
    var response = await http.post(url, body: {"uid": uid});

    var list = bookingFromJson(response.body);

    return list;
  }
}
