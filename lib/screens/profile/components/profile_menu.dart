import 'package:flutter/material.dart';
import '../../../constants.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text;
  final icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: kPrimaryColor,
          padding: EdgeInsets.all(20),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            Image.asset(icon,width: 25,),
            SizedBox(width: 40),
            Expanded(child: Text(text,style: TextStyle(color: kPrimaryColor,fontSize: 18),)),
            Icon(Icons.arrow_forward_ios,color: Colors.blue,size: 25,),
          ],
        ),
      ),
    );
  }
}