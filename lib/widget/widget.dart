import 'package:chat/helper/theme.dart';
import 'package:flutter/material.dart';
import 'package:chat/amigos/model/coustomcolor.dart';
Widget appBarMain(BuildContext context) {
  return AppBar(
  title: Text('chat '),
    elevation: 0.0,
    centerTitle: false,
    backgroundColor: MyColor.Mianyallow,
  );
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.white54),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)));
}

TextStyle simpleTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 16);
}

TextStyle biggerTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 17);
}
