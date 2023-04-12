import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:random_user/screen/home/modal/home_modal.dart';
class ApiHelper
{
  Future<PersonModal> currency()
  async {
    Uri link = Uri.parse("https://randomuser.me/api/");
    var json = await http.get(link);
    var data = jsonDecode(json.body);
    print(json.body);
    PersonModal person = PersonModal.fromJson(data);
    return person;
  }
}
