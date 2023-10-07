import 'package:flutkit/full_apps/m3/homemade/controllers/login_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
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
  late LogInController logInController;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.homemadeTheme;
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
                  color: theme.colorScheme.primary,
                  fontWeight: 700,
                ),
                MySpacing.height(80),
                Padding(
                  padding: MySpacing.horizontal(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          labelText: "Email Address",
                          hintText: "Email Address",
                          labelStyle: MyTextStyle.getStyle(
                            color: theme.colorScheme.primary,
                            fontSize: 14,
                            fontWeight: 600,
                          ),
                          hintStyle: MyTextStyle.getStyle(
                            color: theme.colorScheme.primary,
                            fontSize: 14,
                            fontWeight: 600,
                          ),
                          fillColor: theme.colorScheme.primaryContainer,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(24),
                              ),
                              borderSide: BorderSide.none),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(24),
                              ),
                              borderSide: BorderSide.none),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(24),
                              ),
                              borderSide: BorderSide.none),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(24),
                              ),
                              borderSide: BorderSide.none),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(24),
                              ),
                              borderSide: BorderSide.none),
                          contentPadding: MySpacing.all(16),
                          prefixIcon: Icon(
                            LucideIcons.mail,
                            size: 20,
                          ),
                          prefixIconColor: theme.colorScheme.primary,
                          focusColor: theme.colorScheme.primary,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                        cursorColor: theme.colorScheme.primary,
                        autofocus: true,
                      ),
                      MySpacing.height(24),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          labelText: "Password",
                          hintText: "Password",
                          labelStyle: MyTextStyle.getStyle(
                            color: theme.colorScheme.primary,
                            fontSize: 14,
                            fontWeight: 600,
                          ),
                          hintStyle: MyTextStyle.getStyle(
                            color: theme.colorScheme.primary,
                            fontSize: 14,
                            fontWeight: 600,
                          ),
                          fillColor: theme.colorScheme.primaryContainer,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(24),
                              ),
                              borderSide: BorderSide.none),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(24),
                              ),
                              borderSide: BorderSide.none),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(24),
                              ),
                              borderSide: BorderSide.none),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(24),
                              ),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(24),
                              ),
                              borderSide: BorderSide.none),
                          contentPadding: MySpacing.all(16),
                          prefixIcon: Icon(
                            LucideIcons.lock,
                            size: 20,
                          ),
                          prefixIconColor: theme.colorScheme.primary,
                          focusColor: theme.colorScheme.primary,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                        cursorColor: theme.colorScheme.primary,
                        autofocus: true,
                      ),
                      MySpacing.height(16),
                      Align(
                        alignment: Alignment.centerRight,
                        child: MyButton.text(
                          onPressed: () {
                            logInController.goToForgotPassword();
                          },
                          padding: MySpacing.y(4),
                          splashColor: theme.colorScheme.primaryContainer,
                          child: MyText.bodySmall("Forgot Password?",
                              color: theme.colorScheme.primary),
                        ),
                      ),
                      MySpacing.height(16),
                      MyButton.block(
                        elevation: 0,
                        borderRadiusAll: Constant.buttonRadius.large,
                        onPressed: () {
                          logInController.login();
                        },
                        padding: MySpacing.y(20),
                        backgroundColor: theme.colorScheme.primary,
                        splashColor: theme.colorScheme.primaryContainer,
                        child: MyText.bodyMedium(
                          "Log In",
                          fontWeight: 700,
                          color: theme.colorScheme.onPrimary,
                          letterSpacing: 0.4,
                        ),
                      ),
                      MySpacing.height(16),
                      Center(
                        child: MyButton.text(
                          onPressed: () {
                            logInController.goToRegister();
                          },
                          splashColor: theme.colorScheme.primaryContainer,
                          child: MyText.bodySmall("I haven't an account",
                              decoration: TextDecoration.underline,
                              color: theme.colorScheme.primary),
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
