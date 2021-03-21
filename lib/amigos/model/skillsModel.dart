import 'dart:convert';

class Skilsmodel {
  String title;
  int id;

  Skilsmodel({
    this.title,
    this.id,
  });

  Skilsmodel.fromJson(Map<String, dynamic> json) {
    this.title = json["title"];
    this.id= json["id"];
  }
}
