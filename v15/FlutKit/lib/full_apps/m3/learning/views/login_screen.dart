import 'package:flutkit/full_apps/m3/learning/controllers/login_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutkit/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class LearningLogInScreen extends StatefulWidget {
  const LearningLogInScreen({Key? key}) : super(key: key);

  @override
  _LearningLogInScreenState createState() => _LearningLogInScreenState();
}

class _LearningLogInScreenState extends State<LearningLogInScreen> {
  late ThemeData theme;
  late LogInController controller;
  late OutlineInputBorder outlineInputBorder;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.learningTheme;
    controller = LogInController();
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
    return GetBuilder<LogInController>(
        init: controller,
        tag: 'log_in_controller',
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    return Scaffold(
      body: ListView(
        padding:
            MySpacing.fromLTRB(16, MySpacing.safeAreaTop(context) + 36, 16, 16),
        children: [
          MyText.displaySmall(
            'Hello Again! \nWelcome \nback',
            fontWeight: 700,
            color: theme.colorScheme.primary,
          ),
          MySpacing.height(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyContainer.bordered(
                border: Border.all(
                    color: controller.selectedRole == 1
                        ? theme.colorScheme.primary
                        : Colors.transparent),
                /* color: controller.selectedRole == 1
                    ? theme.colorScheme.primary.withAlpha(40)
                    : theme.colorScheme.primaryContainer,*/
                padding: MySpacing.xy(28, 20),
                borderRadiusAll: Constant.containerRadius.medium,
                onTap: () {
                  controller.select(1);
                },
                child: Column(
                  children: [
                    Image(
                      height: 64,
                      width: 64,
                      image: AssetImage(Images.teacher),
                    ),
                    MySpacing.height(12),
                    MyText.bodySmall(
                      'Teacher',
                      color: controller.selectedRole == 1
                          ? theme.colorScheme.primary
                          : theme.colorScheme.onBackground,
                      fontWeight: 600,
                    ),
                  ],
                ),
              ),
              MyContainer.bordered(
                border: Border.all(
                    color: controller.selectedRole == 2
                        ? theme.colorScheme.primary
                        : Colors.transparent),
                /* color: controller.selectedRole == 2
                    ? theme.colorScheme.primary.withAlpha(40)
                    : theme.colorScheme.primaryContainer,*/
                padding: MySpacing.xy(28, 20),
                borderRadiusAll: Constant.containerRadius.medium,
                onTap: () {
                  controller.select(2);
                },
                child: Column(
                  children: [
                    Image(
                      height: 64,
                      width: 64,
                      image: AssetImage(Images.student),
                    ),
                    MySpacing.height(12),
                    MyText.bodySmall(
                      'Student',
                      fontWeight: 600,
                      color: controller.selectedRole == 2
                          ? theme.colorScheme.primary
                          : theme.colorScheme.onBackground,
                    ),
                  ],
                ),
              ),
            ],
          ),
          MySpacing.height(40),
          Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  style: MyTextStyle.bodyMedium(),
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      isDense: true,
                      labelStyle: MyTextStyle.bodyMedium(),
                      fillColor: theme.colorScheme.primaryContainer,
                      prefixIcon: Icon(
                        LucideIcons.mail,
                        color: theme.colorScheme.onBackground,
                      ),
                      hintText: "Email Address",
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      border: outlineInputBorder,
                      contentPadding: MySpacing.all(16),
                      hintStyle: MyTextStyle.bodyMedium(),
                      isCollapsed: true),
                  maxLines: 1,
                  controller: controller.emailTE,
                  validator: controller.validateEmail,
                  cursorColor: theme.colorScheme.onPrimaryContainer,
                ),
                MySpacing.height(20),
                TextFormField(
                  style: MyTextStyle.bodyMedium(),
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      isDense: true,
                      fillColor: theme.colorScheme.primaryContainer,
                      prefixIcon: Icon(
                        LucideIcons.lock,
                        color: theme.colorScheme.onBackground,
                      ),
                      hintText: "Password",
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      border: outlineInputBorder,
                      contentPadding: MySpacing.all(16),
                      hintStyle: MyTextStyle.bodyMedium(),
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
          MyButton.block(
            elevation: 0,
            borderRadiusAll: Constant.buttonRadius.large,
            onPressed: () {
              controller.login();
            },
            padding: MySpacing.y(20),
            splashColor: theme.colorScheme.onPrimary.withAlpha(30),
            backgroundColor: theme.colorScheme.primary,
            child: MyText.labelLarge(
              "Sign In",
              color: theme.colorScheme.onPrimary,
            ),
          ),
          MySpacing.height(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyButton.text(
                onPressed: () {
                  controller.goToForgotPasswordScreen();
                },
                padding: MySpacing.zero,
                splashColor: theme.colorScheme.primary.withAlpha(40),
                child: MyText.bodySmall("Forgot your Password ?",
                    color: theme.colorScheme.primary,
                    decoration: TextDecoration.underline),
              ),
              MyButton.text(
                onPressed: () {
                  controller.goToRegisterScreen();
                },
                padding: MySpacing.zero,
                splashColor: theme.colorScheme.primary.withAlpha(40),
                child: MyText.bodySmall(
                  "Sign up",
                  color: theme.colorScheme.primary,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
