import 'dart:convert';

class Commentmodel {
  int id,post_id;
  String  user_id, comment;
  String created_at,updated_at;

  Commentmodel({
    this.id,
    this.created_at,
    this.comment,this.post_id,this.user_id,this.updated_at

  });

  Commentmodel.fromJson(Map<String, dynamic> json) {
    this.created_at = json["created_at"];
    this.id = json["id"];
    this.post_id = json["post_id"];
    this.user_id = json["user_id"];
    this.comment = json["comment"];
    this.updated_at = json["updated_at"];

  }
}
