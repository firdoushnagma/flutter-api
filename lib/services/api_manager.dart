import 'dart:convert';

import 'package:flutter_application_1/constants/strings.dart';
import 'package:flutter_application_1/models/newsInfo.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class API_Manager {
  Future<Welcome> getNews() async {
    var client = http.Client();
    var Welcome;

    try {
      var response = await client.get(Strings.news_url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        Welcome = Welcome.fromJson(jsonMap);
      }
    } catch (Exception) {
      return Welcome;
    }
  }
}
