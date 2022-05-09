import 'package:terk_019/models/maindata.dart';
import 'package:terk_019/theme/api_path.dart';
import 'package:http/http.dart' as http;

class Getmain {
  Future<Maindata> getdataapi() async {
    var url = Uri.parse(urlmaindata);
    var response = await http.get(url);

    var result = maindataFromJson(response.body);

    return result;
  }
}
