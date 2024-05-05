import 'package:flutter/material.dart';
import 'components/completeprofile_body.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routeName = "/complete_profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: CompleteProfileBody(),
    );
  }
}