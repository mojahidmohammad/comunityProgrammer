import 'package:chat/quiz/home.dart';

import 'package:chat/views/chatrooms.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chat/amigos/Careerinfo/CareerPage.dart';
import 'package:chat/amigos/Careerinfo/interstedin.dart';
import 'package:chat/amigos/animations.dart';
import 'package:chat/amigos/model/CardCompanies.dart';
import 'package:chat/amigos/model/CardJob.dart';
import 'package:chat/amigos/quiz/screens/quiz/quiz_screen.dart';
import 'package:chat/amigos/services/services.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:chat/amigos/controller/appcontroller.dart';
import 'package:chat/amigos/model/coustomcolor.dart';
import 'package:text_editor/text_editor.dart';
import 'package:chat/amigos/model/customcard.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:chat/amigos/pagesnavigationbar/chat.dart';
import 'package:chat/amigos/pagesnavigationbar/dachpord.dart';
import 'package:chat/amigos/pagesnavigationbar/jop.dart';
import 'package:chat/amigos/pagesnavigationbar/commentPage.dart';
import 'package:chat/amigos/widgetdrawer/card_item.dart';
import 'package:chat/amigos/widgetdrawer/stack_container.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:readmore/readmore.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex;
  var controller = Get.put(AppController());

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: (currentIndex == 2) ? Colors.white : MyColor.bgBlack,
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                StackContainer(),
                ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    CardItem(
                      title: controller.user_name,
                      desc: controller.emailget,
                      iconq: Icon(Icons.perm_identity,
                          size: 40.0, color: MyColor.Mianyallow),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(Dashpord());
                      },
                      child: CardItem(
                          title: " Recommendation ",
                          desc: "recommendation courses ",
                          iconq: Icon(
                            Icons.golf_course,
                            size: 40.0,
                            color: MyColor.Mianyallow,
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(ProfileApp());
                      },
                      child: CardItem(
                        title: "About US ",
                        desc: "Be close to us",
                        iconq: Icon(
                          Icons.info,
                          size: 40.0,
                          color: MyColor.Mianyallow,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    Container(
                        child: Column(
                      children: [
                        Text(
                          "version",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3),
                        ),
                        Text("1.0.0",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.grey))
                      ],
                    )),
                  ],
                  shrinkWrap: true,
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(ChatRoom());
          },
          child: Icon(Ionicons.md_chatbubbles, color: Colors.pink),
          backgroundColor: MyColor.Mianyallow,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BubbleBottomBar(
          elevation: 0.1,
          opacity: 0.9,
          backgroundColor: Color(0xffe6e6ed),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16.0),
          ),
          currentIndex: currentIndex,
          hasInk: true,
          inkColor: Colors.black12,
          hasNotch: true,
          fabLocation: BubbleBottomBarFabLocation.end,
          onTap: changePage,
          items: [
            BubbleBottomBarItem(
              backgroundColor: MyColor.Mianyallow,
              icon: Icon(
                Ionicons.ios_paper,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Ionicons.ios_paper,
                color: Colors.pink,
              ),
              title: Text(
                'Posts',
                style: TextStyle(color: Colors.black),
              ),
            ),
            BubbleBottomBarItem(
              backgroundColor: MyColor.Mianyallow,
              icon: Icon(
                FontAwesome.building_o,
                color: Colors.black,
              ),
              activeIcon: Icon(
                FontAwesome.building_o,
                color: Colors.pink,
              ),
              title: Expanded(
                child: Text(
                  'company',
                  style: TextStyle(color: Colors.black,fontSize: 12),
                ),
              ),
            ),
            BubbleBottomBarItem(
              backgroundColor: MyColor.Mianyallow,
              icon: Icon(
                FontAwesome.modx,
                color: Colors.black,
              ),
              activeIcon: Icon(
                FontAwesome.modx,
                color: Colors.pink,
              ),
              title: Text(
                'JOBS',
                style: TextStyle(color: Colors.black),
              ),
            ),
            BubbleBottomBarItem(
              backgroundColor: MyColor.Mianyallow,
              icon: Icon(
                Icons.post_add,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.post_add,
                color: Colors.pink,
              ),
              title: Text(
                'career',
                style: TextStyle(color: Colors.black),
              ),
            ),
            BubbleBottomBarItem(
              backgroundColor: MyColor.Mianyallow,
              icon: Icon(
                FontAwesome.quora,
                color: Colors.black,
              ),
              activeIcon: Icon(
                FontAwesome.quora,
                color: Colors.pink,
              ),
              title: Text(
                'Quiz',
                style: TextStyle(color: Colors.black),
              ),
            ),
            BubbleBottomBarItem(
              backgroundColor: MyColor.Mianyallow,
              icon: Icon(
                FontAwesome.assistive_listening_systems,
                color: Colors.black,
              ),
              activeIcon: Icon(
                FontAwesome.assistive_listening_systems,
                color: Colors.pink,
              ),
              title: Text(
                'Interest',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
        appBar: (currentIndex == 1)
            ? AppBar(
                iconTheme: IconThemeData(color: MyColor.Mianyallow),
                backgroundColor: MyColor.bgBlack,
                title: Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey[200]),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: MyColor.Mianyallow,
                        ),
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.black26),
                        hintText: "Search Companies",
                      ),
                    ),
                  ),
                ),
              )
            : (currentIndex == 2)
                ? AppBar(
                    iconTheme: IconThemeData(color: MyColor.Mianyallow),
                    backgroundColor: MyColor.bgBlack,
                    title: Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey[200]),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: MyColor.Mianyallow,
                            ),
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.black26),
                            hintText: "Search a Jobs",
                          ),
                        ),
                      ),
                    ),
                  )
                : (currentIndex == 5)
                    ? AppBar(
                        elevation: 10.0,
                        iconTheme: IconThemeData(color: MyColor.Mianyallow),
                        backgroundColor: MyColor.bgBlack,
                        title: Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Text(
                                "Type Your Skills ",
                                style: TextStyle(
                                    color: Colors.grey[200],
                                    decoration: TextDecoration.underline),
                              )),
                        ),
                      )
                    : (currentIndex == 3)
                        ? AppBar(
                            elevation: 10.0,
                            iconTheme: IconThemeData(color: MyColor.Mianyallow),
                            backgroundColor: MyColor.bgBlack,
                            title: Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Text(
                                    "Type Your Career info :  ",
                                    style: TextStyle(
                                        color: Colors.grey[200],
                                        decoration: TextDecoration.underline),
                                  )),
                            ),
                          )
                        : (currentIndex == 0)?AppBar(
                            iconTheme: IconThemeData(color: MyColor.Mianyallow),
                            backgroundColor: MyColor.bgBlack,
                            title: Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.grey[200]),
                                child: TextField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: MyColor.Mianyallow,
                                    ),
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(color: Colors.black26),
                                    hintText: "Search ",
                                  ),
                                ),
                              ),
                            ),
                          ):(AppBar(
          backgroundColor: MyColor.bgBlack,
          title: Text(
            "Quiz Start ",
            style: TextStyle(
                fontFamily: "Quando",
                color: Colors.white
            ),
          ),

        )),
        body: (currentIndex == 0)
            ? FadeAnimation(
               2.1,
                SafeArea(
                  child: Stack(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 20.0),
                                child: Row(
                                  children: <Widget>[],
                                ),
                              ),
                            ),
                            Expanded(child: Obx(() {
                              return controller.postloading.value
                                  ? Center(
                                      child: Text("No Enternet ",style: TextStyle(color: Colors.white),)
                                    )
                                  : ListView.builder(
                                      itemCount: controller.getposts.length,
                                      itemBuilder: (context, index) {
                                        var item = controller.getposts[index];
                                        return makepost(context,
                                            userName: item.title,
                                            userImage: "assets/onlyLogo.png",
                                            feedTime: item.created_at
                                                .substring(0, 10),
                                            feedText: item.desc,
                                            count: item.id.toString(),
                                            IdPost: item.Useruser_name,
                                            createdBy: item.Useruser_name);
                                      });
                            }))
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
            : (currentIndex == 1)
                ? FadeAnimation(
                    1.9,
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
                                  return ItemCardCompanies(
                                    Discribyion: item.description,
                                    ImageURL: item.logo_url,
                                    NameCompany: item.user_name,
                                    active: item.active,
                                    country: item.country,
                                    email: item.email,
                                  );
                                });
                      }),
                    ))
                : (currentIndex == 2)
                    ? FadeAnimation(
                        1.9,
                        Container(
                          color: Colors.black,
                          child: Obx(() {
                            return controller.postloading.value
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : ListView.builder(
                                    itemCount: controller.getJobs.length,
                                    itemBuilder: (context, index) {
                                      var item = controller.getJobs[index];
                                      return ItemCard(
                                        Discribyion: item.desc,
                                        ImageURL: item.logo_url,
                                        NameCompany: item.user_name,
                                        title: item.title,
                                        created_at:
                                            item.created_at.substring(0, 10),
                                        job_salary: item.job_salary.toString(),
                                        job_type: item.job_type,
                                        updated_at:
                                            item.updated_at.substring(0, 10),
                                      );
                                    });
                          }),
                        ))
                    : (currentIndex == 3)
                        ? FadeAnimation(1.9, career())
                        : (currentIndex == 5)
                            ? FadeAnimation(1.9, interstedin())
                            : FadeAnimation(1.9, homepage(),));
  }
}

