import 'dart:convert';

class Jobssmodel {
  int id, job_salary;
  String user_name, fname, lname;
  String job_type, paid_per, title;
  String email, address, specialize, active, country;
  String created_at, updated_at;
  String logo_url, desc, cv_url,phone;

  Jobssmodel({
    this.user_name,
    this.created_at,
    this.specialize,
    this.lname,
    this.address,
    this.email,
    this.fname,
    this.active,
    this.country,
    this.title,
    this.updated_at,
    this.job_salary,
    this.logo_url,
    this.id,
    this.job_type,
    this.paid_per,
    this.desc,
    this.cv_url,
    this.phone,

  });

  Jobssmodel.fromJson(Map<String, dynamic> json) {
    this.created_at = json["created_at"];
    this.id = json["id"];
    this.user_name = json["user_name"];
    this.paid_per = json["paid_per"];
    this.fname = json["fname"];
    this.lname = json["lname"];
    this.email = json["email"];
    this.address = json["address"];
    this.specialize = json["specialize"];
    this.active = json["active"];
    this.country = json["country"];
    this.desc = json["desc"];
    this.logo_url = json["logo_url"];
    this.title = json["title"];
    this.job_type = json["job_type"];
    this.job_salary = json["job_salary"];
    this.updated_at = json["updated_at"];
    this.cv_url = json["cv_url"];
    this.phone= json["phone"];
  }
}
