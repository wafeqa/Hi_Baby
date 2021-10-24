import 'package:blogapp/Pages/comment.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class group extends StatefulWidget {
  const group(Key key) : super(key: key);

  @override
  _groupState createState() => _groupState();
}

class _groupState extends State<group> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("mum group", textAlign: TextAlign.center),
        ),
        drawer: Drawer(),
        body: ListView(children: <Widget>[
          SizedBox(
            height: 240,
            width: double.infinity,
            child: Carousel(
              images: [
                Image.asset('assets/back.PNG', fit: BoxFit.cover),
                Image.asset('assets/mother3.jpg', fit: BoxFit.cover),
                Image.asset('assets/mother4.jpg', fit: BoxFit.cover),
              ],
              showIndicator: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Container(
              child: Card(
                  child: Column(
                children: <Widget>[
                  Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            child: Icon(Icons.person),
                            foregroundColor: Colors.blueGrey,
                          ),
                          title: TextFormField(
                            maxLength: 255,
                            maxLines: 10,
                            minLines: 1,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 13),
                                hintText: "Add new Post",
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.blueGrey),
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            color: Colors.blueGrey
                                                .withOpacity(0.2)))),
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(right: 10)),
                                    Icon(
                                      Icons.add_box,
                                      color: Colors.blueGrey,
                                    ),
                                    Text(
                                      "Add Post",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black87, fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ))
                          ],
                        )
                      ],
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.person),
                      foregroundColor: Colors.blueGrey,
                    ),
                    title: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text("Name"),
                    ),
                    trailing: Icon(Icons.filter_list),
                    isThreeLine: true,
                    subtitle: Text(
                        " my baby start tooking im very happy and i want to share this with you my friend"),
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          Icon(
                            Icons.thumb_up,
                            color: Colors.purpleAccent,
                          );
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(color: Colors.blueGrey))),
                            child: Padding(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Icon(
                                      Icons.thumb_up,
                                      color: Colors.blueGrey,
                                    ),
                                    Text(
                                      "Like",
                                      textAlign: TextAlign.center,
                                    ),
                                  ]),
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                            )),
                      )),
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => comment()),
                              (route) => false);
                        },
                        child: Padding(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: 4,
                                ),
                                Icon(
                                  Icons.comment,
                                  color: Colors.blueGrey,
                                ),
                                Text(
                                  "Comment",
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                        ),
                      )),
                    ],
                  )
                ],
              )),
            ),
          )
        ]));
  }
}
