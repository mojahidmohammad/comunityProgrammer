import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
  class BottomCards extends StatefulWidget {
  final String cardTitle;
  final String cardContent;
  BottomCards(this.cardTitle, this.cardContent);
  @override
  _BottomCardsState createState() => _BottomCardsState();
}

class _BottomCardsState extends State<BottomCards>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {},
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                children: <Widget>[
                  Text(widget.cardTitle),
                  Spacer(),
                  new ButtonBar(
                    children: <Widget>[
                      new IconButton(
                        icon: Icon(Ionicons.ios_heart_empty ,color: Colors.redAccent,),
                        //onPressed: REFRESH,
                      ),
                      new IconButton(
                        icon: Icon(AntDesign.rest, color: Colors.blue,),
                        //onPressed: BOOKMARK,
                      ),
                      new IconButton(
                        icon: Icon(MaterialIcons.ac_unit),
                        //onPressed: COPY,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}