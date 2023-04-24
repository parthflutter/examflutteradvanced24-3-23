import 'dart:convert';
import 'package:examflutteradvanced/screen/modal/home_modal.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  Future<CovidModal?> coronaApiCall() async {
    var api = Uri.parse("https://corona-virus-world-and-india-data.p.rapidapi.com/api");
    var response= await http.get(api,headers:{
      "X-RapidAPI-Key": "2ec5469b06msh2197869a39425dbp1720d4jsnc70ff410f626",
      "X-RapidAPI-Host": "corona-virus-world-and-india-data.p.rapidapi.com"
    } );

    var r = jsonDecode(response.body);
    CovidModal covidModal = CovidModal.fromJson(r);
    return covidModal;
  }
}


// "content-type": "application/octet-stream",