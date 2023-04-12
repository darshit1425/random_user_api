import 'package:flutter/material.dart';
import 'package:random_user_api/screeen/rendom_screen/modal/random_modal.dart';
import 'package:random_user_api/utils/api_helper.dart';

class Redom_provider extends ChangeNotifier {
  // RandomUser? rendomdata;

  Api_helper api_helper = Api_helper();

  Future<RandomUser?> get_rendom() async {
    RandomUser? rendomdata;
    rendomdata = await api_helper.postApiCall();

    return rendomdata;
  }
}
