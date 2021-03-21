
import 'dart:convert';

import 'package:chat/amigos/model/CommentModel.dart';
import 'package:chat/amigos/widgetdrawer/stack_container.dart';



class Postmodel {
  String category;
  int id,user_id;
  String title;
  String desc;
  String created_at;
  String Useruser_name;
  String comments;

  Postmodel({
    this.category,
    this.id,
    this.title,
    this.desc,
    this.created_at,
    this.Useruser_name,
    this.comments,
  }

  );

  Postmodel.fromJson(Map<String, dynamic> json) {
    this.created_at = json["created_at"];
    this.desc = json["desc"];
    this.title = json["title"];
    this.category = json["category"];
    this.id = json["id"];
    this.Useruser_name = json ["user_name"];
    this.comments= json ["comments"];
  }
}
