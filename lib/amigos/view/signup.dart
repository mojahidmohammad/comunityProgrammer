import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chat/amigos/controller/appcontroller.dart';
import 'package:chat/amigos/myhomepage.dart';
import 'package:chat/amigos/view/tokenPage.dart';
import 'dart:convert';
import 'package:chat/amigos/model/coustomcolor.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var Error;

  final _formKey = GlobalKey<FormState>();
  // FetchApi authenticationAPI = FetchApi();
  AppController authenticationAPI = Get.put(AppController());
  bool isLoading = false;

  bool loginError = false;

  TextEditingController maxhourRate = TextEditingController();
  TextEditingController minhourrate = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController cvURL = TextEditingController();

  TextEditingController specialize = TextEditingController();

  @override
  void initState() {
    super.initState();
    maxhourRate = TextEditingController();
    minhourrate = TextEditingController();
    phone = TextEditingController();
    username = TextEditingController();
    fname = TextEditingController();
    lname = TextEditingController();
    email = TextEditingController();
    address = TextEditingController();
    cvURL = TextEditingController();
    password = TextEditingController();
    specialize = TextEditingController();
    geterror().then((value) => setState(() {
          Error = value;
        }));
  }

  @override
  void dispose() {
    address.dispose();
    cvURL.dispose();
    username.dispose();
    phone.dispose();
    email.dispose();
    fname.dispose();
    lname.dispose();
    maxhourRate.dispose();
    minhourrate.dispose();
    password.dispose();
    specialize.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Sign up with",
          style: TextStyle(
            fontSize: 16,
            color: MyColor.Mianyallow,
            height: 2,
          ),
        ),
        Text(
          "Amigos",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: MyColor.Mianyallow,
            letterSpacing: 2,
            height: 1,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Container(child: (isLoading) ? _drawLoading() : _drawLoginForm()),
        SizedBox(
          height: 24,
        ),
      ],
    );
  }

  Widget _drawLoginForm() {
    if (loginError) {
      return Center(
        child: Column(
          children: <Widget>[
            ///////////////////////////////////////////////////////////////////////
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    'Error ..!!',
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xfff6b638),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 28.0,
            ),
            Divider(
              height: 30,
              thickness: 6,
              color: Colors.black,
            ),
            SizedBox(
              height: 38.0,
            ),

            FlatButton(
              onPressed: () {
                setState(() {
                  loginError = false;
                });
              },
              child: Container(
                height: 50,
                width: 320,

                // margin: EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xfff6b638)),
                child: GestureDetector(
                  // Navigator.push(context,MaterialPageRoute(builder: (context) => SignIn()),);

                  child: Center(
                    child: Text(
                      "try Again",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: fname,
              style: TextStyle(
                color: Colors.white,
              ),
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: 'Enter First Name ',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.1),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your First Name';
                }
                return null;
              },
            ),
            SizedBox(
              height: 48,
            ),
            TextFormField(
              style: TextStyle(
                color: Colors.white,
              ),
              controller: lname,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: 'Enter LastName ',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.1),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your Last Name';
                }
                return null;
              },
            ),
            SizedBox(
              height: 48,
            ),
            TextFormField(
              style: TextStyle(
                color: Colors.white,
              ),
              controller: username,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: 'Username',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.1),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your User Name';
                }
                return null;
              },
            ),
            SizedBox(
              height: 48,
            ),
            TextFormField(
              style: TextStyle(
                color: Colors.white,
              ),
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Enter Email',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.1),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your Email';
                }
                return null;
              },
            ),
            SizedBox(
              height: 48,
            ),
            TextFormField(
              obscureText: true,
              style: TextStyle(
                color: Colors.white,
              ),
              controller: password,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.1),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your Password';
                }
                return null;
              },
            ),
            SizedBox(
              height: 48,
            ),
            TextFormField(
              style: TextStyle(
                color: Colors.white,
              ),
              controller: phone,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Phone Number',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.1),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your Phone Number';
                }
                return null;
              },
            ),
            SizedBox(
              height: 48,
            ),
            TextFormField(
              style: TextStyle(
                color: Colors.white,
              ),
              controller: address,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Your Address',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.1),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your Address';
                }
                return null;
              },
            ),
            SizedBox(
              height: 48,
            ),
            TextFormField(
              style: TextStyle(
                color: Colors.white,
              ),
              controller: cvURL,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                hintText: 'CV URL',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.1),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your CV URL';
                }
                return null;
              },
            ),
            SizedBox(
              height: 48,
            ),
            TextFormField(
              style: TextStyle(
                color: Colors.white,
              ),
              controller: specialize,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Specialize',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.1),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your Specialize';
                }
                return null;
              },
            ),
            SizedBox(
              height: 48,
            ),
            TextFormField(
              style: TextStyle(
                color: Colors.white,
              ),
              controller: maxhourRate,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Max Hour Rate',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.1),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your Max hour Rate';
                }
                return null;
              },
            ),
            SizedBox(
              height: 48,
            ),
            TextFormField(
              style: TextStyle(
                color: Colors.white,
              ),
              controller: minhourrate,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Min Hour Rate',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.1),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your Min hour Rate';
                }
                return null;
              },
            ),
            SizedBox(
              height: 48,
            ),
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    // TODO : Call Api for login
                    setState(() {
                      isLoading = true;
                    });

                    var response = await authenticationAPI.register(
                      username.text.trim(),
                      fname.text.trim(),
                      password.text.trim(),
                      minhourrate.text.trim(),
                      email.text.trim(),
                      address.text.trim(),
                      cvURL.text.trim(),
                      lname.text.trim(),
                      maxhourRate.text.trim(),
                      phone.text.trim(),
                      specialize.text.trim(),
                    );

                    if (response) {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => MyHomePage()));
                    } else {

                      loginError = true;
                    }
                    setState(() {
                      isLoading = false;
                    });
                  } else {
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: MyColor.Mianyallow,
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: MyColor.Mianyallow.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 4,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1C1C1C),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawLoading() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Future geterror() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String errors = (prefs.getString('errors'));
    return errors;
  }
}
