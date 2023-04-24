import 'package:examflutteradvanced/screen/modal/home_modal.dart';
import 'package:flutter/material.dart';

import '../../ulitis/api_helper.dart';

class CovidProvider extends ChangeNotifier{
  CovidModal covidModal = CovidModal();
  // TextEditingController countryc = TextEditingController();
  // String country = "india";

  Future<CovidModal?> coronaApiGet() async {
    ApiHelper apiHelper = ApiHelper();
    CovidModal? response = await apiHelper.coronaApiCall();
    return response;
    // covidModal = response!;
  }

  // void search() {
  //   country = countryc.text;
  //   notifyListeners();
  //}
}