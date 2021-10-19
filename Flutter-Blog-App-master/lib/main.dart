// ignore_for_file: unused_import

import 'package:blogapp/Pages/Home.dart';
import 'package:blogapp/Pages/HomePage.dart';
import 'package:blogapp/Pages/comment.dart';
import 'package:blogapp/Pages/login2.dart';
import 'package:blogapp/group.dart';

// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'package:blogapp/welcom';
import 'package:blogapp/Pages/login-page.dart';

// ignore: unused_import
import 'Blog/addBlog.dart';
import 'Pages/login-page.dart';
import 'Profile/CreatProfile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter LoginPage',
      theme: ThemeData(
        textTheme:
            GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CreatProfile(),
    );
  }
}
