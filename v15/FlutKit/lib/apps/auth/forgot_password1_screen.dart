/*
* File : Forgot Password
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

class ForgotPassword1Screen extends StatefulWidget {
  @override
  _ForgotPassword1ScreenState createState() => _ForgotPassword1ScreenState();
}

class _ForgotPassword1ScreenState extends State<ForgotPassword1Screen> {
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
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 3 / 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: theme.colorScheme.background,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(48))),
              ),
              Positioned(
                top: MySpacing.safeAreaTop(context) + 12,
                left: 16,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    LucideIcons.chevronLeft,
                    color: theme.colorScheme.onBackground,
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: MyText.headlineSmall("FORGOT PASSWORD", fontWeight: 600),
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            child: MyContainer.bordered(
              margin: MySpacing.all(20),
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
                    child: MyButton(
                        elevation: 0,
                        borderRadiusAll: 4,
                        onPressed: () {},
                        padding: MySpacing.xy(16, 20),
                        child: MyText.labelMedium("RESET PASSWORD",
                            fontWeight: 600,
                            color: theme.colorScheme.onPrimary,
                            letterSpacing: 0.5)),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
