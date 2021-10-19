import 'package:blogapp/Screens/Signup/components/background.dart';
import 'package:blogapp/widgets/background-image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LOgin2 extends StatefulWidget {
  const LOgin2({Key key}) : super(key: key);

  @override
  _LOgin2State createState() => _LOgin2State();
}

class _LOgin2State extends State<LOgin2> {
  TapGestureRecognizer _changesign;
  bool showsignin = true;
  @override
  void initState() {
    _changesign = new TapGestureRecognizer()
      ..onTap = () {
        setState(() {
          showsignin = !showsignin;
          print(showsignin);
        });
      };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var wh = MediaQuery.of(context).size.width;

    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
            body: Stack(children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
          ),
          //  poisition_top(wh),
          //
          // positione_bottom(wh),
          BackgroundImage(),
          Container(
              child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Center(child: Text("login")),
                Center(child: Text("login")),
                Center(child: Text("login")),
                Center(
                    child: Container(
                  child: Text(
                    showsignin ? "Hi Baby" : "Sign Up",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontStyle: FontStyle.italic),
                  ),
                  margin: EdgeInsets.only(top: 30),
                )),
                build_top(),
                Padding(padding: EdgeInsets.only(top: 50)),
                build_form(wh),
                Center(
                  child: Container(
                    // margin: EdgeInsets.only(top: 5),
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "forget password ?",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.pink.withOpacity(0.8),
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        RaisedButton(
                          elevation: 8,
                          color: Colors.blueGrey[300],
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 60),
                            child: RichText(
                                text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: "You Dont have account?",
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 20)),
                              TextSpan(
                                  recognizer: _changesign,
                                  text: showsignin ? "Sign up" : "Hi Baby",
                                  style: TextStyle(
                                    color: Colors.pink.withOpacity(0.9),
                                    fontSize: 20,
                                    decoration: TextDecoration.underline,
                                  ))
                            ])))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ))
        ])));
  }

  Container build_top() {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          color: showsignin ? Colors.white : Colors.blueGrey,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(color: Colors.blueGrey, blurRadius: 2, spreadRadius: 3)
          ]),
      child: Icon(FontAwesomeIcons.baby,
          size: 50, color: showsignin ? Colors.blueGrey : Colors.white),
    );
  }

  Center build_form(double wh) {
    return Center(
        child: Container(
      height: 250,
      width: wh / 1.2,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
                color: Colors.blueGrey,
                spreadRadius: 0.1,
                blurRadius: 1,
                offset: Offset(0, 1))
          ]),
      child: Form(
          child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(" username"),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                decoration: InputDecoration(
              contentPadding: EdgeInsets.all(4),
              prefixIcon: Icon(Icons.person),
              hintText: "Enter username",
              filled: true,
              fillColor: Colors.grey[200],
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey[500],
                      style: BorderStyle.solid,
                      width: 1)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey[500],
                      style: BorderStyle.solid,
                      width: 1)),
            )),
            SizedBox(
              height: 10,
            ),
            Text(" Password"),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(4),
                  hintText: "Enter password",
                  prefixIcon: Icon(Icons.password_rounded),
                  filled: true,
                  fillColor: Colors.grey[200],
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey[500],
                          style: BorderStyle.solid,
                          width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey[500],
                          style: BorderStyle.solid,
                          width: 1)),
                ))
          ],
        ),
      )),
    ));
  }

  Positioned poisition_top(double wh) {
    return Positioned(
        child: Transform.scale(
      scale: 1.3,
      child: Transform.translate(
        offset: Offset(0, -wh / 1.8),
        child: Container(
          height: wh,
          width: wh,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(wh),
            color: showsignin
                ? Colors.blueGrey[300]
                : Colors.pink[300].withOpacity(0.5),
          ),
        ),
      ),
    ));
  }

  Positioned positione_bottom(double wh) {
    return Positioned(
      top: 300,
      left: wh / 1.5,
      child: Container(
        height: wh,
        width: wh,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(wh),
          color: showsignin
              ? Colors.pink[300].withOpacity(0.5)
              : Colors.blueGrey[300],
        ),
      ),
    );
  }
}
