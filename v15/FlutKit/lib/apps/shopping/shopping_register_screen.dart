import 'package:flutkit/apps/shopping/shopping_login_screen.dart';
import 'package:flutkit/full_apps/other/shopping/full_app.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';

class ShoppingRegisterScreen extends StatefulWidget {
  @override
  _ShoppingRegisterScreenState createState() => _ShoppingRegisterScreenState();
}

class _ShoppingRegisterScreenState extends State<ShoppingRegisterScreen> {
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
      padding: MySpacing.top(MySpacing.safeAreaTop(context) + 48),
      child: Column(
        children: <Widget>[
          Center(
            child: MyText.headlineSmall("Create an Account", fontWeight: 600),
          ),
          Container(
            margin: EdgeInsets.only(left: 48, right: 48, top: 40),
            child: MyText.bodyLarge(
              "Enter your details to create new your account",
              softWrap: true,
              fontWeight: 600,
              height: 1.2,
              color: theme.colorScheme.onBackground.withAlpha(200),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 24, right: 24, top: 36),
            child: MyContainer.none(
              borderRadiusAll: 4,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    style: MyTextStyle.bodyLarge(
                        fontWeight: 600, letterSpacing: 0.2),
                    decoration: InputDecoration(
                      hintStyle: MyTextStyle.bodyLarge(
                          fontWeight: 600,
                          letterSpacing: 0,
                          color: theme.colorScheme.onBackground.withAlpha(180)),
                      hintText: "Username",
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.all(16),
                    ),
                    autofocus: false,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                  Divider(
                    color: theme.dividerColor,
                    height: 0.5,
                  ),
                  TextFormField(
                    style: MyTextStyle.bodyLarge(
                        fontWeight: 600, letterSpacing: 0.2),
                    decoration: InputDecoration(
                      hintStyle: MyTextStyle.bodyLarge(
                          fontWeight: 600,
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
                  ),
                  Divider(
                    color: theme.dividerColor,
                    height: 0.5,
                  ),
                  TextFormField(
                    style: MyTextStyle.bodyLarge(
                        fontWeight: 600, letterSpacing: 0.2),
                    decoration: InputDecoration(
                      hintStyle: MyTextStyle.bodyLarge(
                          fontWeight: 600,
                          letterSpacing: 0,
                          color: theme.colorScheme.onBackground.withAlpha(180)),
                      hintText: "Your Password",
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.all(16),
                    ),
                    autofocus: false,
                    textCapitalization: TextCapitalization.sentences,
                    obscureText: true,
                  )
                ],
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 24, right: 24, top: 36),
              child: MyButton.block(
                backgroundColor: theme.colorScheme.primary,
                borderRadiusAll: 4,
                padding: MySpacing.y(16),
                elevation: 0,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShoppingFullApp()));
                },
                child: MyText.bodyMedium("CONTINUE",
                    color: theme.colorScheme.onPrimary,
                    letterSpacing: 0.8,
                    fontWeight: 700),
              )),
          Center(
            child: MyButton.text(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShoppingLoginScreen()));
              },
              child: MyText.bodyMedium("I have an account",
                  decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    ));
  }
}
