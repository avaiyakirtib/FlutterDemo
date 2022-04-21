import 'dart:async';

import 'package:flutter/material.dart';
import 'package:practicaltest/view/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Contactlist.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  var loginUser;
  @override
  void initState() {
    super.initState();
    data();
    //Splash screen timer
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                // Login check to decide where to navigat from splash screen
                    loginUser == "true" ? Contactlist() : Login())));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/2,left: MediaQuery.of(context).size.width/4.1),
            child: Text("Splash Screen",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
          )),
    );
  }


  data() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      loginUser = prefs.getString("isLogin");
    });
  }
}
