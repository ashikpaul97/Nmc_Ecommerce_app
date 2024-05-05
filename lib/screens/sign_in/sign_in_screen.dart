import 'package:flutter/material.dart';

import 'components/signin_body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        title: Text("Sign In"),
      ),
      body: SignInBody(),
    );
  }
}