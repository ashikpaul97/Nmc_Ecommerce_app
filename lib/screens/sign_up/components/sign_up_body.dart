import 'package:flutter/material.dart';
import 'package:aliza_ecommerce/constants.dart';
import 'package:aliza_ecommerce/size_config.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'sign_up_form.dart';

class SignUpBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                Text("Register Account", style: headingStyle),
                Text(
                  "Complete your details or continue \nwith social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignUpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlutterSocialButton(
                      onTap: () {},
                      mini: true,
                      buttonType: ButtonType.whatsapp,
                    ),
                    FlutterSocialButton(
                      onTap: () {},
                      mini: true,
                      buttonType: ButtonType.facebook,
                    ),
                    FlutterSocialButton(
                      onTap: () {},
                      mini: true,
                      buttonType: ButtonType.google,
                    ),
                    FlutterSocialButton(
                      onTap: () {},
                      mini: true,
                      buttonType: ButtonType.phone,
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  'By continuing your confirm that you agree \nwith our Term and Condition',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}