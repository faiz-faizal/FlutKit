import 'package:flutkit/full_apps/other/medicare/forgot_password_screen.dart';
import 'package:flutkit/full_apps/other/medicare/full_app.dart';
import 'package:flutkit/full_apps/other/medicare/registration_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class MediCareLoginScreen extends StatefulWidget {
  @override
  _MediCareLoginScreenState createState() => _MediCareLoginScreenState();
}

class _MediCareLoginScreenState extends State<MediCareLoginScreen> {
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
    return Scaffold(
      body: Center(
        child: Padding(
          padding: MySpacing.horizontal(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  labelText: "Email Address",
                  hintText: "Email Address",
                  labelStyle: MyTextStyle.getStyle(
                    color: customTheme.medicarePrimary,
                    fontSize: 14,
                    fontWeight: 600,
                  ),
                  hintStyle: MyTextStyle.getStyle(
                    color: customTheme.medicarePrimary,
                    fontSize: 14,
                    fontWeight: 600,
                  ),
                  fillColor: customTheme.medicarePrimary.withAlpha(50),
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
                  prefixIconColor: customTheme.medicarePrimary,
                  focusColor: customTheme.medicarePrimary,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
                cursorColor: customTheme.medicarePrimary,
                autofocus: true,
              ),
              MySpacing.height(24),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  labelText: "Password",
                  hintText: "Password",
                  labelStyle: MyTextStyle.getStyle(
                    color: customTheme.medicarePrimary,
                    fontSize: 14,
                    fontWeight: 600,
                  ),
                  hintStyle: MyTextStyle.getStyle(
                    color: customTheme.medicarePrimary,
                    fontSize: 14,
                    fontWeight: 600,
                  ),
                  fillColor: customTheme.medicarePrimary.withAlpha(50),
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
                  prefixIconColor: customTheme.medicarePrimary,
                  focusColor: customTheme.medicarePrimary,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
                cursorColor: customTheme.medicarePrimary,
                autofocus: true,
              ),
              MySpacing.height(16),
              Align(
                alignment: Alignment.centerRight,
                child: MyButton.text(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                MediCareForgotPasswordScreen()),
                      );
                    },
                    splashColor: customTheme.medicarePrimary.withAlpha(40),
                    child: MyText.bodySmall("Forgot Password?",
                        color: customTheme.medicarePrimary)),
              ),
              MySpacing.height(16),
              MyButton.block(
                borderRadiusAll: 8,
                elevation: 0,
                padding: MySpacing.y(20),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(builder: (context) => MediCareFullApp()),
                  );
                },
                backgroundColor: customTheme.medicarePrimary,
                child: MyText.labelMedium(
                  "LOG IN",
                  fontWeight: 700,
                  color: customTheme.medicareOnPrimary,
                  letterSpacing: 0.4,
                ),
              ),
              MySpacing.height(16),
              MyButton.text(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                        builder: (context) => MediCareRegistrationScreen()),
                  );
                },
                splashColor: customTheme.medicarePrimary.withAlpha(40),
                child: MyText.bodySmall("I haven't an account",
                    decoration: TextDecoration.underline,
                    color: customTheme.medicarePrimary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
