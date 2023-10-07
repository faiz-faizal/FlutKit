import 'package:flutkit/full_apps/m3/cookify/controllers/register_controller.dart';
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
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late ThemeData theme;

  late RegisterController controller;
  late OutlineInputBorder outlineInputBorder;
  @override
  void initState() {
    super.initState();
    theme = AppTheme.cookifyTheme;
    controller = RegisterController();
    outlineInputBorder = OutlineInputBorder(
      borderRadius:
          BorderRadius.all(Radius.circular(Constant.textFieldRadius.medium)),
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
        init: controller,
        tag: 'register_controller',
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    return Scaffold(
      body: ListView(
        padding: MySpacing.fromLTRB(24, 100, 24, 0),
        children: [
          Icon(
            LucideIcons.menuSquare,
            color: theme.colorScheme.primary,
            size: 64,
          ),
          MySpacing.height(20),
          MyText.displaySmall(
            "Create an Account",
            color: theme.colorScheme.primary,
            fontWeight: 800,
            textAlign: TextAlign.center,
          ),
          MySpacing.height(32),
          Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  style:
                      MyTextStyle.bodyMedium(color: theme.colorScheme.primary),
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      isDense: true,
                      fillColor: theme.colorScheme.primaryContainer,
                      prefixIcon: Icon(
                        LucideIcons.user,
                        color: theme.colorScheme.primary,
                      ),
                      hintText: "Name",
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      border: outlineInputBorder,
                      contentPadding: MySpacing.all(16),
                      hintStyle: MyTextStyle.bodyMedium(
                          color: theme.colorScheme.primary),
                      isCollapsed: true),
                  maxLines: 1,
                  controller: controller.nameTE,
                  validator: controller.validateName,
                  cursorColor: theme.colorScheme.onBackground,
                ),
                MySpacing.height(20),
                TextFormField(
                  style:
                      MyTextStyle.bodyMedium(color: theme.colorScheme.primary),
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      isDense: true,
                      fillColor: theme.colorScheme.primaryContainer,
                      prefixIcon: Icon(
                        LucideIcons.mail,
                        color: theme.colorScheme.primary,
                      ),
                      hintText: "Email Address",
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      border: outlineInputBorder,
                      contentPadding: MySpacing.all(16),
                      hintStyle: MyTextStyle.bodyMedium(
                          color: theme.colorScheme.primary),
                      isCollapsed: true),
                  maxLines: 1,
                  controller: controller.emailTE,
                  validator: controller.validateEmail,
                  cursorColor: theme.colorScheme.onBackground,
                ),
                MySpacing.height(20),
                TextFormField(
                  style:
                      MyTextStyle.bodyMedium(color: theme.colorScheme.primary),
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      isDense: true,
                      fillColor: theme.colorScheme.primaryContainer,
                      prefixIcon: Icon(
                        LucideIcons.lock,
                        color: theme.colorScheme.primary,
                      ),
                      hintText: "Password",
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      border: outlineInputBorder,
                      contentPadding: MySpacing.all(16),
                      hintStyle: MyTextStyle.bodyMedium(
                          color: theme.colorScheme.primary),
                      isCollapsed: true),
                  maxLines: 1,
                  controller: controller.passwordTE,
                  validator: controller.validatePassword,
                  cursorColor: theme.colorScheme.onBackground,
                ),
              ],
            ),
          ),
          MySpacing.height(20),
          Align(
            alignment: Alignment.centerRight,
            child: MyButton.text(
                padding: MySpacing.zero,
                onPressed: () {
                  controller.goToForgotPasswordScreen();
                },
                splashColor: theme.colorScheme.primaryContainer,
                child: MyText.bodySmall("Forgot Password?",
                    color: theme.colorScheme.primary)),
          ),
          MySpacing.height(20),
          MyButton.block(
              borderRadiusAll: Constant.buttonRadius.large,
              onPressed: () {
                controller.register();
              },
              padding: MySpacing.y(20),
              elevation: 0,
              backgroundColor: theme.colorScheme.primary,
              child: MyText.labelLarge(
                "Create an Account",
                color: theme.colorScheme.onPrimary,
              )),
          MySpacing.height(20),
          MyButton.text(
              onPressed: () {
                controller.goToLogInScreen();
              },
              splashColor: theme.colorScheme.primaryContainer,
              child: MyText.labelMedium("I have already an account",
                  decoration: TextDecoration.underline,
                  color: theme.colorScheme.primary)),
          MySpacing.height(20),
        ],
      ),
    );
  }
}
