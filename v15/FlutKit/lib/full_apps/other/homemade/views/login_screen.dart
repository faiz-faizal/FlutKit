import 'package:flutkit/full_apps/other/homemade/controllers/login_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;
  late LogInController logInController;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    logInController = LogInController();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LogInController>(
        init: logInController,
        tag: 'log_in_controller',
        builder: (logInController) {
          return Scaffold(
            body: ListView(
              padding: MySpacing.fromLTRB(24, 44, 24, 0),
              children: [
                MyText.displaySmall(
                  'Hello !\nWelcome to homemade App',
                  color: customTheme.homemadePrimary,
                  fontWeight: 700,
                ),
                MySpacing.height(80),
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
                            size: 20,
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
                      TextField(
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          filled: true,
                          fillColor: customTheme.homemadePrimary.withAlpha(50),
                          hintText: "Password",
                          hintStyle: MyTextStyle.bodyMedium(
                            color: customTheme.homemadePrimary,
                          ),
                          prefixIcon: Icon(
                            LucideIcons.lock,
                            size: 20,
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
                      MySpacing.height(16),
                      Align(
                        alignment: Alignment.centerRight,
                        child: MyButton.text(
                            onPressed: () {
                              logInController.goToForgotPassword();
                            },
                            padding: MySpacing.y(4),
                            splashColor:
                                customTheme.homemadePrimary.withAlpha(40),
                            child: MyText.bodySmall("Forgot Password?",
                                color: customTheme.homemadePrimary)),
                      ),
                      MySpacing.height(16),
                      MyButton.block(
                        elevation: 0,
                        borderRadiusAll: 8,
                        onPressed: () {
                          logInController.login();
                        },
                        backgroundColor: customTheme.homemadePrimary,
                        child: MyText.bodyMedium(
                          "LOG IN",
                          fontWeight: 700,
                          color: customTheme.homemadeOnPrimary,
                          letterSpacing: 0.4,
                        ),
                      ),
                      MySpacing.height(16),
                      Center(
                        child: MyButton.text(
                          onPressed: () {
                            logInController.goToRegister();
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
