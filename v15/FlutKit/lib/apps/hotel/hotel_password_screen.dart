/*
* File : Hotel Forgot Password
* Version : 1.0.0
* */

import 'package:flutkit/apps/hotel/hotel_full_app.dart';
import 'package:flutkit/apps/hotel/hotel_register_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HotelPasswordScreen extends StatefulWidget {
  @override
  _HotelPasswordScreenState createState() => _HotelPasswordScreenState();
}

class _HotelPasswordScreenState extends State<HotelPasswordScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Center(
              child: MyText.titleLarge("Forgot Password?", fontWeight: 600),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: TextFormField(
                style: MyTextStyle.bodyLarge(
                    letterSpacing: 0.1,
                    color: theme.colorScheme.onBackground,
                    fontWeight: 500),
                decoration: InputDecoration(
                  hintText: "Email address",
                  hintStyle: MyTextStyle.titleSmall(
                      letterSpacing: 0.1,
                      color: theme.colorScheme.onBackground,
                      fontWeight: 500),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide.none),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: customTheme.card,
                  prefixIcon: Icon(
                    LucideIcons.mail,
                    size: 22,
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.all(0),
                ),
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.sentences,
              ),
            ),
            MySpacing.height(20),
            MyButton(
              elevation: 0,
              borderRadiusAll: 4,
              padding: MySpacing.y(20),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HotelFullApp()));
              },
              child: MyText.bodyMedium("Reset Password",
                  color: theme.colorScheme.onPrimary,
                  letterSpacing: 0.5,
                  fontWeight: 600),
            ),
            MySpacing.height(20),
            Center(
              child: MyButton.text(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HotelRegisterScreen()));
                },
                child: MyText.bodyMedium(
                  "I haven't an account",
                  decoration: TextDecoration.underline,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
