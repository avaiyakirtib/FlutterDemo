import 'dart:convert' as convert;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practicaltest/services/service_url.dart';

import '../model/loginmodel.dart';
import '../model/registermodel.dart';
import '../model/updatemodel.dart';

//This client contains API calling base methods
class APIClient {
  Future<User?> getListApiService(data) async {
    var url = Uri.parse(AppURLs.baseUrl);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      User serachData = User.fromJson(jsonResponse);
      return serachData;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }

  Future<User?> postApiService(String postURL, Object body,context) async {
    // var jwtToken = await _auth.currentUser?.getIdToken(); //await getJwtToken();
    var url = Uri.parse(AppURLs.baseUrl + postURL);
    final response = await http.post(
      url,
      body: body,
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
    );
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      User serachData = User.fromJson(jsonResponse);
      return serachData;
    } else if (response.statusCode == 401) {
      AppURLs.showSnackBar("User Not found", context, Colors.red);
      return null;
    } else if (response.statusCode == 404) {
      AppURLs.showSnackBar("User already exists", context, Colors.red);
      return null;
    } else {
      AppURLs.showSnackBar("Invalid Request", context, Colors.red);
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }

  Future<Register?> RegisterApiService(
      String postURL, Object body, context) async {
    // var jwtToken = await _auth.currentUser?.getIdToken(); //await getJwtToken();
    var url = Uri.parse(AppURLs.baseUrl + postURL);
    final response = await http.post(
      url,
      body: body,
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
    );
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      Register serachData = Register.fromJson(jsonResponse);
      return serachData;
    } else if (response.statusCode == 401) {
      AppURLs.showSnackBar("Invalid Request", context, Colors.red);
      return null;
    } else if (response.statusCode == 404) {
      AppURLs.showSnackBar("User already exists", context, Colors.red);
      return null;
    } else {
      AppURLs.showSnackBar("Invalid Request", context, Colors.red);
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }

  Future<Update?> UpdateApiService(String postURL, Object body, token) async {
    print('Token + ${AppURLs.data?.token}');
    var url = Uri.parse(AppURLs.baseUrl + postURL);
    final response = await http.post(url, body: body, headers: {
      "authorization": 'Bearer $token',
      "Content-Type": "application/x-www-form-urlencoded"
    });
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      Update serachData = Update.fromJson(jsonResponse);
      return serachData;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }
}
