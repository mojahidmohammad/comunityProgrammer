import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:chat/amigos/model/CommentModel.dart';
import 'package:chat/amigos/model/CompaniesModel.dart';
import 'package:chat/amigos/model/JobsModel.dart';
import 'package:chat/amigos/model/corses.dart';
import 'package:chat/amigos/model/skillsModel.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:chat/amigos/model/postmodel.dart';
import 'package:chat/amigos/services/services.dart';
import 'package:flutter/material.dart';
class AppController extends GetxController {
  var getposts = List<Postmodel>().obs;
  var getSkill = List<Skilsmodel>().obs;
  var getcomment= List<Commentmodel>().obs;
  var getcompanies = List<Companiesmodel>().obs;
  var getJobs = List<Jobssmodel>().obs;
  var idPostcommrnt= "3".obs;
  var user_name;
  var emailget;
  var count;
  var Erorr;
  var ispostforcomment;
  var token;
  var login ;
  Services services = Services();
  var postloading = true.obs;
  var companyLoding = true.obs;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {

    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onInit() {
    callpostmethod();
    callcompanymethod();
    calljobmethod();
    callskilltmethod();
    callcommentmethod();
    Corses();
    super.onInit();
  }

  callpostmethod() async {
    try {
      postloading.value = true;
      var result = await services.getallposts();
      print("reeeeeeeesuuuuult");
      print(result);

      if (result != null) {
        getposts.assignAll(result);
      } else {
        print("nullfgvhj");
      }
    } finally {
      postloading.value = false;
    }
    update();
  }


  callcommentmethod() async {
    try {
      postloading.value = true;
      var result = await services.getallComments(idPostcommrnt.value);
      print("CCCCCMMMMEEEENNNTTXX");
      print(result);

      if (result != null) {
        getcomment.assignAll(result);
      } else {
        print("nullfgvhj");
      }
    } finally {
      postloading.value = false;
    }
    update();
  }



  calljobmethod() async {
    try {
      postloading.value = true;
      var result = await services.getallJobs();
      print("reeeeeeeesuuuuult");
      print(result);

      if (result != null) {
        getJobs.assignAll(result);
      } else {
        print("nullfgvhj");
      }
    } finally {
      postloading.value = false;
    }
    update();
  }



  callcompanymethod() async {
    try {
      companyLoding.value = true;
      var result = await services.getallCompanies();
      print("reeeeeeeesuuuuult");
      print(result);

      if (result != null) {
        getcompanies.assignAll(result);
      } else {
        print("nullfgvhj");
      }
    } finally {
      companyLoding.value = false;
    }
    update();
  }

  callskilltmethod() async {
    try {
      postloading.value = true;
      var result = await services.getallShills();
      print("Skilllllllllllllllsssssssss");
      print(result);

      if (result != null) {
        getSkill.assignAll(result);
      } else {
        print("nullfgvhj");
      }
    } finally {
      postloading.value = false;
    }
    update();
  }

  Future<bool> logins(String email, String Password) async {
    String URL = "http://amigos.abdallahsasa.com/api/auth/user/login";
    Map<String, String> hreder = {
      "Accept": "*/*",
    };
    Map<String, String> body = {"email": email, "password": Password};
    print(body);

    var res = await http.post(URL, headers: hreder, body: body);
    if (res.statusCode == 200) {
      print("statusCode    :   ${res.statusCode}");
      try {
        print(res.body);
        var jsonData = jsonDecode(res.body);
        var data = jsonData['user_id'];
        print(data);
        emailget = email;
        user_name = jsonData['user_name'];
        token = jsonData['access_token'];
        print("ONLE TOKEN USEER");
        print(token);
        update();
        return true;
      } catch (Exception) {
        return false;
      }
    }
    var jsonData = jsonDecode(res.body);
    var errors = jsonData['errors'];
 Erorr=errors;
    return false;
  }

  Future<bool> register(
      String username,
      String fname,
      String Password,
      String minhourrate,
      String email,
      String address,
      String cvURL,
      String lname,
      String maxhourRate,
      String phone,
      String specialize) async {
    String URL = "http://amigos.abdallahsasa.com/api/auth/user/register";
    Map<String, String> hreder = {
      "Accept": "*/*",
    };
    Map<String, String> body = {
      "email": email,
      "password": Password,
      "user name": username,
      "fname": fname,
      "phone": phone,
      "address": address,
      "cv url": cvURL,
      "max hour rate": maxhourRate,
      "min hour rate": minhourrate,
      "lname": lname,
      "specialize": specialize
    };
    print(body);

    var res = await http.post(URL, headers: hreder, body: body);
    print(res.statusCode);
    var jsonData = jsonDecode(res.body);

    if (res.statusCode == 200) {
      print("statusCode    :   ${res.statusCode}");
      try {
        user_name = jsonData['user_name'];
        emailget = email;
        user_name = jsonData['user_name'];
        token = jsonData['access_token'];

        update();
        return true;
      } catch (Exception) {
        return false;
      }
    } else {
      var jsonData = jsonDecode(res.body);
      var errors = jsonData['errors'];
      Erorr=errors;
print(errors);
      return false;
    }
  }

  Future<bool> Skills(

      int skill_id, String start_date, String end_date, String job_type) async {
    String URL = "http://amigos.abdallahsasa.com/api/user/career";
    Map<String, String> hreder = {
      "Accept": "*/*",
      "Authorization": "Bearer ${token}"
    };
    Map<String, String> body = {
      "skill id": skill_id.toString(),
      "start date": start_date,
      "end date": end_date,
      "job type": job_type
    };
    print(body);
    var res = await http.post(URL, headers: hreder, body: body);
    if (res.statusCode == 200) {
      print("statusCode    :   ${res.statusCode}");
      try {
        print(res.body);
        var jsonData = jsonDecode(res.body);
        var data = jsonData['user_id'];
        update();
        return true;
      } catch (Exception) {
        return false;
      }
    }
    return false;
  }
  Future<bool> inersted(

      int skill_id) async {
    String URL = "http://amigos.abdallahsasa.com/api/user/interested";
    Map<String, String> hreder = {
      "Accept": "*/*",
      "Authorization": "Bearer ${token}"
    };
    Map<String, String> body = {
      "skill id": skill_id.toString(),

    };
    print(body);
    var res = await http.post(URL, headers: hreder, body: body);
    if (res.statusCode == 200) {
      print("statusCode    :   ${res.statusCode}");
      try {
        print(res.body);
        var jsonData = jsonDecode(res.body);

        update();
        return true;
      } catch (Exception) {
        return false;
      }
    }
    return false;
  }

  Future<bool> PComment(String comment, String post_id) async {

    String URL = "http://amigos.abdallahsasa.com/api/comment";
    Map<String, String> hreder = {
      "Authorization": "Bearer ${token}",
      "Accept": "*/*",



    };
    Map<String, String> body = {"comment": comment, "post id": post_id};
    print(body);

    var res = await http.post(URL, headers: hreder, body: body);
    if (res.statusCode == 200) {
      print("statusCode    :   ${res.statusCode}");
      try {
        print(res.body);




        print(token);
        update();
        return true;
      } catch (Exception) {
        return false;
      }
    }
    var jsonData = jsonDecode(res.body);
    var errors = jsonData['errors'];
    Erorr=errors;
    return false;
  }




  Future<List<Corsesmodel>> Corses() async {
     try {
      List<Corsesmodel> Corss = List<Corsesmodel>();

      Map<String, String> headers = {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      };
      var response = await http
          .get("http://amigos.abdallahsasa.com/api/courses", headers: headers)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("connection time out try agian");
      });

      if (response.statusCode == 200) {
        var jsonresponse = jsonDecode(response.body);
        var data = jsonresponse["data"];
        print("Corses كورسس ");
        print(data);
        for (var item in data) {
          Corsesmodel cors = Corsesmodel(
            dec_link: item["dec_link"].toString(),
            title: item["title"].toString(),

            id: item["id"],
          );
          Corss.add(cors);
        }

        return Corss;
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      print("response time out");
    }
  }
}
