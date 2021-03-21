import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chat/amigos/controller/appcontroller.dart';
import 'package:chat/amigos/model/CardCompanies.dart';
import 'package:chat/amigos/model/coustomcolor.dart';
import 'package:chat/amigos/services/services.dart';
import 'package:readmore/readmore.dart';
import 'package:shape_of_view/shape_of_view.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  var controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var Cards = [
      ItemCard(
        Discribyion: "Flutter (software)",
        ImageURL:
            "https://img.favpng.com/7/21/6/black-box-corporation-black-box-network-services-nv-computer-network-company-it-infrastructure-png-favpng-m4Wd8Z999z5EKZxQEPJSqLCGF.jpg",
        NameCompany: "BlackBox",
      ),
      ItemCard(
        Discribyion: "Fluttesdfsfdsf (software)",
        ImageURL: "",
        NameCompany: "Blackdsdsdox",
      ),
      ItemCard(
        Discribyion: "Flutterafed (software)",
        ImageURL: "",
        NameCompany: "BlackBdsfsdfsfox",
      )
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0), // here the desired height
        child: AppBar(
          flexibleSpace:
       Container(
              color: Colors.black,
              child: Stack(children: [
                Container(
                    //  height: height,
                    ),
                ShapeOfView(
                  shape: ArcShape(
                    direction: ArcDirection.Outside,
                    height: 50,
                    position: ArcPosition.Bottom,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.32,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage('assets/1612683047887.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

              ])),
        ),
      ),
      body:

      Container(
        color: Colors.black,
        child: Obx(() {
          return controller.postloading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: controller.getcompanies.length,
                  itemBuilder: (context, index) {
                    var item = controller.getcompanies[index];
                    return ItemCard(
                      Discribyion: item.description,
                      ImageURL: item.logo_url,
                      NameCompany: item.user_name,
                    );
                  });

        }),
      ),
    );
  }
}
