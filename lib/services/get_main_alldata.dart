import 'package:terk_019/models/all.dart';
import 'package:terk_019/theme/api_path.dart';
import 'package:http/http.dart' as http;

class Getall {
  Future<Allmodel> getdataapi() async {
    var url = Uri.parse(urlmaindata);
    var response = await http.get(url);

    var result = allmodelFromJson(response.body);

    return result;
  }
}
