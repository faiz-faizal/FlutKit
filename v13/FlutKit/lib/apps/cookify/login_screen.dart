import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import 'forgot_password_screen.dart';
import 'full_app.dart';
import 'register_screen.dart';

class CookifyLoginScreen extends StatefulWidget {
  @override
  _CookifyLoginScreenState createState() => _CookifyLoginScreenState();
}

class _CookifyLoginScreenState extends State<CookifyLoginScreen> {
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
          padding: FxSpacing.fromLTRB(24, 100, 24, 0),
          children: [
            FxTwoToneIcon(
              FxTwoToneMdiIcons.menu_book,
              color: customTheme.cookifyPrimary,
              size: 64,
            ),
            FxSpacing.height(16),
            Center(
              child: FxText.headlineSmall("Log In",
                  color: customTheme.cookifyPrimary, fontWeight: 800),
            ),
            FxSpacing.height(32),
            FxTextField(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              autoFocusedBorder: true,
              textFieldStyle: FxTextFieldStyle.outlined,
              textFieldType: FxTextFieldType.email,
              filled: true,
              fillColor: customTheme.cookifyPrimary.withAlpha(40),
              enabledBorderColor: customTheme.cookifyPrimary,
              focusedBorderColor: customTheme.cookifyPrimary,
              prefixIconColor: customTheme.cookifyPrimary,
              labelTextColor: customTheme.cookifyPrimary,
              cursorColor: customTheme.cookifyPrimary,
            ),
            FxSpacing.height(24),
            FxTextField(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              autoFocusedBorder: true,
              textFieldStyle: FxTextFieldStyle.outlined,
              textFieldType: FxTextFieldType.password,
              filled: true,
              fillColor: customTheme.cookifyPrimary.withAlpha(40),
              enabledBorderColor: customTheme.cookifyPrimary,
              focusedBorderColor: customTheme.cookifyPrimary,
              prefixIconColor: customTheme.cookifyPrimary,
              labelTextColor: customTheme.cookifyPrimary,
              cursorColor: customTheme.cookifyPrimary,
            ),
            FxSpacing.height(16),
            Align(
              alignment: Alignment.centerRight,
              child: FxButton.text(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                          builder: (context) => CookifyForgotPasswordScreen()),
                    );
                  },
                  padding: FxSpacing.zero,
                  splashColor: customTheme.cookifyPrimary.withAlpha(40),
                  child: FxText.labelMedium("Forgot Password?",
                      color: customTheme.cookifyPrimary)),
            ),
            FxSpacing.height(16),
            FxButton.block(
                borderRadiusAll: 8,
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(builder: (context) => CookifyFullApp()),
                  );
                },
                backgroundColor: customTheme.cookifyPrimary,
                child: FxText.labelLarge(
                  "Log In",
                  color: customTheme.cookifyOnPrimary,
                )),
            FxSpacing.height(16),
            FxButton.text(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                        builder: (context) => CookifyRegisterScreen()),
                  );
                },
                splashColor: customTheme.cookifyPrimary.withAlpha(40),
                child: FxText.labelMedium("I haven't an account",
                    decoration: TextDecoration.underline,
                    color: customTheme.cookifyPrimary))
          ],
        ),
      ),
    );
  }
}
