import 'package:flutter/cupertino.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:chat/amigos/controller/appcontroller.dart';
import 'package:chat/amigos/pagesnavigationbar/chat.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chat/amigos/model/coustomcolor.dart';
import 'package:chat/amigos/myhomepage.dart';

class career extends StatefulWidget {
  @override
  _careerState createState() => _careerState();
}

class _careerState extends State<career> {
  final _formKey = GlobalKey<FormState>();

  AppController authenticationAPI = Get.put(AppController());
  bool isLoading = false;

  bool loginError = false;

  TextEditingController _skill_id;
  TextEditingController _start_date;
  TextEditingController _end_date;
  TextEditingController _job_type;

  int skill_id;
  String start_date, end_date, job_type;

  @override
  void initState() {
    super.initState();
    _skill_id = TextEditingController();
    _start_date = TextEditingController();
    _end_date = TextEditingController();
    _job_type = TextEditingController();
  }

  @override
  void dispose() {
    _skill_id.dispose();
    _start_date.dispose();
    _end_date.dispose();
    _job_type.dispose();
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
      body: ListView(
        children: <Widget>[
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 25),
            child: Padding(
              padding: EdgeInsets.all(25),
              child: Card(color: MyColor.secondBlack, child: _drawLoginForm()),
            ),
          ),
        ],
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
                  validator: (v) => v == null ? "required field" : null,
                  hint: "Select a country",
                  mode: Mode.DIALOG,
                  showSelectedItem: true,
                  items:  ["laravel", "assembly","batchfile","C","C#","C++","Css","html","java","javascript","php","python","typescript","vue","android","angular","apple-swift","aws","django","docker","jquery","wordpress",],
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
            Container(
              child: TextFormField(
                style: TextStyle(
                  color: Colors.black,
                ),
                controller: _job_type,
                decoration: InputDecoration(
                  hintText: 'Type Jop ',
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: MyColor.Mianyallow,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Type Jop ';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 48,
            ),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: () async {
                        final selectedStardDate =
                            await _selectDateTime(context);
                        if (selectedStardDate == null) return;

                        print(selectedStardDate);
                        setState(() {
                          this.selectedStardDate = DateTime(
                            selectedStardDate.year,
                            selectedStardDate.month,
                            selectedStardDate.day,
                          );
                        });
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black)),
                      child: Text("Select Start Day : "),
                      color: MyColor.Mianyallow,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: MyColor.Mianyallow),
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Text(
                          selectedStardDate.toString().substring(0, 10),
                          style: TextStyle(color: MyColor.Mianyallow),
                        ),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 48,
            ),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: () async {
                        final selectedEndDate = await _selectDateTime(context);
                        if (selectedEndDate == null) return;

                        print(selectedEndDate);
                        setState(() {
                          this.selectedEndDate = DateTime(
                            selectedEndDate.year,
                            selectedEndDate.month,
                            selectedEndDate.day,
                          );
                        });
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black)),
                      child: Text("Select End Day : "),
                      color: MyColor.Mianyallow,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: MyColor.Mianyallow),
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Text(
                          selectedEndDate.toString().substring(0, 10),
                          style: TextStyle(color: MyColor.Mianyallow),
                        ),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 48,
            ),
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
                      job_type = _job_type.text;
                      start_date = selectedStardDate.toString();
                      end_date = selectedEndDate.toString();

                      var response = await authenticationAPI.Skills(
                          skill_id, start_date, end_date, job_type);


                      if (response) {
                        AlertDialog alert1 = AlertDialog(
                          title: Row(
                            children: [
                              Icon(FontAwesome.check_square_o,color: Colors.green,),
                              Text( " career info has been added . "),
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
