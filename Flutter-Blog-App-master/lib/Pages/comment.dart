import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class comment extends StatefulWidget {
  const comment({Key key}) : super(key: key);

  @override
  _commentState createState() => _commentState();
}

class _commentState extends State<comment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          border: Border(top: BorderSide(color: Colors.grey))),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.camera_alt),
                            color: Colors.blueGrey,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            width: MediaQuery.of(context).size.width - 50,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Add comment",
                                filled: true,
                                fillColor: Colors.grey[300],
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.send),
                                  onPressed: () {},
                                  color: Colors.blueGrey,
                                ),
                                contentPadding: EdgeInsets.all(5),
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(60),
                                    borderSide:
                                        BorderSide(style: BorderStyle.none)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(60),
                                    borderSide:
                                        BorderSide(style: BorderStyle.none)),
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
