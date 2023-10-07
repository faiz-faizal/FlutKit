import 'package:flutkit/full_apps/animations/nft/controllers/login_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ThemeData theme;
  late LoginController controller;
  late OutlineInputBorder outlineInputBorder;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.nftTheme;
    controller = LoginController();
    outlineInputBorder = OutlineInputBorder(
      borderRadius:
          BorderRadius.all(Radius.circular(Constant.containerRadius.xs)),
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: controller,
        tag: 'login_controller',
        // theme: theme,
        builder: (controller) {
          return Scaffold(
            body: Padding(
              padding: MySpacing.fromLTRB(
                  20, MySpacing.safeAreaTop(context) + 40, 20, 0),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      MyText.titleLarge(
                        "Login to your account",
                        fontWeight: 700,
                      ),
                      MySpacing.height(40),
                      loginForm(),
                      MySpacing.height(10),
                      forgotPasswordBtn(),
                      MySpacing.height(10),
                      loginBtn(),
                      MySpacing.height(10),
                      registerBtn(),
                      MySpacing.height(20),
                      Divider(),
                      MySpacing.height(20),
                      google(),
                      MySpacing.height(20),
                      facebook(),
                      MySpacing.height(20),
                      apple()
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget loginForm() {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [emailField(), MySpacing.height(20), passwordField()],
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      style: MyTextStyle.bodyMedium(),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          isDense: true,
          filled: true,
          fillColor: theme.cardTheme.color,
          hintText: "Email Address",
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          border: outlineInputBorder,
          contentPadding: MySpacing.all(16),
          hintStyle: MyTextStyle.bodySmall(xMuted: true),
          isCollapsed: true),
      maxLines: 1,
      controller: controller.emailController,
      validator: controller.validateEmail,
      cursorColor: theme.colorScheme.onBackground,
    );
  }

  Widget passwordField() {
    return TextFormField(
      style: MyTextStyle.bodyMedium(),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          isDense: true,
          filled: true,
          fillColor: theme.cardTheme.color,
          hintText: "Password",
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          border: outlineInputBorder,
          contentPadding: MySpacing.all(16),
          hintStyle: MyTextStyle.bodySmall(xMuted: true),
          isCollapsed: true),
      maxLines: 1,
      controller: controller.passwordController,
      validator: controller.validatePassword,
      cursorColor: theme.colorScheme.onBackground,
    );
  }

  Widget loginBtn() {
    return MyButton.block(
      onPressed: () {
        controller.login();
      },
      padding: MySpacing.y(20),
      borderRadiusAll: Constant.buttonRadius.xs,
      elevation: 0,
      child: MyText.labelLarge(
        "Login to your account",
        fontWeight: 700,
        color: theme.colorScheme.onPrimary,
      ),
    );
  }

  Widget registerBtn() {
    return MyButton.text(
      onPressed: () {
        controller.goToRegisterScreen();
      },
      padding: MySpacing.xy(16, 16),
      child: MyText.bodySmall(
        "Don't have an account?",
        fontWeight: 600,
        xMuted: true,
      ),
    );
  }

  Widget forgotPasswordBtn() {
    return Align(
      alignment: Alignment.centerRight,
      child: MyButton.text(
        padding: MySpacing.zero,
        onPressed: () {
          controller.goToForgotPasswordScreen();
        },
        child: MyText.bodySmall(
          "Forgot password?",
          fontWeight: 600,
          xMuted: true,
        ),
      ),
    );
  }

  Widget google() {
    return MyButton.block(
      elevation: 0,
      padding: MySpacing.y(20),
      backgroundColor: theme.cardTheme.color,
      borderRadiusAll: Constant.buttonRadius.xs,
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            height: 20,
            width: 20,
            color: theme.colorScheme.primary,
            image: AssetImage(
              'assets/images/full_apps/nft/icons/google.png',
            ),
          ),
          MySpacing.width(12),
          MyText.labelLarge(
            "Continue with Google",
            fontWeight: 700,
          ),
        ],
      ),
    );
  }

  Widget facebook() {
    return MyButton.block(
      elevation: 0,
      padding: MySpacing.y(20),
      backgroundColor: theme.cardTheme.color,
      borderRadiusAll: Constant.buttonRadius.xs,
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            height: 20,
            width: 20,
            color: theme.colorScheme.primary,
            image: AssetImage('assets/images/full_apps/nft/icons/facebook.png'),
          ),
          MySpacing.width(12),
          MyText.labelLarge(
            "Continue with Facebook",
            fontWeight: 700,
          ),
        ],
      ),
    );
  }

  Widget apple() {
    return MyButton.block(
      elevation: 0,
      padding: MySpacing.y(20),
      backgroundColor: theme.cardTheme.color,
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            height: 20,
            width: 20,
            color: theme.colorScheme.primary,
            image: AssetImage('assets/images/full_apps/nft/icons/apple.png'),
          ),
          MySpacing.width(12),
          MyText.labelLarge(
            "Continue with Apple",
            fontWeight: 700,
          ),
        ],
      ),
    );
  }
}
