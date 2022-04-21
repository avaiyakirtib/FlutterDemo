import 'dart:io';
import 'dart:math';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:practicaltest/view/login.dart';
import 'package:practicaltest/viewmodel/rest_service.dart';
import 'package:practicaltest/services/service_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../CustomColors.dart';

class Homescreen extends StatefulWidget {
  @override
  ChildHomescreen createState() => ChildHomescreen();
}

class ChildHomescreen extends State<Homescreen> with updateprofileMixin {
  var dropdownvalue = 'MALE', formattedDate, iteams = ["MALE", "FEMALE"], getDate, loginUser, genderValue,indicator,fullName, mobileNumber, dobValue,email,token;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController dob = TextEditingController();
  final TextEditingController _mobile = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInitialData(); //Initialisation of data from local storage
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 150),
              const Center(
                  child: Text("Practicaltest",
                      style: TextStyle(
                          fontSize: 50, fontWeight: FontWeight.bold))),
              const Center(
                child: Text("Update Your Profile",
                    style: CustomColors.sliderscreen_title_style),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Image.asset(
                      'assets/user.png',
                      height: 20,
                      width: 20,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Expanded(
                      child: TextFormField(
                    validator: (phone) {
                      if (nameValid(phone!))
                        return null;
                      else {
                        return 'Enter a valid Name';
                      }
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Username',
                      hintStyle: CustomColors.edittext_loginpage_style,
                    ),
                    controller: _usernameController,
                  )),
                  const SizedBox(height: 20),
                ],
              ),
              CustomColors.login_page_divider_line,
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Image.asset(
                      'assets/phone.png',
                      height: 20,
                      width: 20,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Expanded(
                      child: TextFormField(
                    validator: (phone) {
                      if (phonedValid(phone!))
                        return null;
                      else {
                        return 'Enter a valid Mobile Number';
                      }
                    },
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Mobile Number',
                        hintStyle: CustomColors.edittext_loginpage_style,
                        counterText: ""),
                    controller: _mobile,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                  ))
                ],
              ),
              CustomColors.login_page_divider_line,
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Image.asset(
                      'assets/gender.png',
                      height: 20,
                      width: 20,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                      height: 40,
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          hint: Text(
                            'Select Gender',
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          items: iteams
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          value: dropdownvalue,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                          scrollbarRadius: const Radius.circular(40),
                          scrollbarThickness: 6,
                          scrollbarAlwaysShow: true,
                          buttonHeight: 20,
                          buttonWidth: 140,
                          itemHeight: 30,
                          dropdownMaxHeight: 200,
                          dropdownWidth: 150,
                          offset: const Offset(-5, 0),
                        ),
                      ))
                ],
              ),
              CustomColors.login_page_divider_line,
              InkWell(
                onTap: () async {
                  final choice = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1500),
                    lastDate: DateTime.now(),
                    initialDate: DateTime.now(),
                  );
                  getDate = choice.toString();
                  print(choice);
                  formattedDate =
                      "${choice?.year}-${choice?.month.toString().padLeft(2, '0')}-${choice?.day.toString().padLeft(2, '0')}";
                  dob.text = choice != null
                      ? formattedDate!
                      : dobValue.toString().split(" ").first;
                },
                child: TextField(
                    enabled: false,
                    controller: dob,
                    style: const TextStyle(
                      color: Colors.black,
                      height: 1,
                    ),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.watch_later_outlined),
                        hintStyle: TextStyle(fontSize: 15),
                        filled: true,
                        hintText: 'YYYY-MM-DD')),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  padding: const EdgeInsets.only(top: 3, left: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: MaterialButton(
                    minWidth: 180,
                    height: 50,
                    onPressed: () async {
                      if ((await AppURLs.checkconnectivity()) == true) {
                        if (_key.currentState!.validate()) {
                          setState(() {
                            indicator = !indicator;
                          });
                          if (_usernameController.text.isNotEmpty &&
                              _mobile.text.isNotEmpty &&
                              dropdownvalue.isNotEmpty &&
                              dob.text.isNotEmpty) {
                            setState(() {
                              var data = {
                                "full_name": _usernameController.text,
                                "mobile_no": _mobile.text,
                                "gender": dropdownvalue,
                                "dob": dob.text,
                              };
                              getData(data);
                            });
                          } else {
                            AppURLs.showSnackBar(
                                "Invalid Input, Please try again",
                                context,
                                Colors.red);
                          }
                        }
                      } else {
                        AppURLs.showSnackBar(
                            "No Internet connection found, Please try again!",
                            context,
                            Colors.red);
                      }
                    },
                    color: CustomColors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      "Update Profile",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  padding: const EdgeInsets.only(top: 3, left: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: MaterialButton(
                    minWidth: 180,
                    height: 50,
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setString('isLogin', 'false');
                      Navigator.pushAndRemoveUntil<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (BuildContext context) => Login(),
                        ),
                        (route) =>
                            false, //if you want to disable back feature set to false
                      );
                    },
                    color: CustomColors.dark_orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      "LOG OUT",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //API Call for Update profile
  Future<void> getData(data) async {
    var response =
        await APIClient().UpdateApiService('updateProfileDetails', data, token);
    if (response?.success == true) {
      var userData = response?.data;
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('isLogin', 'true');
      prefs.setString('email', userData!.userDetails!.email.toString());
      prefs.setString(
          'mobileNumber', userData.userDetails!.mobileNo.toString());
      prefs.setString('userName', userData.userDetails!.fullName.toString());
      prefs.setString('gender', userData.userDetails!.gender.toString());
      prefs.setString('dob', userData.userDetails!.dob.toString());
      AppURLs.showSnackBar("Profile Update Successfully!", context, Colors.red);
      Navigator.pop(context);
    } else {
      AppURLs.showSnackBar("Data Is Not updated", context, Colors.red);
    }
  }

      getInitialData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      loginUser = prefs.getString("isLogin");
      genderValue = prefs.getString("gender");
      dropdownvalue = genderValue;
      dobValue = prefs.getString("dob");
      fullName = prefs.getString("userName");
      token = prefs.getString("token");
      email = prefs.getString("email");
      mobileNumber = prefs.getString("mobileNumber");
      _mobile.text = mobileNumber;
      dob.text = dobValue.toString().split(' ').first;
      _usernameController.text = fullName;
    });
  }

}

mixin updateprofileMixin {
  bool isPasswordValid(String password) => password.length >= 6;

  bool phonedValid(String phone) => phone.length == 10;

  // ignore: prefer_is_empty
  bool nameValid(String name) => name.length >= 0;

  bool isEmailValid(String email) {
    Pattern pattern = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(email);
  }
}

