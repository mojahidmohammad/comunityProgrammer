import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:chat/amigos/controller/appcontroller.dart';
import 'package:chat/amigos/model/coustomcolor.dart';
import 'package:chat/amigos/model/openEmailApp.dart';
import 'package:readmore/readmore.dart';

class ItemCard extends StatefulWidget {
  final String ImageURL;
  final String NameCompany;
  final String Discribyion;
  final String title;
  final String created_at;
  final String updated_at;
  final String active;
  final String job_type;
  final String job_salary;
  final String paid_per;
  const ItemCard(
      {Key key,
      this.ImageURL,
      this.NameCompany,
      this.Discribyion,
      this.title,
      this.created_at,
      this.updated_at,
      this.active,
      this.job_type,
      this.job_salary,
      this.paid_per})
      : super(key: key);
  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppController());
    Widget buildButton({
      @required String text,
      @required VoidCallback onClicked,
    }) =>
        Container(

          padding: EdgeInsets.symmetric(vertical: 12),
          child: RaisedButton(

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
                  Icon(Icons.attach_email_outlined,color: (widget.active == "yes")?Colors.red :Colors.green ,),
                  SizedBox(width: 11,),
                  Text(
                    text,
                    style: TextStyle(color: MyColor.Mianyallow),
                  ),
                ],
              ),
            ),
          ),
        );

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
                height: MediaQuery.of(context).size.height * 0.15,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Company Name : ",
                          style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 19,
                              color: Colors.white),
                        ),
                        Text(
                          widget.NameCompany,
                          style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
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
                              "Title : ",
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 15,
                                  color: Colors.white70),
                            ),
                            Spacer(),
                            Text(
                              widget.title,
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
                              "Type Job : ",
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 15,
                                  color: Colors.white70),
                            ),
                            Spacer(),
                            Text(
                              widget.job_type,
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
                              "Salary : ",
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 15,
                                  color: Colors.white70),
                            ),
                            Spacer(),
                            Text(
                              widget.job_salary + " \$",
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
                          colorClickableText: Colors.pink,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Created at  : ",
                                  style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontSize: 15,
                                      color: Colors.white70),
                                ),
                                SizedBox(width: 10.0,),
                                Text(
                                  widget.created_at,
                                  style:
                                      TextStyle(fontSize: 13, color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.5,
                            ),

                          ],
                        ),
                        buildButton(
                          text: 'Send Email',
                          onClicked: () => Utils.openEmail(
                            toEmail: 'Cmpany1@gmail.com',
                            subject: '[TYPE JOB ] Seeks [JOB TITLE]',
                            body:
                            'Dear [ENTER MANAGER NAME] : \n\n\nI have attached my resume and a cover letter for the  [JOB TITLE] position at . \n\n\n [ENTER ANY SKILLS].\n\n\nI am looking forward to meeting you to share my insights and ideas.\n\n\n\n\nSincerely,\n\n\n\nAttachments: [UPLOAD YOU CV &&\n\n YOU EMAIL \n\n&&\n\n  YOR PHONE\n\n&&\n\n]'

                          ),
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


}
