/*
* File : Music Register
* Version : 1.0.0
* */

import 'package:flutkit/apps/music/music_full_app.dart';
import 'package:flutkit/apps/music/music_login_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MusicRegisterScreen extends StatefulWidget {
  @override
  _MusicRegisterScreenState createState() => _MusicRegisterScreenState();
}

class _MusicRegisterScreenState extends State<MusicRegisterScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: Container(
          padding: EdgeInsets.only(left: 24, right: 24),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                MyText.headlineSmall("Sign up",
                    fontWeight: 600, letterSpacing: 0),
                Container(
                  margin: EdgeInsets.only(top: 32),
                  child: TextFormField(
                    style: MyTextStyle.bodyLarge(
                        letterSpacing: 0.1,
                        color: theme.colorScheme.onBackground,
                        fontWeight: 500),
                    decoration: InputDecoration(
                      hintText: "Username",
                      hintStyle: MyTextStyle.bodyLarge(
                          letterSpacing: 0.1,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide: BorderSide(
                              color: customTheme.border, width: 1.2)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide: BorderSide(
                              color: customTheme.border, width: 1.2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide: BorderSide(
                              color: customTheme.border, width: 1.2)),
                      prefixIcon: Icon(
                        LucideIcons.user,
                        size: 22,
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.all(0),
                    ),
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
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
                            Radius.circular(8.0),
                          ),
                          borderSide: BorderSide(
                              color: customTheme.border, width: 1.2)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide: BorderSide(
                              color: customTheme.border, width: 1.2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide: BorderSide(
                              color: customTheme.border, width: 1.2)),
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
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: TextFormField(
                    obscureText: _passwordVisible,
                    style: MyTextStyle.bodyLarge(
                        letterSpacing: 0.1,
                        color: theme.colorScheme.onBackground,
                        fontWeight: 500),
                    decoration: InputDecoration(
                      hintStyle: MyTextStyle.titleSmall(
                          letterSpacing: 0.1,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500),
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide: BorderSide(
                              color: customTheme.border, width: 1.2)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide: BorderSide(
                              color: customTheme.border, width: 1.2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide: BorderSide(
                              color: customTheme.border, width: 1.2)),
                      prefixIcon: Icon(
                        LucideIcons.lock,
                        size: 22,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        child: Icon(
                          _passwordVisible
                              ? LucideIcons.eye
                              : LucideIcons.eyeOff,
                          size: 22,
                        ),
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.all(0),
                    ),
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 24),
                  child: Row(
                    children: <Widget>[
                      ClipOval(
                        child: Material(
                          color: Color(0xffe33239),
                          child: InkWell(
                            splashColor: Colors.white.withAlpha(100),
                            highlightColor: theme.colorScheme.primary,
                            // inkwell color
                            child: SizedBox(
                                width: 36,
                                height: 36,
                                child: Icon(MdiIcons.google,
                                    color: Colors.white, size: 20)),
                            onTap: () {},
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16),
                        child: ClipOval(
                          child: Material(
                            color: Color(0xff335994),
                            child: InkWell(
                              splashColor: Colors.white.withAlpha(100),
                              highlightColor: theme.colorScheme.primary,
                              // inkwell color
                              child: SizedBox(
                                  width: 36,
                                  height: 36,
                                  child: Center(
                                      child: MyText.titleLarge("F",
                                          color: Colors.white,
                                          letterSpacing: 0))),
                              onTap: () {},
                            ),
                          ),
                        ),
                      ),
                      MySpacing.width(32),
                      Expanded(
                        child: MyButton(
                          elevation: 0,
                          borderRadiusAll: 4,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MusicFullApp()));
                          },
                          padding: MySpacing.y(20),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              MyText.bodyMedium("CREATE",
                                  fontWeight: 700,
                                  color: theme.colorScheme.onPrimary,
                                  letterSpacing: 0.5),
                              Container(
                                margin: EdgeInsets.only(left: 16),
                                child: Icon(
                                  LucideIcons.arrowRight,
                                  color: theme.colorScheme.onPrimary,
                                  size: 18,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MusicLoginScreen()));
                      },
                      child: MyText.bodyMedium("I haven't an account",
                          color: theme.colorScheme.primary,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
