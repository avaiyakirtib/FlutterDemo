import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practicaltest/view/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/service_url.dart';
import '../viewmodel/rest_service.dart';
import 'Contactlist.dart';
import '../CustomColors.dart';
import '../model/loginmodel.dart';

class Login extends StatefulWidget {
  @override
  ChildLogin createState() => ChildLogin();
}

class ChildLogin extends State<Login> with InputValidationMixin {
  Data? datas;
  var mtoken;
  bool indicator = false;
  final Email = TextEditingController();
  final pass = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    bool H = h < 700;
    // GoogleSignInAccount? user = _googleSignIn.currentUser;
    return Form(
      key: _key,
      child: Scaffold(
        body: Stack(
          children: [
            indicator
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const SizedBox.shrink(),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: h / 3.5),
                  const Center(
                      child: Text("Practicaltest",
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold))),
                  const Center(
                    child: Text("SIGN IN",
                        style: CustomColors.sliderscreen_title_style),
                  ),
                  SizedBox(height: H ? h * 0.02 : h * 0.030),
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.only(left: w * 0.05),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                            hintStyle: CustomColors.edittext_loginpage_style,
                          ),
                          controller: Email,
                          validator: (Email) {
                            if (isEmailValid(Email!))
                              return null;
                            else {
                              return 'Enter a valid email address';
                            }
                          },
                        ),
                      ))
                    ],
                  ),
                  CustomColors.login_page_divider_line,
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.only(left: w * 0.05),
                        child: TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            hintStyle: CustomColors.edittext_loginpage_style,
                          ),
                          controller: pass,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (password) {
                            if (isPasswordValid(password!)) {
                              return null;
                            } else {
                              return 'Enter a valid password';
                            }
                          },
                        ),
                      ))
                    ],
                  ),
                  CustomColors.login_page_divider_line,
                  SizedBox(height: H ? h * 0.003 : h * 0.010),
                  Container(
                    padding: EdgeInsets.only(top: 0, left: w * 0.006),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(h * 0.015),
                    ),
                    child: MaterialButton(
                      minWidth: w * 0.50,
                      height: h * 0.060,
                      onPressed: () async {
                        if ((await AppURLs.checkconnectivity()) == true) {
                          if (_key.currentState!.validate()) {
                            setState(() {
                              indicator = !indicator;
                            });
                            if (Email.text.isNotEmpty &&
                                pass.text.isNotEmpty != null) {
                              var data = {
                                "email": Email.text,
                                "password": pass.text,
                              };
                              getData(data, context);
                            } else {
                              AppURLs.showSnackBar(
                                  "Error please Add all Fields",
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
                          borderRadius: BorderRadius.circular(h * 0.0150)),
                      child: indicator == true
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text("SIGN IN",
                              style: CustomColors.sliderscreen_button_style),
                    ),
                  ),
                  SizedBox(height: H ? h * 0.02 : h * 0.050),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0, right: 0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Signup()),
                            );
                          },
                          child: const Text("Create new account?",
                              style: CustomColors.already_account_text),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// Storing local data into SharedPreferences
  shareddata() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('isLogin', 'true');
    prefs.setString('email', datas!.userDetails!.email.toString());
    prefs.setString('mobileNumber', datas!.userDetails!.mobileNo.toString());
    prefs.setString('userName', datas!.userDetails!.fullName.toString());
    prefs.setString('gender', datas!.userDetails!.gender.toString());
    prefs.setString('dob', datas!.userDetails!.dob.toString());
    prefs.setString('token', datas!.token.toString());
  }

  //Login API call, Model binding
  Future<void> getData(data, context) async {
    var response = await APIClient().postApiService('login', data, context);
    if (response?.success == true) {
      if (mounted) {
        setState(() {
          data = response?.data;
          datas = response?.data;
          AppURLs.data = response?.data;
          shareddata();
        });
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) =>  Contactlist()));
      }
    } else {
      setState(() {
        indicator = !indicator;
      });
    }
  }
}

// Screen Validation
mixin InputValidationMixin {
  bool isPasswordValid(String password) => password.length >= 6;

  bool isEmailValid(String email) {
    Pattern pattern = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(email);
  }
}
