/*
* File : Shopping Login
* Version : 1.0.0
* */

import 'package:flutkit/apps/shopping/shopping_password_screen.dart';
import 'package:flutkit/apps/shopping/shopping_register_screen.dart';
import 'package:flutkit/full_apps/other/shopping/full_app.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';

class ShoppingLoginScreen extends StatefulWidget {
  @override
  _ShoppingLoginScreenState createState() => _ShoppingLoginScreenState();
}

class _ShoppingLoginScreenState extends State<ShoppingLoginScreen> {
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
      margin: MySpacing.top(MySpacing.safeAreaTop(context) + 48),
      child: Column(
        children: <Widget>[
          Center(
            child: MyText.headlineSmall("Log In", fontWeight: 700),
          ),
          Container(
            margin: EdgeInsets.only(left: 48, right: 48, top: 40),
            child: MyText.bodyLarge(
              "Enter your login details to access your account",
              softWrap: true,
              fontWeight: 500,
              height: 1.2,
              color: theme.colorScheme.onBackground.withAlpha(200),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 24, right: 24, top: 36),
            child: MyContainer(
              paddingAll: 0,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    style: MyTextStyle.bodyLarge(
                        fontWeight: 600, letterSpacing: 0.2),
                    decoration: InputDecoration(
                      hintStyle: MyTextStyle.bodyLarge(
                          fontWeight: 500,
                          letterSpacing: 0,
                          color: theme.colorScheme.onBackground.withAlpha(180)),
                      hintText: "Email Address",
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.all(16),
                    ),
                    autofocus: false,
                    keyboardType: TextInputType.emailAddress,
                    controller: TextEditingController(text: "denio@gmail.com"),
                  ),
                  Divider(
                    color: theme.dividerColor,
                    height: 0.5,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          style: MyTextStyle.bodyLarge(
                              fontWeight: 600, letterSpacing: 0.2),
                          decoration: InputDecoration(
                            hintStyle: MyTextStyle.bodyLarge(
                                fontWeight: 500,
                                letterSpacing: 0,
                                color: theme.colorScheme.onBackground
                                    .withAlpha(180)),
                            hintText: "Your Password",
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.all(16),
                          ),
                          autofocus: false,
                          textInputAction: TextInputAction.search,
                          textCapitalization: TextCapitalization.sentences,
                          obscureText: true,
                        ),
                      ),
                      MyButton.text(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ShoppingPasswordScreen()));
                          },
                          child: MyText.bodyMedium("FORGOT",
                              letterSpacing: 0.5,
                              color:
                                  theme.colorScheme.onBackground.withAlpha(140),
                              fontWeight: 700))
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 24, right: 24, top: 36),
              child: MyButton(
                  elevation: 0,
                  padding: MySpacing.y(20),
                  borderRadiusAll: 4,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShoppingFullApp()));
                  },
                  child: Center(
                    child: MyText.bodyMedium("CONTINUE",
                        color: theme.colorScheme.onPrimary,
                        letterSpacing: 0.8,
                        fontWeight: 700),
                  ))),
          MySpacing.height(16),
          Center(
            child: MyButton.text(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShoppingRegisterScreen()));
              },
              child: MyText.bodyMedium("I haven't an account",
                  decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    ));
  }
}
