import 'dart:convert';

class Companiesmodel {
  int id;
  String user_name, fname, lname;
  String email, address, specialize, active, country;
  String created_at;
  String logo_url, description;

  Companiesmodel({
    this.user_name,
    this.created_at,
    this.specialize,
    this.lname,
    this.address,
    this.email,
    this.fname,
    this.active,
    this.country,
    this.description,
    this.logo_url,
    this.id,
  });

  Companiesmodel.fromJson(Map<String, dynamic> json) {
    this.created_at = json["created_at"];
    this.id = json["id"];
    this.user_name = json["user_name"];

    this.fname = json["fname"];
    this.lname = json["lname"];
    this.email = json["email"];
    this.address = json["address"];
    this.specialize = json["specialize"];
    this.active = json["active"];
    this.country = json["country"];
    this.description = json["description"];
    this.logo_url = json["logo_url"];


  }
}
