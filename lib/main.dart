import 'package:chat/amigos/myhomepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:chat/amigos/Search/jobSearch.dart';
import 'package:chat/amigos/controller/appcontroller.dart';
import 'package:chat/amigos/view/login.dart';
import 'package:chat/amigos/view/HmoeSignLogin.dart';
import 'package:chat/amigos/model/coustomcolor.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppController authenticationAPI = Get.put(AppController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter GetX api call',
      theme: ThemeData(
       
        primarySwatch: Colors.yellow ,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    //  home: signLogin(),
      home: authenticationAPI.login == null ?  signLogin() : MyHomePage()

      //  home: userIsLoggedIn != null ?  userIsLoggedIn ? ChatRoom() : Authenticate()

    );
  }
}
