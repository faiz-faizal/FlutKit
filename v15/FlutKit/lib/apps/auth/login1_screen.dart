/*
* File : Login
* Version : 1.0.0
* */

import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Login1Screen extends StatefulWidget {
  @override
  _Login1ScreenState createState() => _Login1ScreenState();
}

class _Login1ScreenState extends State<Login1Screen> {
  bool _passwordVisible = false;

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
        body: ListView(
      padding: EdgeInsets.all(0),
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 3 / 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: theme.colorScheme.background,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(96))),
              ),
              Positioned(
                top: 30,
                left: 10,
                child: BackButton(
                  color: theme.colorScheme.onBackground,
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 40,
                child: MyText.headlineSmall("LOGIN", fontWeight: 600),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: MyContainer.bordered(
            padding: EdgeInsets.only(top: 12, left: 20, right: 20, bottom: 12),
            child: Column(
              children: <Widget>[
                TextFormField(
                  style: MyTextStyle.bodyLarge(
                      letterSpacing: 0.1,
                      color: theme.colorScheme.onBackground,
                      fontWeight: 500),
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: MyTextStyle.titleSmall(
                        letterSpacing: 0.1,
                        color: theme.colorScheme.onBackground,
                        fontWeight: 500),
                    prefixIcon: Icon(LucideIcons.mail),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    style: MyTextStyle.bodyLarge(
                        letterSpacing: 0.1,
                        color: theme.colorScheme.onBackground,
                        fontWeight: 500),
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: MyTextStyle.titleSmall(
                          letterSpacing: 0.1,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500),
                      prefixIcon: Icon(LucideIcons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(_passwordVisible
                            ? LucideIcons.eye
                            : LucideIcons.eyeOff),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = _passwordVisible;
                          });
                        },
                      ),
                    ),
                    obscureText: _passwordVisible,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.centerRight,
                  child: MyText.bodySmall("Forgot Password ?", fontWeight: 500),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: MyButton(
                      elevation: 0,
                      borderRadiusAll: 4,
                      padding: MySpacing.xy(20, 20),
                      onPressed: () {},
                      child: MyText.labelMedium("LOGIN",
                          fontWeight: 600,
                          color: theme.colorScheme.onPrimary,
                          letterSpacing: 0.5)),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 24),
          child: Center(
            child: MyText.bodyMedium("OR", fontWeight: 500),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MyContainer.rounded(
                  width: 52,
                  height: 52,
                  paddingAll: 0,
                  color: theme.colorScheme.primary,
                  child: Icon(
                    LucideIcons.facebook,
                    color: theme.colorScheme.onPrimary,
                    size: 30,
                  )),
              SizedBox(
                width: 20,
              ),
              MyContainer.rounded(
                  width: 52,
                  height: 52,
                  paddingAll: 0,
                  color: theme.colorScheme.primary,
                  child: Icon(
                    MdiIcons.google,
                    color: theme.colorScheme.onPrimary,
                    size: 30,
                  )),
            ],
          ),
        )
      ],
    ));
  }
}
