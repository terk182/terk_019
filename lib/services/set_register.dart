import 'package:terk_019/models/register.dart';
import 'package:terk_019/theme/api_path.dart';
import 'package:http/http.dart' as http;

class Setregister {
  Future<Registermodel> register(
      String fname, String lname, String phone, String password) async {
    var url = Uri.parse(urlresgister);
    var response = await http.post(url, body: {
      "fname": fname,
      "lname": lname,
      "phone": phone,
      "password": password
    });

    var status = registermodelFromJson(response.body);

    return status;
  }
}
