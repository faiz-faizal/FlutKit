import 'package:flutkit/full_apps/other/homemade/controllers/forgot_password_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;
  late ForgotPasswordController forgotPasswordController;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    forgotPasswordController = ForgotPasswordController();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(
        init: forgotPasswordController,
        tag: 'forgot_password_controller',
        builder: (forgotPasswordController) {
          return Scaffold(
            body: ListView(
              padding: MySpacing.fromLTRB(24, 44, 24, 0),
              children: [
                MyText.displaySmall(
                  'Oops! \nForgot Password?',
                  color: customTheme.homemadePrimary,
                  fontWeight: 700,
                ),
                MySpacing.height(150),
                Padding(
                  padding: MySpacing.horizontal(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          filled: true,
                          fillColor: customTheme.homemadePrimary.withAlpha(50),
                          hintText: "Email Address",
                          hintStyle: MyTextStyle.bodyMedium(
                            color: customTheme.homemadePrimary,
                          ),
                          prefixIcon: Icon(
                            LucideIcons.mail,
                            color: customTheme.homemadePrimary,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: MySpacing.all(16),
                        ),
                        cursorColor: customTheme.homemadePrimary,
                      ),
                      MySpacing.height(24),
                      MyButton.block(
                        elevation: 0,
                        borderRadiusAll: 8,
                        onPressed: () {
                          forgotPasswordController.forgotPassword();
                        },
                        backgroundColor: customTheme.homemadePrimary,
                        child: MyText.titleMedium(
                          "Forgot Password",
                          fontWeight: 700,
                          color: customTheme.homemadeOnPrimary,
                          letterSpacing: 0.4,
                        ),
                      ),
                      MySpacing.height(16),
                      Center(
                        child: MyButton.text(
                          onPressed: () {
                            forgotPasswordController.goToRegister();
                          },
                          splashColor:
                              customTheme.homemadePrimary.withAlpha(40),
                          child: MyText.bodySmall("I haven't an account",
                              decoration: TextDecoration.underline,
                              color: customTheme.homemadePrimary),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
