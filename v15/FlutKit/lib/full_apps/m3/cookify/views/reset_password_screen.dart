import 'package:flutkit/full_apps/m3/cookify/controllers/reset_password_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late ThemeData theme;

  late ResetPasswordController controller;
  late OutlineInputBorder outlineInputBorder;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.cookifyTheme;

    controller = ResetPasswordController();
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
    return GetBuilder<ResetPasswordController>(
        init: controller,
        tag: 'reset_password_controller',
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    return Scaffold(
      body: ListView(
        padding: MySpacing.fromLTRB(24, 200, 24, 0),
        children: [
          Icon(
            LucideIcons.menuSquare,
            color: theme.colorScheme.primary,
            size: 64,
          ),
          MySpacing.height(16),
          MyText.displaySmall(
            "Forgot Password",
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
                      prefixIcon: Icon(LucideIcons.lock,
                          color: theme.colorScheme.primary),
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
                      hintText: "Confirm Password",
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      border: outlineInputBorder,
                      contentPadding: MySpacing.all(16),
                      hintStyle: MyTextStyle.bodyMedium(
                          color: theme.colorScheme.primary),
                      isCollapsed: true),
                  maxLines: 1,
                  controller: controller.confirmPasswordTE,
                  validator: controller.validateConfirmPassword,
                  cursorColor: theme.colorScheme.onBackground,
                ),
              ],
            ),
          ),
          MySpacing.height(32),
          MyButton.block(
              borderRadiusAll: Constant.buttonRadius.large,
              onPressed: () {
                controller.resetPassword();
              },
              elevation: 0,
              backgroundColor: theme.colorScheme.primary,
              child: MyText.labelLarge(
                "Reset Password",
                color: theme.colorScheme.onPrimary,
              )),
        ],
      ),
    );
  }
}
