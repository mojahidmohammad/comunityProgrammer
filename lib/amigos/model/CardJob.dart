import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chat/amigos/controller/appcontroller.dart';
import 'package:chat/amigos/model/coustomcolor.dart';
import 'package:chat/amigos/model/openEmailApp.dart';
import 'package:readmore/readmore.dart';

class ItemCardCompanies extends StatefulWidget {
  final String ImageURL;
  final String NameCompany;
  final String Discribyion;
  final String email;
  final String country;
  final String active;



  const ItemCardCompanies({Key key, this.ImageURL, this.NameCompany, this.Discribyion, this.email, this.country, this.active})
      : super(key: key);
  @override
  _ItemCardCompaniesState createState() => _ItemCardCompaniesState();
}

class _ItemCardCompaniesState extends State<ItemCardCompanies> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppController());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Material(
        color: MyColor.secondBlack,
        borderRadius: BorderRadius.circular(15),
        elevation: 8,
        child: Container(
          decoration: BoxDecoration(
            color: MyColor.secondBlack,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: MyColor.Mianyallow,
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(widget.ImageURL),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Text(
                      widget.NameCompany,
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 19,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Divider(
                      color: Colors.white70,
                      indent: 50.0,
                      endIndent: 50.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Email : ",
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 15,
                                  color: Colors.white70),
                            ),
                            Spacer(),
                            Text(
                              widget.email,
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              "Country : ",
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 15,
                                  color: Colors.white70),
                            ),
                            Spacer(),
                            Text(
                              widget.country,
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              "Active : ",
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 15,
                                  color: Colors.white70),
                            ),
                            Spacer(),
                            Text(
                              widget.active ,
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Description : ",
                          style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 15,
                              color: Colors.white70),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ReadMoreText(
                          widget.Discribyion,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          textAlign: TextAlign.justify,
                          colorClickableText: MyColor.Mianyallow,
                          trimCollapsedText: '...Read More',
                          trimExpandedText: ' Show Less',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.white70,
                      indent: 50.0,
                      endIndent: 50.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        buildButton(
                          text: 'Open Location',
                          onClicked: () => Utils.openLink(url: 'https://www.google.com/maps/@33.5445102,36.3064471,13z'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildButton({
    @required String text,
    @required VoidCallback onClicked,
  }) =>
      Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        child:RaisedButton(

          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.white)
          ),
          onPressed: onClicked,
          color: MyColor.bgBlack,
          textColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(Icons.location_on_outlined),
                SizedBox(width: 5,),
                Text(
                  text,
                  style: TextStyle(color: MyColor.Mianyallow),
                ),
              ],
            ),
          ),
        ),
      );

}
