import 'package:chat/amigos/controller/appcontroller.dart';
import 'package:chat/amigos/model/CardCompanies.dart';
import 'package:chat/amigos/model/CardJob.dart';
import 'package:chat/amigos/model/coustomcolor.dart';
import 'package:chat/amigos/widgetdrawer/card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class Dashpord extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Dashpord> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppController());
    return Scaffold(
      backgroundColor: MyColor.bgBlack,
      appBar: AppBar(
        backgroundColor: MyColor.Mianyallow,
        title: Text('Recomindation'),

      ),
      body:Center(
         child:
           CardItem(
               title: " No Courses Yet  ",
               desc: "  No link Now ",
               iconq: Icon(
                 Ionicons.ios_sad,
                 size: 40.0,
                 color: MyColor.Mianyallow,
               )),

      )
    );
  }
}