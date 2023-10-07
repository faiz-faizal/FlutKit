import 'package:flutkit/full_apps/other/cookify/views/full_app.dart';
import 'package:flutkit/full_apps/other/cookify/views/register_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CookifyForgotPasswordScreen extends StatefulWidget {
  @override
  _CookifyForgotPasswordScreenState createState() =>
      _CookifyForgotPasswordScreenState();
}

class _CookifyForgotPasswordScreenState
    extends State<CookifyForgotPasswordScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: customTheme.cookifyPrimary.withAlpha(40))),
      child: Scaffold(
        body: ListView(
          padding: MySpacing.fromLTRB(24, 200, 24, 0),
          children: [
            Icon(
              LucideIcons.menuSquare,
              color: customTheme.cookifyPrimary,
              size: 64,
            ),
            MySpacing.height(16),
            MyText.headlineSmall(
              "Forgot Password",
              color: customTheme.cookifyPrimary,
              fontWeight: 800,
              textAlign: TextAlign.center,
            ),
            MySpacing.height(32),
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
              autofocus: true,
            ),
            MySpacing.height(32),
            MyButton.block(
                elevation: 0,
                borderRadiusAll: 8,
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(builder: (context) => CookifyFullApp()),
                  );
                },
                padding: MySpacing.y(20),
                backgroundColor: customTheme.cookifyPrimary,
                child: MyText.labelLarge(
                  "Forgot Password",
                  color: customTheme.cookifyOnPrimary,
                )),
            MySpacing.height(16),
            MyButton.text(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                        builder: (context) => CookifyRegisterScreen()),
                  );
                },
                splashColor: customTheme.cookifyPrimary.withAlpha(40),
                child: MyText.bodySmall("I haven't an account",
                    decoration: TextDecoration.underline,
                    color: customTheme.cookifyPrimary))
          ],
        ),
      ),
    );
  }
}
