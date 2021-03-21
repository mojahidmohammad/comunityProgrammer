import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:chat/amigos/controller/appcontroller.dart';
import 'package:chat/amigos/model/CommentModel.dart';
import 'package:chat/amigos/model/CompaniesModel.dart';
import 'package:chat/amigos/model/JobsModel.dart';
import 'package:chat/amigos/model/postmodel.dart';
import 'package:chat/amigos/model/skillsModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

var controller = Get.put(AppController());

class Services {
  Future<List<Postmodel>> getallposts() async {
    String token =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNGRjZTY3NTY5ODlkYmVhNDBkMTg3Y2QzZWVmNTk3ZjAyNzk1ZmMxZWNmMjEyNDgzMzcwMzMwOGUxNjVjODZkZGQ1NDQ2MjhjOWEwYjYyNjgiLCJpYXQiOiIxNjE0NDI5MzYxLjc4NTYyMiIsIm5iZiI6IjE2MTQ0MjkzNjEuNzg1NjI3IiwiZXhwIjoiMTY0NTk2NTM2MS43NzkzNTEiLCJzdWIiOiIyNSIsInNjb3BlcyI6W119.BLfyvM_9u-SgQDqcDbH9OCBN0ro2pc_XNvfFgMrr1hMo6n7diqBWCEwrTgRzbczn1ykx5i3qTvNOtJmWkELNnKTxG66Htb2oMt8i3nk30Tw79rVdh8bVnEoFTSiZyCk67iqs_l451Y4SD1bZXLBZfRkvr_fv2RaNCjdIyJMiwBi3cS7ygDsypFhA9J-28-hcCsexRiqmg6QpL9prKdoTBhhcuFTSjEKY1dZ0aNeschWbR5rFEM_FJJuhiV2RnqIdIVkU2so9O5TGwXOY_iFnRWieefN8oiavz-ZC33-RZtfSizZjCOTIiq3ujlNII3YTizalgVYBchxNWTuZSl0OeeDS1d2d0yr5EAlDAF0deOInzB2hmuAO_U76WuWRopwx9mZ_rBOxFLWX_rOn4RkaSVSf_BlWD1Hkdzl-mbaWhqk57QU6C3_Zuixz6yQcEDfwR_lI-61He6hwew5QXjb38flvptGlXuXwxa-pQcGUbT-di2-Hpjpa9CtgZpNlMIBcXqdwC0FQeuWizpTDQ3scVcmCmveRsucdzHKS47v6clLlWQ8IFuOsabXRxpPq34And1VojGQFeCEdjW-jSkZvYzdzBVvRuSHHgy5vwuZ8NvDDPNHoz1dJABj326q_fWEozwtDeN1fYQePqcma7My92TcCesp_1KezBiqJLs083To";
    try {
      List<Postmodel> posts = List<Postmodel>();

      Map<String, String> headers = {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      };
      var response = await http
          .get("http://amigos.abdallahsasa.com/api/posts", headers: headers)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("connection time out try agian");
      });

