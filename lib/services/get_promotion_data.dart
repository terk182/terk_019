import 'package:terk_019/models/promotion.dart';
import 'package:terk_019/theme/api_path.dart';
import 'package:http/http.dart' as http;

class Getpromotion {
  Future<Promotion> getdataapi() async {
    var url = Uri.parse(urlpromotiondata);
    var response = await http.get(url);

    var result = promotionFromJson(response.body);

    return result;
  }
}
