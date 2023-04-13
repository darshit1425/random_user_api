import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:random_user_api/screeen/rendom_screen/modal/random_modal.dart';

class Api_helper{

  Future<UserModal?>  postApiCall()
  async {
    String link ="https://randomuser.me/api/";
    Uri uri =Uri.parse(link);
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    UserModal randomUser = UserModal.fromJson(json);
    print("$json");
    print("==============================================");
    return randomUser;

  }
}