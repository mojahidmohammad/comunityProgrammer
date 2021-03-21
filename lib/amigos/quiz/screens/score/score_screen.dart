import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chat/amigos/model/coustomcolor.dart';
import 'package:chat/amigos/myhomepage.dart';
import 'package:chat/amigos/quiz/constants.dart';
import 'package:chat/amigos/quiz/controllers/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      backgroundColor: MyColor.bgBlack,
      body: Stack(

        fit: StackFit.expand,
        children: [
          // WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Row(

                  mainAxisAlignment:MainAxisAlignment.center ,
                  children: [
                    Text(
                      "Score : ",
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          .copyWith(color: kSecondaryColor),
                    ),
                    Text(
                      " ${_qnController.correctAns}/${_qnController.questions.length}",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: kSecondaryColor),
                    ),
                  ],
                ),

SizedBox(height: 10.0),

                RaisedButton(
                  splashColor: Colors.red,
                  color: MyColor.Mianyallow,
                  onPressed: (){
                  Get.off(MyHomePage());
                },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("GO To Home Page ",),
                  ),

                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
