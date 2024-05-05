import 'package:aliza_ecommerce/constants.dart';
import 'package:aliza_ecommerce/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'profile_menu.dart';

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(getProportionateScreenHeight(3)),
        child: AppBar(
          backgroundColor: kPrimaryColor,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              //child:
              radius: 70,
              backgroundImage:AssetImage('assets/images/profile.jpg'),
            ),
            SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              icon: "assets/images/userr.png",
              press: () => {},
            ),
            ProfileMenu(
              text: "Notifications",
              icon: "assets/images/notification-bell.png",
              press: () {},
            ),
            ProfileMenu(
              text: "Settings",
              icon: "assets/images/settings.png",
              press: () {},
            ),
            ProfileMenu(
              text: "Help Center",
              icon: "assets/images/help-call.png",
              press: () {},
            ),
            ProfileMenu(
              text: "Log Out",
              icon: "assets/images/log-out.png",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}