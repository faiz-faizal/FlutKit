import 'package:flutkit/full_apps/animations/nft/controllers/register_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

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
    theme = AppTheme.nftTheme;
    controller = RegisterController();
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
    return GetBuilder<RegisterController>(
        init: controller,
        tag: 'register_controller',
        // theme: theme,
        builder: (controller) {
          return Scaffold(
            body: Padding(
              padding: MySpacing.fromLTRB(
                  20, MySpacing.safeAreaTop(context) + 20, 20, 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MyText.titleLarge(
                      "Create an account",
                      fontWeight: 700,
                    ),
                    MySpacing.height(20),
                    registerForm(),
                    MySpacing.height(20),
                    registerBtn(),
                    MySpacing.height(10),
                    loginBtn(),
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
          );
        });
  }

  Widget registerForm() {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          emailField(),
          MySpacing.height(20),
          passwordField(),
          MySpacing.height(20),
          nameField()
        ],
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

  Widget nameField() {
    return TextFormField(
      style: MyTextStyle.bodyMedium(),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          isDense: true,
          filled: true,
          fillColor: theme.cardTheme.color,
          hintText: "Name",
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          border: outlineInputBorder,
          contentPadding: MySpacing.all(16),
          hintStyle: MyTextStyle.bodySmall(xMuted: true),
          isCollapsed: true),
      maxLines: 1,
      controller: controller.nameController,
      validator: controller.validateName,
      cursorColor: theme.colorScheme.onBackground,
    );
  }

  Widget registerBtn() {
    return MyButton.block(
      onPressed: () {
        controller.register();
      },
      borderRadiusAll: Constant.buttonRadius.xs,
      elevation: 0,
      padding: MySpacing.y(20),
      child: MyText.labelLarge(
        "Create your account",
        fontWeight: 700,
        color: theme.colorScheme.onPrimary,
      ),
    );
  }

  Widget loginBtn() {
    return MyButton.text(
      onPressed: () {
        controller.goToLoginScreen();
      },
      padding: MySpacing.xy(16, 16),
      borderRadiusAll: Constant.buttonRadius.xs,
      child: MyText.bodySmall(
        "Already have an account?",
        fontWeight: 600,
        xMuted: true,
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