Widget CountPosts(BuildContext context, count) {
  return Container(
    width: MediaQuery.of(context).size.width / 1.9,
    // padding: EdgeInsets.symmetric(horizontal: 325, vertical: 5),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey[200]),
      borderRadius: BorderRadius.circular(100),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(count,
              style: TextStyle(color: MyColor.Mianyallow, fontSize: 13)),
        ),
        SizedBox(
          width: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            "Comments",
            style: TextStyle(
                color: MyColor.bgBlack,
                fontSize: 13,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    ),
  );
}

Widget makepost(BuildContext context,
    {userName, feedTime, userImage, feedText, count, IdPost, createdBy}) {
  bool flag = false;

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Container(
      decoration: BoxDecoration(
          color: MyColor.secondBlack,
          borderRadius: BorderRadius.circular(20.0)),
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Row(
                  children: <Widget>[
                    userImage != ""
                        ? Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, bottom: 8.0, top: 8),
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(userImage),
                                      fit: BoxFit.cover,)),
                            ),
                          )
                        : Container(child: CircularProgressIndicator()),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 8.0),
                            child: Text(
                              userName,
                              maxLines: null,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.001,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              feedTime,
                              style: TextStyle(
                                  fontSize: 15, color: MyColor.Mianyallow),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ReadMoreText(
              feedText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
              colorClickableText: MyColor.Mianyallow,
              trimCollapsedText: '...Read More',
              trimExpandedText: ' Show Less',
            ),
            // child: Text(
            //   feedText,
            //   style: TextStyle(
            //       fontSize: 16,
            //       color: Colors.white,
            //       height: 1.5,
            //       letterSpacing: .7),
            // ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Text(
                  "Created by : ",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                Text(
                  createdBy,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white,
                      decoration: TextDecoration.underline),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  //   makeLike(),
                  Transform.translate(
                    offset: Offset(-5, 0),
                    //child: makeLove()
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  flex: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: makeLikeButton(context,
                        isActive: true, IdPosts: IdPost),
                  )),
              Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CountPosts(context, count),
                    //Text("400 Comments", style: TextStyle(fontSize: 13, color: Colors.grey[800]),),
                  ))
            ],
          ),
        ],
      ),
    ),
  );
}

Widget makeLikeButton(BuildContext context, {isActive, IdPosts}) {

  return InkWell(
    onTap: () {
      controller.ispostforcomment = IdPosts;
      controller.update();
      print  (controller.ispostforcomment);
      Get.to(commentPage());
    },
    child: Container(
      width: MediaQuery.of(context).size.width / 2,
      // padding: EdgeInsets.symmetric(horizontal: 325, vertical: 5),
      decoration: BoxDecoration(
        color: MyColor.bgBlack,
        border: Border.all(color: Colors.grey[200]),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.message_outlined,
            color: isActive ? MyColor.Mianyallow : Colors.grey,
            size: 18,
          ),
          SizedBox(
            width: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Comment",
              style:
                  TextStyle(color: isActive ? MyColor.Mianyallow : Colors.grey),
            ),
          )
        ],
      ),
    ),
  );
}
