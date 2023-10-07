import 'package:flutkit/full_apps/other/medicare/full_app.dart';
import 'package:flutkit/full_apps/other/medicare/registration_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class MediCareForgotPasswordScreen extends StatefulWidget {
  @override
  _MediCareForgotPasswordScreenState createState() =>
      _MediCareForgotPasswordScreenState();
}

class _MediCareForgotPasswordScreenState
    extends State<MediCareForgotPasswordScreen> {
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
      body: Padding(
        padding: MySpacing.horizontal(24),
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
            MySpacing.height(32),
            MyButton.block(
                elevation: 0,
                borderRadiusAll: 8,
                padding: MySpacing.y(20),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(builder: (context) => MediCareFullApp()),
                  );
                },
                backgroundColor: customTheme.medicarePrimary,
                child: MyText.bodyLarge(
                  "Forgot Password",
                  color: customTheme.medicareOnPrimary,
                  fontWeight: 600,
                  letterSpacing: 0.3,
                )),
            MySpacing.height(16),
            MyButton.text(
                elevation: 0,
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                        builder: (context) => MediCareRegistrationScreen()),
                  );
                },
                splashColor: customTheme.medicarePrimary.withAlpha(40),
                child: MyText.bodySmall("I haven't an account",
                    decoration: TextDecoration.underline,
                    color: customTheme.medicarePrimary))
          ],
        ),
      ),
    );
  }
}
