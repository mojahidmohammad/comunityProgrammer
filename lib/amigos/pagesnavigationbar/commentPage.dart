import 'package:chat/amigos/controller/appcontroller.dart';
import 'package:chat/amigos/model/coustomcolor.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class commentPage extends StatefulWidget {

  @override
  _commentPageState createState() => _commentPageState();
}

AppController authenticationAPI = Get.put(AppController());

class _commentPageState extends State<commentPage> {

  List<String> _comments = [];
  void _addcomment(String val) {
    setState(() {

      _comments.add(val);
    });
  }

  Widget _buildComment() {
    return ListView.builder(
        itemCount: authenticationAPI.getcomment.length,
        itemBuilder: (context, index) {
          var item = authenticationAPI.getcomment[index];

          return _buildCommentItem(comment:item.comment,name: item.user_id);

        });
  }





  Widget _buildCommentItem({String comment, String name}) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: CircleAvatar(
              maxRadius: 30.0,
              child: Text(name.substring(0, 1))),
        ),
        SizedBox(width: 10.0,),
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xffe5e5e5),
                  borderRadius: BorderRadius.circular(30.0)),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0,top: 10.0),
                        child: Text(name,style: TextStyle( decoration: TextDecoration.underline , fontWeight:FontWeight.bold),),
                      )),
                  ListTile(
                    title: Text(comment),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  final fieldText = TextEditingController();
  void clearText() {
    fieldText.clear();
  }


  @override

  Widget build(BuildContext context) {
    var controller = Get.put(AppController());

    return Scaffold(

      appBar: AppBar(
        title: Text("comment "),
      ),
      body: Column(
        children: <Widget>[


          Expanded(child: _buildComment()),
          Row(
            children: [
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffb5b5b5),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        controller: fieldText,
                        onSubmitted: (String SubmittedSTR) {
                          _addcomment(SubmittedSTR);
                          clearText();
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Type a Comment ',
                          hintStyle: TextStyle(color: Color(0xff9e9e9e)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 1,
                child: Material(
                  child: IconButton(
                      icon: Icon(Icons.send_outlined),
                      onPressed: () async {

                        if (fieldText.text.toString() != "") {
                          var response = await controller.PComment(fieldText.text.toString(), controller.idPostcommrnt.value);
                          if (response) {
                            AlertDialog alert1 = AlertDialog(
                              title: Row(
                                children: [
                                  Icon(FontAwesome.check_square_o,color: Colors.green,),
                                  Expanded(child: Text( " Comment added . ")),
                                ],
                              ),

                              actions: [
                                FlatButton(
                                  child: Text("OK",style: TextStyle(color: Colors.black),),
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                ),
                              ],
                            );
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return alert1;
                                });

                            _addcomment(fieldText.text.toString());
                            clearText();
                          }
                          else  {
                            AlertDialog alert1 = AlertDialog(
                              title: Row(
                                children: [
                                  Icon(Icons.backspace_outlined,color: Colors.red,),
                                  Expanded(child: Text( " Comment not added .")),
                                ],
                              ),

                              actions: [
                                FlatButton(
                                  child: Text("OK",style: TextStyle(color: Colors.black),),
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                ),
                              ],
                            );
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return alert1;
                                });
                          }
                        }
                      }),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
