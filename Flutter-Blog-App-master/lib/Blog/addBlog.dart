import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:blogapp/CustumWidget/OverlayCard.dart';
import 'package:blogapp/Model/addBlogModels.dart';
import 'package:blogapp/NetworkHandler.dart';
import 'package:blogapp/Pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddBlog extends StatefulWidget {
  AddBlog({Key key}) : super(key: key);

  @override
  _AddBlogState createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  final _globalkey = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();

  final _picker = ImagePicker();
  File image;
  IconData iconphoto = Icons.image;
  //NetworkHandler networkHandler = NetworkHandler();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.clear,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: <Widget>[
          // ignore: deprecated_member_use
        ],
      ),
      body: Form(
        key: _globalkey,
        child: ListView(
          children: <Widget>[
            titleTextField(),
            photoicon(),
            button(),
            SizedBox(
              height: 20,
            ),
            Container(
              child:
                  image == null ? Text('No image Selected') : Image.file(image),
            )
          ],
        ),
      ),
    );
  }

  Widget titleTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: TextFormField(
        controller: title,
        validator: (value) {
          if (value.isEmpty) {
            return "Title can't be empty";
          } else if (value.length > 100) {
            return "Title length should be <=100";
          }
          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            ),
          ),
          labelText: "Add Image and Title",
        ),
        maxLength: 100,
        maxLines: null,
      ),
    );
  }

  Widget photoicon() {
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: IconButton(
            icon: Icon(
              iconphoto,
              color: Colors.teal,
            ),
            onPressed: takeCoverPhoto));
  }

  Widget button() {
    var circular = false;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Center(
        child: Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: FlatButton(
              onPressed: addButton,
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
    );
  }

  Future addButton() async {
    final uri = Uri.parse("http://172.20.10.4/htdocs/Hi_Baby/upload.php");
    var request = (await http.MultipartRequest('POST', uri));
    request.fields['title'] = title.text;
    // myrequest.fields['body'] = body.text;
    var pic = await http.MultipartFile.fromPath("image", image.path);
    request.files.add(pic);
    var response = (await request.send());
    if (response.statusCode == 200) {
      print('image uploded');
    } else {
      print('image not uploded');
    }
  }

  Future takeCoverPhoto() async {
    final coverPhoto = await _picker.getImage(source: ImageSource.gallery);
    //final coverPhoto2 = await _picker.getImage(source: ImageSource.camera);
    setState(() {
      image = File(coverPhoto.path);
      // _imageFile = File(coverPhoto2.path);

      // iconphoto = Icons.check_box;
    });
  }
}
