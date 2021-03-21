import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chat/amigos/controller/appcontroller.dart';


import 'dart:async';

import 'package:chat/amigos/model/JobsModel.dart';
import 'package:chat/amigos/services/services.dart';

class UserFilterDemo extends StatefulWidget {
  UserFilterDemo() : super();
  var controller = Get.put(AppController());

  final String title = "Filter List Demo";

  @override
  UserFilterDemoState createState() => UserFilterDemoState();
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class UserFilterDemoState extends State<UserFilterDemo> {
  //
  final _debouncer = Debouncer(milliseconds: 500);
  List<Jobssmodel> users = List();
  List<Jobssmodel> filteredUsers = List();

  @override
  void initState() {
    super.initState();
    controller.getJobs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15.0),
              hintText: 'Filter by name or email',
            ),
            onChanged: (string) {
              _debouncer.run(() {
                setState(() {
                  filteredUsers = users
                      .where((u) => (u.job_type
                      .toLowerCase()
                      .contains(string.toLowerCase()) ||
                      u.email.toLowerCase().contains(string.toLowerCase())))
                      .toList();
                });
              });
            },
          ),

        ],
      ),
    );
  }
}
