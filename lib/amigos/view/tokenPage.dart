import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chat/amigos/controller/appcontroller.dart';







class tokenpage extends StatefulWidget {
  @override
  _tokenpageState createState() => _tokenpageState();
}

class _tokenpageState extends State<tokenpage> {
  @override
  Widget build(BuildContext context) {
    AppController controller =Get.put(AppController());

    //print(controller.token);
    return Scaffold(body: Center(
      child: Column(
        children: [
          GetBuilder<AppController>(
            init: AppController(),
            builder: (value) => Text(
              "${value.emailget}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  letterSpacing: 0.01),
            ),
          ),


        ],
      ),
    ),);
  }
}
