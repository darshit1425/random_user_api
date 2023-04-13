import 'package:flutter/material.dart';
import 'package:random_user_api/screeen/rendom_screen/modal/random_modal.dart';
import 'package:random_user_api/utils/api_helper.dart';

class Redom_provider extends ChangeNotifier {
  // RandomUser? rendomdata;
    UserModal? rendomdata;
  Api_helper api_helper = Api_helper();

  Future<UserModal?> get_rendom() async {
    rendomdata = await api_helper.postApiCall();
    notifyListeners();
  }
}