      if (response.statusCode == 200) {
        var jsonresponse = jsonDecode(response.body);
        var data = jsonresponse["data"];
        print("POSSST COMMENT //////////////////////////////");
        print(data[2]["comments"]);
        int count = 0;

        print("POSSST COMMENT //////////////////////////////");

print("POSSST COMMENT ");
print(data);
        for (var item in data) {
          Postmodel post = Postmodel(
            id: item["id"],
            title: item["title"].toString(),
            category: item["category"].toString(),
            desc: item["desc"].toString(),
            created_at: item["created_at"].toString(),
            Useruser_name: item["user"]["user_name"].toString(),


          );
          posts.add(post);


        }

        return posts;
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      print("response time out");
    }
  }

  Future<List<Companiesmodel>> getallCompanies() async {
    String token =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNGRjZTY3NTY5ODlkYmVhNDBkMTg3Y2QzZWVmNTk3ZjAyNzk1ZmMxZWNmMjEyNDgzMzcwMzMwOGUxNjVjODZkZGQ1NDQ2MjhjOWEwYjYyNjgiLCJpYXQiOiIxNjE0NDI5MzYxLjc4NTYyMiIsIm5iZiI6IjE2MTQ0MjkzNjEuNzg1NjI3IiwiZXhwIjoiMTY0NTk2NTM2MS43NzkzNTEiLCJzdWIiOiIyNSIsInNjb3BlcyI6W119.BLfyvM_9u-SgQDqcDbH9OCBN0ro2pc_XNvfFgMrr1hMo6n7diqBWCEwrTgRzbczn1ykx5i3qTvNOtJmWkELNnKTxG66Htb2oMt8i3nk30Tw79rVdh8bVnEoFTSiZyCk67iqs_l451Y4SD1bZXLBZfRkvr_fv2RaNCjdIyJMiwBi3cS7ygDsypFhA9J-28-hcCsexRiqmg6QpL9prKdoTBhhcuFTSjEKY1dZ0aNeschWbR5rFEM_FJJuhiV2RnqIdIVkU2so9O5TGwXOY_iFnRWieefN8oiavz-ZC33-RZtfSizZjCOTIiq3ujlNII3YTizalgVYBchxNWTuZSl0OeeDS1d2d0yr5EAlDAF0deOInzB2hmuAO_U76WuWRopwx9mZ_rBOxFLWX_rOn4RkaSVSf_BlWD1Hkdzl-mbaWhqk57QU6C3_Zuixz6yQcEDfwR_lI-61He6hwew5QXjb38flvptGlXuXwxa-pQcGUbT-di2-Hpjpa9CtgZpNlMIBcXqdwC0FQeuWizpTDQ3scVcmCmveRsucdzHKS47v6clLlWQ8IFuOsabXRxpPq34And1VojGQFeCEdjW-jSkZvYzdzBVvRuSHHgy5vwuZ8NvDDPNHoz1dJABj326q_fWEozwtDeN1fYQePqcma7My92TcCesp_1KezBiqJLs083To";
    try {
      List<Companiesmodel> Companies = List<Companiesmodel>();

      Map<String, String> headers = {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      };
      var response = await http
          .get("http://amigos.abdallahsasa.com/api/companies", headers: headers)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("connection time out try agian");
      });

      if (response.statusCode == 200) {
        var jsonresponse = jsonDecode(response.body);
        var data = jsonresponse["data"];
        print("COONNPPAANNYY");
        print(data);
        for (var item in data) {
          Companiesmodel company = Companiesmodel(
            id: item["id"],
            user_name: item["user_name"].toString(),
            fname: item["fname"].toString(),
            lname: item["lname"].toString(),
            email: item["email"].toString(),
            address: item["address"],
            specialize: item["specialize"].toString(),
            active: item["active"].toString(),
            country: item["country"].toString(),
            description: item["description"].toString(),
            logo_url: item["logo_url"].toString(),
            created_at: item["created_at"].toString(),
          );
          Companies.add(company);
        }

        return Companies;
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      print("response time out");
    }
  }

  Future<List<Jobssmodel>> getallJobs() async {
    String token =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNGRjZTY3NTY5ODlkYmVhNDBkMTg3Y2QzZWVmNTk3ZjAyNzk1ZmMxZWNmMjEyNDgzMzcwMzMwOGUxNjVjODZkZGQ1NDQ2MjhjOWEwYjYyNjgiLCJpYXQiOiIxNjE0NDI5MzYxLjc4NTYyMiIsIm5iZiI6IjE2MTQ0MjkzNjEuNzg1NjI3IiwiZXhwIjoiMTY0NTk2NTM2MS43NzkzNTEiLCJzdWIiOiIyNSIsInNjb3BlcyI6W119.BLfyvM_9u-SgQDqcDbH9OCBN0ro2pc_XNvfFgMrr1hMo6n7diqBWCEwrTgRzbczn1ykx5i3qTvNOtJmWkELNnKTxG66Htb2oMt8i3nk30Tw79rVdh8bVnEoFTSiZyCk67iqs_l451Y4SD1bZXLBZfRkvr_fv2RaNCjdIyJMiwBi3cS7ygDsypFhA9J-28-hcCsexRiqmg6QpL9prKdoTBhhcuFTSjEKY1dZ0aNeschWbR5rFEM_FJJuhiV2RnqIdIVkU2so9O5TGwXOY_iFnRWieefN8oiavz-ZC33-RZtfSizZjCOTIiq3ujlNII3YTizalgVYBchxNWTuZSl0OeeDS1d2d0yr5EAlDAF0deOInzB2hmuAO_U76WuWRopwx9mZ_rBOxFLWX_rOn4RkaSVSf_BlWD1Hkdzl-mbaWhqk57QU6C3_Zuixz6yQcEDfwR_lI-61He6hwew5QXjb38flvptGlXuXwxa-pQcGUbT-di2-Hpjpa9CtgZpNlMIBcXqdwC0FQeuWizpTDQ3scVcmCmveRsucdzHKS47v6clLlWQ8IFuOsabXRxpPq34And1VojGQFeCEdjW-jSkZvYzdzBVvRuSHHgy5vwuZ8NvDDPNHoz1dJABj326q_fWEozwtDeN1fYQePqcma7My92TcCesp_1KezBiqJLs083To";
    try {
      List<Jobssmodel> Jobs = List<Jobssmodel>();

      Map<String, String> headers = {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      };
      var response = await http
          .get("http://amigos.abdallahsasa.com/api/jobs", headers: headers)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("connection time out try agian");
      });

      if (response.statusCode == 200) {
        var jsonresponse = jsonDecode(response.body);
        var data = jsonresponse["data"];
        print("JOOOOBBBB");

        for (var item in data) {
          Jobssmodel job = Jobssmodel(
            id: item["id"],
            phone: item["user"]["phone"].toString(),
            user_name: item["user"]["user_name"].toString(),
            fname: item["user"]["fname"].toString(),
            lname: item["user"]["lname"].toString(),
            email: item["user"]["email"].toString(),
            address: item["user"]["address"].toString(),
            specialize: item["user"]["specialize"].toString(),
            active: item["user"]["active"].toString(),
            country: item["user"]["country"].toString(),
            desc: item["desc"].toString(),
            logo_url: item["user"]["logo_url"].toString(),
            created_at: item["created_at"].toString(),
            updated_at: item["updated_at"].toString(),
            title: item["title"].toString(),
            cv_url: item["user"]["cv_url"].toString(),
            job_salary: item["job_salary"],
            job_type: item["job_type"].toString(),
            paid_per: item["paid_per"].toString(),
          );
          Jobs.add(job);
          print("JOOOOOOPPPPPPPP");
          print(Jobs);
        }

        return Jobs;
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      print("response time out");
    }
  }

  Future<List<Commentmodel>> getallComments(String id) async {

    String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNGRjZTY3NTY5ODlkYmVhNDBkMTg3Y2QzZWVmNTk3ZjAyNzk1ZmMxZWNmMjEyNDgzMzcwMzMwOGUxNjVjODZkZGQ1NDQ2MjhjOWEwYjYyNjgiLCJpYXQiOiIxNjE0NDI5MzYxLjc4NTYyMiIsIm5iZiI6IjE2MTQ0MjkzNjEuNzg1NjI3IiwiZXhwIjoiMTY0NTk2NTM2MS43NzkzNTEiLCJzdWIiOiIyNSIsInNjb3BlcyI6W119.BLfyvM_9u-SgQDqcDbH9OCBN0ro2pc_XNvfFgMrr1hMo6n7diqBWCEwrTgRzbczn1ykx5i3qTvNOtJmWkELNnKTxG66Htb2oMt8i3nk30Tw79rVdh8bVnEoFTSiZyCk67iqs_l451Y4SD1bZXLBZfRkvr_fv2RaNCjdIyJMiwBi3cS7ygDsypFhA9J-28-hcCsexRiqmg6QpL9prKdoTBhhcuFTSjEKY1dZ0aNeschWbR5rFEM_FJJuhiV2RnqIdIVkU2so9O5TGwXOY_iFnRWieefN8oiavz-ZC33-RZtfSizZjCOTIiq3ujlNII3YTizalgVYBchxNWTuZSl0OeeDS1d2d0yr5EAlDAF0deOInzB2hmuAO_U76WuWRopwx9mZ_rBOxFLWX_rOn4RkaSVSf_BlWD1Hkdzl-mbaWhqk57QU6C3_Zuixz6yQcEDfwR_lI-61He6hwew5QXjb38flvptGlXuXwxa-pQcGUbT-di2-Hpjpa9CtgZpNlMIBcXqdwC0FQeuWizpTDQ3scVcmCmveRsucdzHKS47v6clLlWQ8IFuOsabXRxpPq34And1VojGQFeCEdjW-jSkZvYzdzBVvRuSHHgy5vwuZ8NvDDPNHoz1dJABj326q_fWEozwtDeN1fYQePqcma7My92TcCesp_1KezBiqJLs083To";
    try {
      List<Commentmodel> Comments = List<Commentmodel>();

      Map<String, String> headers = {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      };
      var response = await http
          .get("http://amigos.abdallahsasa.com/api/post/${id}/comments", headers: headers)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("connection time out try agian");
      });
      print("غيث");
      print("http://amigos.abdallahsasa.com/api/post/${controller.idPostcommrnt.value}/comments");
      if (response.statusCode == 200) {
        var jsonresponse = jsonDecode(response.body);
        var data = jsonresponse["data"];
        print("غيث");
        print("http://amigos.abdallahsasa.com/api/post/${id}/comments");
        print(data);

        for (var item in data) {
          Commentmodel comment = Commentmodel(
              id: item["id"],
              updated_at: item["updated_at"],
              comment: item["comment"],
              user_id: item["user_id"],
              post_id: item["post_id"],
              created_at: item["created_at"]
          );
          print ("List Comment ");
          print(comment);
          Comments.add(comment);
        }

        return Comments;
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      print("response time out");
    }
  }

  Future<List<Skilsmodel>> getallShills() async {
    String token =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNGRjZTY3NTY5ODlkYmVhNDBkMTg3Y2QzZWVmNTk3ZjAyNzk1ZmMxZWNmMjEyNDgzMzcwMzMwOGUxNjVjODZkZGQ1NDQ2MjhjOWEwYjYyNjgiLCJpYXQiOiIxNjE0NDI5MzYxLjc4NTYyMiIsIm5iZiI6IjE2MTQ0MjkzNjEuNzg1NjI3IiwiZXhwIjoiMTY0NTk2NTM2MS43NzkzNTEiLCJzdWIiOiIyNSIsInNjb3BlcyI6W119.BLfyvM_9u-SgQDqcDbH9OCBN0ro2pc_XNvfFgMrr1hMo6n7diqBWCEwrTgRzbczn1ykx5i3qTvNOtJmWkELNnKTxG66Htb2oMt8i3nk30Tw79rVdh8bVnEoFTSiZyCk67iqs_l451Y4SD1bZXLBZfRkvr_fv2RaNCjdIyJMiwBi3cS7ygDsypFhA9J-28-hcCsexRiqmg6QpL9prKdoTBhhcuFTSjEKY1dZ0aNeschWbR5rFEM_FJJuhiV2RnqIdIVkU2so9O5TGwXOY_iFnRWieefN8oiavz-ZC33-RZtfSizZjCOTIiq3ujlNII3YTizalgVYBchxNWTuZSl0OeeDS1d2d0yr5EAlDAF0deOInzB2hmuAO_U76WuWRopwx9mZ_rBOxFLWX_rOn4RkaSVSf_BlWD1Hkdzl-mbaWhqk57QU6C3_Zuixz6yQcEDfwR_lI-61He6hwew5QXjb38flvptGlXuXwxa-pQcGUbT-di2-Hpjpa9CtgZpNlMIBcXqdwC0FQeuWizpTDQ3scVcmCmveRsucdzHKS47v6clLlWQ8IFuOsabXRxpPq34And1VojGQFeCEdjW-jSkZvYzdzBVvRuSHHgy5vwuZ8NvDDPNHoz1dJABj326q_fWEozwtDeN1fYQePqcma7My92TcCesp_1KezBiqJLs083To";
    try {
      List<Skilsmodel> Skils = List<Skilsmodel>();

      Map<String, String> headers = {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      };
      var response = await http
          .get("http://amigos.abdallahsasa.com/api/skills", headers: headers)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("connection time out try agian");
      });

      if (response.statusCode == 200) {
        var jsonresponse = jsonDecode(response.body);
        var data = jsonresponse["data"];
        print("Skkkkkk");
        print(data);
        for (var item in data) {
          Skilsmodel skill = Skilsmodel(
            title: item["title"].toString(),
            id: item["id"],
          );
          Skils.add(skill);
        }

        return Skils;
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      print("response time out");
    }
  }
}
