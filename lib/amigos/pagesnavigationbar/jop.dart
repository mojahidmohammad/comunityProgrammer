import 'package:chat/amigos/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:chat/amigos/model/coustomcolor.dart';
class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.bgBlack,
      body: ListView(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
               color:  MyColor.Mianyallow
              ),
              child: Container(
                width: double.infinity,
                height: 250.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(

                        backgroundImage: AssetImage(Assets.assetsOnlyLogo),
                        radius: 50.0,

                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Amigos",
                        style: TextStyle(
                          fontSize: 26.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),

                    ],
                  ),
                ),
              )
          ),
          Container(

            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "About Us :",
                    style: TextStyle(
                        color:  MyColor.Mianyallow,
                        fontStyle: FontStyle.normal,
                        fontSize: 21.0
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text('Senior Project\n\n\nStudents:\n\n\nAbdallah AL-Sasa\n\n\nMhd Ghassan Alhabash\n\n\nMohammed Almoujahed\n\n\nSupervised By:\n\n\nDr. Basel Kheshi\n\n\n&\n\n\nEng. Bilal Shammaa',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey[200],
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),

                  SizedBox(
                    height: 10.0,
                  ),


                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}