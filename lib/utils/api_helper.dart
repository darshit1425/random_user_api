import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:random_user_api/screeen/rendom_screen/modal/random_modal.dart';

class Api_helper{

  Future<RandomUser?>  postApiCall()
  async {
    String link ="https://randomuser.me/api/";
    Uri uri =Uri.parse(link);
    var response = await http.get(uri);

    if (response.statusCode == 200){
      var json = jsonDecode(response.body);

      RandomUser randomUser = RandomUser.fromJson(json);
      return randomUser;

    }
    else {
      return null;
    }
  }
}