import 'package:flutkit/full_apps/animations/rental_service/controllers/forgot_password_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

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
    theme = AppTheme.rentalServiceTheme;
    controller = ForgotPasswordController();
    outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
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
        // theme: theme,
        builder: (controller) {
          return Scaffold(
            body: Padding(
              padding: MySpacing.fromLTRB(
                  20, MySpacing.safeAreaTop(context) + 20, 20, 20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText.headlineLarge(
                      "Forgot Password?",
                      fontWeight: 700,
                    ),
                    MyText.bodyLarge(
                      "Enter email to proceed further",
                      fontWeight: 600,
                    ),
                    MySpacing.height(40),
                    forgotPasswordForm(),
                    MySpacing.height(20),
                    submitButton(),
                    MySpacing.height(10),
                    registerBtn()
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget forgotPasswordForm() {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          emailField(),
        ],
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      style: MyTextStyle.bodyMedium(),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          isDense: true,
          filled: true,
          hintText: "Email Address",
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          border: outlineInputBorder,
          prefixIcon: Icon(Icons.person),
          contentPadding: MySpacing.all(16),
          hintStyle: MyTextStyle.bodyMedium(xMuted: true),
          isCollapsed: true),
      maxLines: 1,
      controller: controller.emailController,
      validator: controller.validateEmail,
      cursorColor: theme.colorScheme.onBackground,
    );
  }

  Widget submitButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyText.headlineLarge(
          "Submit",
          fontWeight: 700,
        ),
        MySpacing.width(20),
        MyButton.small(
          onPressed: () {
            controller.forgotPassword();
          },
          padding: MySpacing.y(12),
          elevation: 0,
          borderRadiusAll: Constant.buttonRadius.xs,
          child: Icon(
            Icons.keyboard_arrow_right,
            color: theme.colorScheme.onPrimary,
            size: 24,
          ),
        ),
      ],
    );
  }

  Widget registerBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyText.bodySmall(
          "Not a Member?",
        ),
        MySpacing.width(8),
        MyButton.text(
            onPressed: () {
              controller.goToRegisterScreen();
            },
            padding: MySpacing.y(8),
            child: MyText.bodySmall(
              "Register",
              color: theme.colorScheme.primary,
              decoration: TextDecoration.underline,
            ))
      ],
    );
  }
}
