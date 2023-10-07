import 'package:flutkit/full_apps/m3/homemade/controllers/register_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late ThemeData theme;
  late RegisterController registerController;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.homemadeTheme;
    registerController = RegisterController();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
        init: registerController,
        tag: 'register_controller',
        builder: (registerController) {
          return Scaffold(
            body: ListView(
              padding: MySpacing.fromLTRB(24, 44, 24, 0),
              children: [
                MyText.displaySmall(
                  'Hey !\nSignup to get started',
                  color: theme.colorScheme.primary,
                  fontWeight: 700,
                ),
                MySpacing.height(60),
                Padding(
                  padding: MySpacing.horizontal(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          labelText: "Name",
                          hintText: "Name",
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
                          contentPadding: MySpacing.all(16),
                          prefixIcon: Icon(
                            LucideIcons.user,
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
                      MySpacing.height(32),
                      MyButton.block(
                        elevation: 0,
                        borderRadiusAll: Constant.buttonRadius.large,
                        onPressed: () {
                          registerController.register();
                        },
                        padding: MySpacing.y(20),
                        backgroundColor: theme.colorScheme.primary,
                        child: MyText.titleMedium(
                          "Register",
                          fontWeight: 700,
                          color: theme.colorScheme.onPrimary,
                          letterSpacing: 0.4,
                        ),
                      ),
                      MySpacing.height(16),
                      Center(
                        child: MyButton.text(
                          onPressed: () {
                            registerController.goToLogin();
                          },
                          splashColor: theme.colorScheme.primaryContainer,
                          child: MyText.bodySmall("I already have an account",
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
