import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chat/amigos/controller/appcontroller.dart';
import 'package:chat/amigos/model/coustomcolor.dart';

class CardItem extends StatelessWidget {
  final Widget iconq;
  final  String title;
  final String  desc ;
  const CardItem({

    Key key, this.title, this.desc, this.iconq,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppController());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        shadowColor: MyColor.Mianyallow,
        elevation:6,

        color: MyColor.secondBlack,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 21.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: iconq
              ),
              SizedBox(width: 24.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                   Text(
                      title,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey[200],
                      ),
                    ),

                  SizedBox(height: 4.0),
                  Text(
                   desc,
                    style: TextStyle(
                      color: MyColor.Mianyallow,
                      fontSize: 12.0,
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}