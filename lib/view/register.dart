import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:practicaltest/model/loginmodel.dart';
import 'package:practicaltest/viewmodel/rest_service.dart';
import 'package:practicaltest/services/service_url.dart';

import '../CustomColors.dart';
import 'Login.dart';

class Signup extends StatefulWidget {
  @override
  ChildSignup createState() => ChildSignup();
}

class ChildSignup extends State<Signup> with RegisterInputValidationMixin {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpasswordController = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController dob = TextEditingController();
  final TextEditingController _mobile = TextEditingController();
  var getDate, dropdownvalue = 'MALE', formattedDate, iteams = ["MALE", "FEMALE"];
  bool indicator = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 25),
              const Center(
                  child: Text("Practicaltest",
                      style: TextStyle(
                          fontSize: 50, fontWeight: FontWeight.bold))),
              const Center(
                child: Text("SIGN UP",
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
                    validator: (password) {
                      if (isPasswordValid(password!)) {
                        return null;
                      } else {
                        return 'Enter a valid username';
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
                      'assets/email.png',
                      height: 20,
                      width: 20,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Expanded(
                      child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                      hintStyle: CustomColors.edittext_loginpage_style,
                    ),
                    controller: _emailController,
                    validator: (Email) {
                      if (isEmailValid(Email!)) {
                        return null;
                      } else {
                        return 'Enter a valid email address';
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                  ))
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
                        validator: (password) {
                          if (isPasswordValid(password!)) {
                            return null;
                          } else {
                            return 'Enter a valid Number';
                          }
                        },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Mobile number',
                      hintStyle: CustomColors.edittext_loginpage_style,
                        counterText: ""
                    ),
                    controller: _mobile,
                    keyboardType: TextInputType.phone,
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
                      'assets/password.png',
                      height: 20,
                      width: 20,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Expanded(
                      child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      hintStyle: CustomColors.edittext_loginpage_style,
                    ),
                    controller: _passwordController,
                    validator: (password) {
                      if (isPasswordValid(password!)) {
                        return null;
                      } else {
                        return 'Enter a valid password';
                      }
                    },
                    keyboardType: TextInputType.visiblePassword,
                  ))
                ],
              ),
              CustomColors.login_page_divider_line,
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Image.asset(
                      'assets/password.png',
                      height: 20,
                      width: 20,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Expanded(
                      child: TextFormField(
                    validator: (password) {
                      if (isPasswordValid(password!)) {
                        return null;
                      } else {
                        return 'Enter a valid password';
                      }
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Confirm password',
                      hintStyle: CustomColors.edittext_loginpage_style,
                    ),
                    controller: _cpasswordController,
                    keyboardType: TextInputType.visiblePassword,
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
                      padding: const EdgeInsets.all(5.0),
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
                            'Select Item',
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
                      )),
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
                  dob.text = choice != null ? formattedDate! : '';
                },
                child: TextField(
                    enabled: false,
                    controller: dob,
                    style: const TextStyle(
                      color: Colors.black,
                      height: 1,
                    ),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.watch_later_outlined,
                            color: Colors.black, size: 25),
                        hintStyle: TextStyle(fontSize: 15),
                        filled: true,
                        hintText: 'YYYY-MM-DD')),
              ),
              CustomColors.login_page_divider_line,
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  padding: EdgeInsets.only(top: 3, left: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: MaterialButton(
                    minWidth: 180,
                    height: 50,
                    onPressed: () async {
    if ((await AppURLs.checkconnectivity()) == true) {
                      if(_passwordController.text == _cpasswordController){
                      indicator = !indicator;
                      if (_key.currentState!.validate()) {
                        if (_usernameController.text.isNotEmpty &&
                            _emailController.text.isNotEmpty &&
                            _mobile.text.isNotEmpty &&
                            _passwordController.text.isNotEmpty &&
                            _cpasswordController.text.isNotEmpty &&
                            dropdownvalue.isNotEmpty &&
                            dob.text.isNotEmpty != null) {
                          setState(() {
                            var data = {
                              "full_name": _usernameController.text,
                              "email": _emailController.text,
                              "mobile_no": _mobile.text,
                              "password": _passwordController.text,
                              "c_password": _cpasswordController.text,
                              "gender": dropdownvalue,
                              "dob": dob.text,
                            };
                            getData(data, context).then((value) {
                              var docid = _emailController.text;
                              setState(() {
                                docid;
                              });
                              FirebaseFirestore.instance
                                  .collection("user")
                                  .doc(docid)
                                  .set({
                                "full_name": _usernameController.text,
                                "email": _emailController.text,
                                "mobileNo": _mobile.text,
                                "dob": dob.text,
                                "password": _passwordController.text,
                                "docid": docid,
                              });
                            });
                          });
                        }
                      }
                    }}else{AppURLs.showSnackBar(
                      "No Internet connection found, Please try again!", context, Colors.red);}},
                    color: CustomColors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: indicator == true
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text("SIGN UP",
                            style: CustomColors.sliderscreen_button_style),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0, right: 0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text("Already have an account ?",
                          style: CustomColors.already_account_text),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getData(data, context) async {
    var response =
        await APIClient().RegisterApiService('register', data, context);
    if (response != null && response.success == true) {
      if (mounted) {
        setState(() {
          var data = response.data;
        });
        AppURLs.showSnackBar("Registration successfull", context, Colors.red);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
      }
    } else {
      setState(() {
        indicator = false;
      });
    }
  }

  String? validateEmail(String? formEmail) {
    if (formEmail == null || formEmail.isEmpty) {
      return "E-mail address is required.";
    }

    String pattern = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formEmail)) {
      return 'Invalid email address format';
    }

    return null;
  }

  String? validateNumber(String? formNumber) {
    if (formNumber == null || formNumber.isEmpty) {
      return "Phone number is required.";
    }

    String pattern = r'^(?:[+0]9)?[0-9]{10}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formNumber)) {
      return 'Invalid Phone number';
    }

    return null;
  }

  String? validatePassword(String? formPassword) {
    if (formPassword == null || formPassword.isEmpty) {
      return "Password is required.";
    }

    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formPassword)) {
      return ''' 
          password must be at least 8 characters,
          include an uppercase  letter , number and symbol. ''';
    }

    return null;
  }

  simpleDialog() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
          child: CircularProgressIndicator(
        color: Colors.orange,
      )),
    );
  }
}

mixin RegisterInputValidationMixin {
  bool isPasswordValid(String password) => password.length >= 6;
  bool phoneValid(String phone) => phone.length == 10;
  bool isEmailValid(String email) {
    Pattern pattern = r'\w+@\w+\.\w+';
    RegExp regex = new RegExp(pattern.toString());
    return regex.hasMatch(email);
  }
}
