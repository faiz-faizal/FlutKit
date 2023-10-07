import 'package:flutkit/full_apps/m3/cookify/controllers/forgot_password_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late ThemeData theme;
  late ForgotPasswordController controller;
  late OutlineInputBorder outlineInputBorder;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.cookifyTheme;
    controller = ForgotPasswordController();
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
    return GetBuilder<ForgotPasswordController>(
        init: controller,
        tag: 'forgot_password_controller',
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
            child: TextFormField(
              style: MyTextStyle.bodyMedium(color: theme.colorScheme.primary),
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
                  hintStyle:
                      MyTextStyle.bodyMedium(color: theme.colorScheme.primary),
                  isCollapsed: true),
              maxLines: 1,
              controller: controller.emailTE,
              validator: controller.validateEmail,
              cursorColor: theme.colorScheme.onBackground,
            ),
          ),
          MySpacing.height(32),
          MyButton.block(
              borderRadiusAll: Constant.buttonRadius.large,
              onPressed: () {
                controller.forgotPassword();
              },
              padding: MySpacing.y(20),
              elevation: 0,
              backgroundColor: theme.colorScheme.primary,
              child: MyText.labelLarge(
                "Forgot Password",
                color: theme.colorScheme.onPrimary,
              )),
          MySpacing.height(16),
          MyButton.text(
            onPressed: () {
              controller.goToRegisterScreen();
            },
            splashColor: theme.colorScheme.primaryContainer,
            child: MyText.bodySmall("I haven't an account",
                decoration: TextDecoration.underline,
                color: theme.colorScheme.primary),
          ),
        ],
      ),
    );
  }
}
