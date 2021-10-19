import 'package:flutter/material.dart';
//import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:blogapp/Screens/Signup/components/background.dart';
import 'package:blogapp/Screens/Signup/components/or_divider.dart';
import 'package:blogapp/Screens/Signup/components/social_icon.dart';
import 'package:blogapp/components/already_have_an_account_acheck.dart';
import 'package:blogapp/components/rounded_button.dart';
import 'package:blogapp/components/rounded_input_field.dart';
import 'package:blogapp/components/rounded_password_field.dart';
import 'package:blogapp/welcom';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/signupp.jpg"),

            /* SvgPicture.asset(
              "assets/icons/signupp.svg",
              height: size.height * 0.25,
            ),*/

            RoundedInputField(
              hintText: "Your Name",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {},
            ),
            SizedBox(height: size.height * 0.0002),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MyHomePage();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
