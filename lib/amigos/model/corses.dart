import 'dart:convert';

class Corsesmodel {
  String title,dec_link;
  int id;

  Corsesmodel({
    this.title,
    this.dec_link,
    this.id,
  });

  Corsesmodel.fromJson(Map<String, dynamic> json) {
    this.title = json["title"];
    this.dec_link= json["dec_link"];
    this.id= json["id"];
  }
}
