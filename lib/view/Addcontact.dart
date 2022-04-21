import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practicaltest/services/service_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../CustomColors.dart';
import '../model/loginmodel.dart';

class Addcontact extends StatefulWidget {
  @override
  ChildAddcontact createState() => ChildAddcontact();
}

class ChildAddcontact extends State<Addcontact> with addconatactMixin {
  bool isload = false,
      indicator = false,
      indicator1 = false;
  var error, mtoken, docs, email;

  Data? data;
  final Email = TextEditingController();
  final phone = TextEditingController();
  final Name = TextEditingController();
  final _key = GlobalKey<FormState>();


  @override
  void initState() {
    // TODO: implement initState
    getInitialData();
    super.initState();
  }

  getInitialData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString("email");
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery
        .of(context)
        .size
        .height;
    double w = MediaQuery
        .of(context)
        .size
        .width;
    bool H = h < 700;
    return Form(
      key: _key,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Add Contact"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: w * 0.05),
                      child: TextFormField(
                          validator: (name) {
                            if (nameValid(name!))
                              return null;
                            else
                              return 'Enter a valid Name';
                          },
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Name',
                              hintStyle: CustomColors.edittext_loginpage_style,
                              counterText: ""),
                          controller: Name,
                          maxLength: 20),
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
                        validator: (Email) {
                          if (isEmailValid(Email!))
                            return null;
                          else
                            return 'Enter a valid email address';
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          hintStyle: CustomColors.edittext_loginpage_style,
                        ),
                        controller: Email,
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
                        validator: (phone) {
                          if (phonedValid(phone!))
                            return null;
                          else
                            return 'Enter a valid Mobile Number';
                        },
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Mobile number',
                            hintStyle: CustomColors.edittext_loginpage_style,
                            counterText: ""),
                        controller: phone,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
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
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    setState(() {
                      isload = !isload;
                    });
                    if (phone.text.isNotEmpty &&
                        Name.text.isNotEmpty &&
                        Email.text.isNotEmpty) {
                      FirebaseFirestore.instance
                          .collection('user')
                          .doc(email)
                          .collection("usercontact")
                          .doc()
                          .set({
                        "mobilenumber": phone.text,
                        "name": Name.text,
                        "emailid": Email.text,
                      });
                      Navigator.pop(
                          context);
                    } else {
                      AppURLs.showSnackBar(
                          "Invalid Input, Please try again", context,
                          Colors.red);
                    }
                  }
                },
                color: CustomColors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(h * 0.0150)),
                child: indicator == true
                    ? const CircularProgressIndicator(
                  color: Colors.white,
                )
                    : const Text("Save",
                    style: CustomColors.sliderscreen_button_style),
              ),
            ),
            SizedBox(height: H ? h * 0.02 : h * 0.050),
          ],
        ),
      ),
    );
  }

}
// Contact screen validation
mixin addconatactMixin {
  bool isPasswordValid(String password) => password.length >= 6;
  bool phonedValid(String phone) => phone.length == 10;
  bool nameValid(String name) => name.length >= 0;
  bool isEmailValid(String email) {
    Pattern pattern = r'\w+@\w+\.\w+';
    RegExp regex = new RegExp(pattern.toString());
    return regex.hasMatch(email);
  }
}
