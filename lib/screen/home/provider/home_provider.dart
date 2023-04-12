import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:random_user/screen/home/modal/home_modal.dart';
import 'package:random_user/utils/api_helper_class.dart';

class HomeProvider extends ChangeNotifier
{
  PersonModal? jsonData;
  void  personApiCalling()
  async {
    ApiHelper helper = ApiHelper();
     jsonData = await helper.currency();
    notifyListeners();
  }
}