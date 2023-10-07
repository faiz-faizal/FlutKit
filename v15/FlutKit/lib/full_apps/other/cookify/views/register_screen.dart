import 'package:flutkit/full_apps/other/cookify/views/forgot_password_screen.dart';
import 'package:flutkit/full_apps/other/cookify/views/full_app.dart';
import 'package:flutkit/full_apps/other/cookify/views/login_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CookifyRegisterScreen extends StatefulWidget {
  @override
  _CookifyRegisterScreenState createState() => _CookifyRegisterScreenState();
}

class _CookifyRegisterScreenState extends State<CookifyRegisterScreen> {
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
    return Theme(
      data: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: customTheme.cookifyPrimary.withAlpha(40))),
      child: Scaffold(
        body: ListView(
          padding: MySpacing.fromLTRB(24, 100, 24, 0),
          children: [
            Icon(
              LucideIcons.menuSquare,
              color: customTheme.cookifyPrimary,
              size: 64,
            ),
            MySpacing.height(16),
            MyText.displaySmall(
              "Create an Account",
              color: customTheme.cookifyPrimary,
              fontWeight: 800,
              textAlign: TextAlign.center,
            ),
            MySpacing.height(32),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                labelText: "Name",
                hintText: "Name",
                labelStyle: MyTextStyle.getStyle(
                  color: customTheme.cookifyPrimary,
                  fontSize: 14,
                  fontWeight: 600,
                ),
                hintStyle: MyTextStyle.getStyle(
                  color: customTheme.cookifyPrimary,
                  fontSize: 14,
                  fontWeight: 600,
                ),
                fillColor: customTheme.cookifyPrimary.withAlpha(40),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide.none),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide.none),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide.none),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide.none),
                contentPadding: MySpacing.all(16),
                prefixIcon: Icon(
                  LucideIcons.user,
                  size: 20,
                ),
                prefixIconColor: customTheme.cookifyPrimary,
                focusColor: customTheme.cookifyPrimary,
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              cursorColor: customTheme.cookifyPrimary,
            ),
            MySpacing.height(24),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                labelText: "Email Address",
                hintText: "Email Address",
                labelStyle: MyTextStyle.getStyle(
                  color: customTheme.cookifyPrimary,
                  fontSize: 14,
                  fontWeight: 600,
                ),
                hintStyle: MyTextStyle.getStyle(
                  color: customTheme.cookifyPrimary,
                  fontSize: 14,
                  fontWeight: 600,
                ),
                fillColor: customTheme.cookifyPrimary.withAlpha(40),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide.none),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide.none),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide.none),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide.none),
                contentPadding: MySpacing.all(16),
                prefixIcon: Icon(
                  LucideIcons.mail,
                  size: 20,
                ),
                prefixIconColor: customTheme.cookifyPrimary,
                focusColor: customTheme.cookifyPrimary,
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              cursorColor: customTheme.cookifyPrimary,
            ),
            MySpacing.height(24),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                labelText: "Password",
                hintText: "Password",
                labelStyle: MyTextStyle.getStyle(
                  color: customTheme.cookifyPrimary,
                  fontSize: 14,
                  fontWeight: 600,
                ),
                hintStyle: MyTextStyle.getStyle(
                  color: customTheme.cookifyPrimary,
                  fontSize: 14,
                  fontWeight: 600,
                ),
                fillColor: customTheme.cookifyPrimary.withAlpha(40),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide.none),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide.none),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide.none),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide.none),
                contentPadding: MySpacing.all(16),
                prefixIcon: Icon(
                  LucideIcons.lock,
                  size: 20,
                ),
                prefixIconColor: customTheme.cookifyPrimary,
                focusColor: customTheme.cookifyPrimary,
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              cursorColor: customTheme.cookifyPrimary,
            ),
            MySpacing.height(16),
            Align(
              alignment: Alignment.centerRight,
              child: MyButton.text(
                  padding: MySpacing.zero,
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                          builder: (context) => CookifyForgotPasswordScreen()),
                    );
                  },
                  splashColor: customTheme.cookifyPrimary.withAlpha(40),
                  child: MyText.bodySmall("Forgot Password?",
                      color: customTheme.cookifyPrimary)),
            ),
            MySpacing.height(16),
            MyButton.block(
                borderRadiusAll: 8,
                elevation: 0,
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(builder: (context) => CookifyFullApp()),
                  );
                },
                padding: MySpacing.y(20),
                backgroundColor: customTheme.cookifyPrimary,
                child: MyText.labelLarge(
                  "Create an Account",
                  color: customTheme.cookifyOnPrimary,
                )),
            MySpacing.height(16),
            MyButton.text(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                        builder: (context) => CookifyLoginScreen()),
                  );
                },
                splashColor: customTheme.cookifyPrimary.withAlpha(40),
                child: MyText.labelMedium("I have already an account",
                    decoration: TextDecoration.underline,
                    color: customTheme.cookifyPrimary)),
            MySpacing.height(16),
          ],
        ),
      ),
    );
  }
}
