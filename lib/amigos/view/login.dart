import 'package:flutter_icons/flutter_icons.dart';
import 'package:chat/amigos/controller/appcontroller.dart';
import 'package:chat/amigos/view/tokenPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chat/amigos/model/coustomcolor.dart';
import 'package:chat/amigos/myhomepage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  //FetchApi authenticationAPI = FetchApi();
  AppController authenticationAPI = Get.put(AppController());
  bool isLoading = false;

  bool loginError = false;

  TextEditingController _usernameController;
  TextEditingController _passwordController;

  String username;
  String password;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 20.0,
        ),
        Text(
          "Welcome to",
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF1C1C1C),
            height: 2,
          ),
        ),
        Text(
          "Amigos",
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1C1C1C),
            letterSpacing: 2,
            height: 1,
          ),
        ),
        Text(
          "Please login to continue",
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF1C1C1C),
            height: 1,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: EdgeInsets.all(19),
          child: (isLoading) ? _drawLoading() : _drawLoginForm(),
        ),
      ],
    );
  }

  Widget _drawLoginForm() {
    if (loginError) {
      return Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ///////////////////////////////////////////////////////////////////////
              Text(
                'Sign In Error',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
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
              )
            ],
          ),
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
              style: TextStyle(
                color: Colors.black,
              ),
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: 'Email / Username',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFD9BC43),
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
                fillColor: Colors.white,
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
                color: Colors.black,
              ),
              controller: _passwordController,
              decoration: InputDecoration(

                hintText: 'Password',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFD9BC43),
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
                fillColor: Colors.white,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your password';
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

                      username = _usernameController.text;
                      password = _passwordController.text;

                      print(username);

                      var response =
                          await authenticationAPI.logins(username, password);

                      if (response) {
                        authenticationAPI.login="true";
                        authenticationAPI.update();
                        Get.off(MyHomePage());

                      } else {      AlertDialog alert1 = AlertDialog(
                        title: Row(
                          children: [
                            Icon(FontAwesome.remove,color: Colors.red,),
                            Text( authenticationAPI.Erorr),
                          ],
                        ),

                        actions: [
                          FlatButton(
                            child: Text("OK",style: TextStyle(color: Colors.black),),
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                          ),
                        ],
                      );
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alert1;
                          });
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
                  ///////////////////////////
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF1C1C1C),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF1C1C1C).withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Center(
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: MyColor.Mianyallow,
                          ),
                        ),
                      ),
                    ),
                  ),
                ))
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
}
