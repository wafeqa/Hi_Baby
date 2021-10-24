import 'package:blogapp/Blog/addBlog.dart';
import 'package:blogapp/Pages/comment.dart';
import 'package:blogapp/group.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

import 'HomePage.dart';
import 'login2.dart';

class home_page extends StatefulWidget {
  const home_page({Key key}) : super(key: key);

  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    //   Text("@$username"),
                  ],
                ),
              ),
              ListTile(
                title: Text("Gallery"),
                trailing: Icon(Icons.launch),
                onTap: () {},
              ),
              ListTile(
                title: Text("New Story"),
                trailing: Icon(Icons.add),
                onTap: () {},
              ),
              ListTile(
                title: Text("Edit profile"),
                trailing: Icon(Icons.settings),
                onTap: () {},
              ),
              ListTile(
                title: Text("my "),
                trailing: Icon(Icons.feedback),
                onTap: () {},
              ),
              ListTile(
                  title: Text("Logout"),
                  trailing: Icon(Icons.power_settings_new),
                  onTap: () {}),
            ],
          ),
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(
              height: 220,
              width: double.infinity,
              child: Carousel(
                images: [
                  Image.asset('assets/back.PNG', fit: BoxFit.cover),
                  Image.asset('assets/baby4.jpg', fit: BoxFit.cover),
                  Image.asset('assets/baby_mum.jpg', fit: BoxFit.cover),
                  Image.asset('assets/profile_baby.jpg', fit: BoxFit.cover),
                ],
                showIndicator: false,
              ),
            ),
            Container(
                padding: EdgeInsets.all(30),
                child: Text(
                  "Cateogrize",
                  style: TextStyle(fontSize: 20),
                )),
            Container(
                height: 400,
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 5),
                  children: <Widget>[
                    InkWell(
                        child: GridTile(
                            footer: Container(
                              padding: EdgeInsets.all(5),
                              color: Colors.amber,
                              height: 30,
                              child: Text(
                                'Baby gallary',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 4,
                              backgroundImage: AssetImage("assets/memory.jpg"),
                            )),
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                              (route) => false);
                        }),
                    InkWell(
                        child: GridTile(
                            footer: Container(
                              padding: EdgeInsets.all(5),
                              color: Colors.blueGrey,
                              height: 30,
                              child: Text(
                                'Baby games',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 4,
                              backgroundImage: AssetImage("assets/ola.jpg"),
                            )),
                        onTap: () {}),
                    InkWell(
                        child: GridTile(
                            footer: Container(
                              padding: EdgeInsets.all(5),
                              color: Colors.blueGrey,
                              height: 30,
                              child: Text(
                                'Baby doctors',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 4,
                              backgroundImage:
                                  AssetImage("assets/baby_doc.jpg"),
                            )),
                        onTap: () {}),
                    InkWell(
                        child: GridTile(
                            footer: Container(
                              padding: EdgeInsets.all(5),
                              color: Colors.blueGrey,
                              height: 30,
                              child: Text(
                                'Sounds',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 4,
                              backgroundImage: AssetImage("assets/sound.jpg"),
                            )),
                        onTap: () {}),
                    InkWell(
                        child: GridTile(
                            footer: Container(
                              padding: EdgeInsets.all(5),
                              color: Colors.blueGrey,
                              height: 30,
                              child: Text(
                                'Write Notes',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 4,
                              backgroundImage:
                                  AssetImage("assets/wite_note.jpg"),
                            )),
                        onTap: () {}),
                    InkWell(
                        child: GridTile(
                            footer: Container(
                              padding: EdgeInsets.all(5),
                              color: Colors.purpleAccent,
                              height: 30,
                              child: Text(
                                'mother groups',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 4,
                              backgroundImage: AssetImage("assets/mother2.jpg"),
                            )),
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => group(Key(null))),
                              (route) => false);
                        }),
                  ],
                ))
          ],
        ));
  }
}
