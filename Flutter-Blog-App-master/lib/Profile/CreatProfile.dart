// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:blogapp/NetworkHandler.dart';
import 'package:blogapp/Pages/Home.dart';
import 'package:blogapp/Pages/HomePage.dart';
import 'package:blogapp/Pages/SignUpPage.dart';

// ignore: unused_import
import 'package:blogapp/widgets/ToggleButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';

// ignore: unused_import

class CreatProfile extends StatefulWidget {
  CreatProfile({Key key}) : super(key: key);

  @override
  _CreatProfileState createState() => _CreatProfileState();
}

class _CreatProfileState extends State<CreatProfile> {
  final networkHandler = NetworkHandler();
  bool circular = false;
  PickedFile _imageFile;
  final _globalkey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _type = TextEditingController();
  TextEditingController _dob = TextEditingController();
  TextEditingController _title = TextEditingController();
  TextEditingController _about = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalkey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 55),
          children: <Widget>[
            imageProfile(),
            SizedBox(
              height: 20,
            ),
            nameTextField(),
            SizedBox(
              height: 20,
            ),
            togglebutton(),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            dobField(),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                setState(() {
                  circular = true;
                });
                if (_globalkey.currentState.validate()) {
                  var imageResponse = await networkHandler.patchImage(
                      "/profile/add/image", _imageFile.path);
                  if (imageResponse.statusCode == 200) {
                    setState(() {
                      circular = false;
                    });
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => HomePage()),
                        (route) => false);
                  }
                } else {
                  setState(() {
                    circular = false;
                  });
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (route) => false);
                }
              },
              child: Center(
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: RaisedButton(
                    color: Colors.blueGrey,
                    onPressed: () {
                      /* Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                home_page1(name: _name.text))); */
                      //   Navigator.push(context,
                      // MaterialPageRoute(builder: (BuildContext context) {
                      // return SignUpPage();
                      // }));
                    },
                    child: circular
                        ? CircularProgressIndicator()
                        : Text(
                            "continue",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundImage: _imageFile == null
              ? AssetImage("assets/profile_baby.jpg")
              : FileImage(File(_imageFile.path)),
        ),
        Positioned(
          bottom: 10.0,
          right: 10.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.blueGrey,
              size: 30.0,
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }

  Widget nameTextField() {
    return TextFormField(
      controller: _name,
      validator: (value) {
        if (value.isEmpty) return "Name can't be empty";

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.black,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            )),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.grey,
        ),
        labelText: "Baby name",
        helperText: "Name can't be empty",
      ),
    );
  }

  // ignore: missing_return

  Widget dobField() {
    return TextFormField(
      controller: _dob,
      validator: (value) {
        if (value.isEmpty) return "DOB can't be empty";

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.teal,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black,
          width: 2,
        )),
        suffixIcon: Icon(
          Icons.date_range,
          color: Colors.grey,
        ),
        labelText: "Date Of Birth",
        helperText: "Provide DOB on dd/mm/yyyy",
        hintText: "01/01/2020",
      ),
    );
  }

  Widget titleTextField() {
    return TextFormField(
      controller: _title,
      validator: (value) {
        if (value.isEmpty) return "Title can't be empty";

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.black,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            )),
        suffixIcon: Icon(
          Icons.calendar_today_rounded,
          color: Colors.grey,
        ),
      ),
    );
  }
}
