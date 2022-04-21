import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/loginmodel.dart';

class AppURLs {
  static const String baseUrl = 'http://flutter-intern.cupidknot.com/api/';
  static Data? data;
  // static const String apiKey = '10027b2621e04dbe8c68a4b58f9e9ff1';
  static showSnackBar(String content, BuildContext context, snackcolor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: snackcolor,
        content: Text(content),
        duration: Duration(milliseconds: 1500),
      ),
    );
  }
  static Future<bool> checkconnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}
