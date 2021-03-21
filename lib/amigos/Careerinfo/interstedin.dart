import 'package:flutter/cupertino.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:chat/amigos/controller/appcontroller.dart';
import 'package:chat/amigos/pagesnavigationbar/chat.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chat/amigos/model/coustomcolor.dart';
import 'package:chat/amigos/myhomepage.dart';
import 'package:flutter_svg/flutter_svg.dart';

class interstedin extends StatefulWidget {
  @override
  _interstedinState createState() => _interstedinState();
}

class _interstedinState extends State<interstedin> {
  final _formKey = GlobalKey<FormState>();

  AppController authenticationAPI = Get.put(AppController());
  bool isLoading = false;

  bool loginError = false;

  TextEditingController _skill_id;


  int skill_id;


  @override
  void initState() {
    super.initState();
    _skill_id = TextEditingController();

  }

  @override
  void dispose() {
    _skill_id.dispose();

    super.dispose();
  }

  DateTime selectedStardDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();
  var controller = Get.put(AppController());
  int skillis;
  String Selecteditem = "laravel";
  skid() {
    if (Selecteditem == "laravel")
      return skillis = 1;
    else if (Selecteditem == "assembly")
      return skillis = 2;
    else if(Selecteditem == "batchfile")
      return skillis=3 ;
    else if(Selecteditem == "C")
      return skillis= 4;
    else if(Selecteditem == "C#")
      return skillis=5 ;
    else if(Selecteditem == "C++")
      return skillis= 6;
    else if(Selecteditem == "Css")
      return skillis=7 ;
    else if(Selecteditem == "html")
      return skillis= 8;
    else if(Selecteditem == "java")
      return skillis= 9;
    else if(Selecteditem == "php")
      return skillis=10 ;
    else if(Selecteditem == "python")
      return skillis=11 ;
    else if(Selecteditem == "typescript")
      return skillis= 12;
    else if(Selecteditem == "vue")
      return skillis= 13;
    else if(Selecteditem == "android")
      return skillis= 14;
    else if(Selecteditem == "angular")
      return skillis=15 ;
    else if(Selecteditem == "apple-swift")
      return skillis= 16;
    else if(Selecteditem == "aws")
      return skillis= 17;
    else if(Selecteditem == "django")
      return skillis= 18;
    else if(Selecteditem == "docker")
      return skillis= 19;
    else if(Selecteditem == "jquery")
      return skillis= 20;
    else if(Selecteditem == "wordpress")
      return skillis= 20;


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.bgBlack,
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height:  MediaQuery.of(context).size.height/3,
              child: SvgPicture.asset("assets/intersted.svg"),
            ),
            Container(
              height: 350,
              child: Padding(
                padding: EdgeInsets.all(50),
                child:
                    Card(color: MyColor.secondBlack, child: _drawLoginForm()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawLoginForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: <Widget>[
            ////////////////////////
            Container(
                decoration: BoxDecoration(
                    color: MyColor.Mianyallow,
                    borderRadius: BorderRadius.circular(5.0)),
                child: DropdownSearch<String>(
                  showSearchBox: false,
                  popupBackgroundColor: MyColor.Mianyallow,
                  autoFocusSearchBox: false,
                  validator: (v) => v == null ? "required field" : null,
                  hint: "Select a country",
                  mode: Mode.DIALOG,
                  // showSelectedItem: true,
                  items: ["laravel", "assembly","batchfile","C","C#","C++","Css","html","java","javascript","php","python","typescript","vue","android","angular","apple-swift","aws","django","docker","jquery","wordpress",],
                  showClearButton: true,
                  onChanged: (value) {
                    Selecteditem = value;
                  },
                  popupItemDisabled: (String s) => s.startsWith('I'),
                  selectedItem: "laravel",
                  onBeforeChange: (a, b) {
                    AlertDialog alert = AlertDialog(
                      title: Text("Are you sure..."),
                      content: Text("...you want to clear the selection"),
                      actions: [
                        FlatButton(
                          child: Text("OK"),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                        ),
                        FlatButton(
                          child: Text("NOT OK"),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                      ],
                    );

                    return showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        });
                  },
                )),
            SizedBox(
              height: 48,
            ),
            /////////////////

            SizedBox(
                width: double.infinity,
                child: FlatButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      // TODO : Call Api for login
                      setState(() {
                        isLoading = true;
                      });
                      skill_id = skid();


                      var response = await authenticationAPI.inersted(
                          skill_id);

                      if (response) {
                        AlertDialog alert1 = AlertDialog(
                          title: Row(
                            children: [
                              Icon(FontAwesome.check_square_o,color: Colors.green,),
                              Expanded(child: Text( " interested in has been added . ")),
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
                      } else {
                        loginError = true;
                      }
                      setState(() {
                        isLoading = false;
                      });
                    } else {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                  ///////////////////////////
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: MyColor.Mianyallow,
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: MyColor.bgBlack,
                            spreadRadius: 1,
                            blurRadius: 2
                            //offset: Offset(0, 3),
                            ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            fontSize: 24,
                            color: MyColor.bgBlack,
                          ),
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget _drawLoading() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Future<DateTime> _selectDateTime(BuildContext context) => showDatePicker(
        context: context,
        initialDate: DateTime.now().add(Duration(seconds: 1)),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );
}
