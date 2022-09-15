import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../controllers/login_controller.dart';

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
    theme = AppTheme.shoppingManagerTheme;
    controller = FxControllerStore.putOrFind(LoginController());
    outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        color: theme.dividerColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<LoginController>(
        controller: controller,
        theme: theme,
        builder: (controller) {
          return Scaffold(
              body: Container(
            padding: FxSpacing.nBottom(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                title(),
                FxSpacing.height(20),
                loginForm(),
                FxSpacing.height(10),
                forgotPassword(),
                FxSpacing.height(10),
                loginBtn(),
                FxSpacing.height(20),
                registerBtn()
              ],
            ),
          ));
        });
  }

  Widget title() {
    return Align(
      alignment: Alignment.centerLeft,
      child: FxText.headlineMedium(
        "Sign In",
        fontWeight: 700,
      ),
    );
  }

  Widget loginForm() {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [emailField(), FxSpacing.height(20), passwordField()],
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      style: FxTextStyle.bodyMedium(),
      decoration: InputDecoration(
        hintText: "Email address",
        hintStyle: FxTextStyle.bodyMedium(),
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        prefixIcon: Icon(
          FeatherIcons.mail,
          size: 22,
          color: theme.colorScheme.primary,
        ),
        isDense: true,
        contentPadding: EdgeInsets.all(0),
      ),
      controller: controller.emailController,
      validator: controller.validateEmail,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.sentences,
      cursorColor: theme.colorScheme.primary,
    );
  }

  Widget passwordField() {
    return TextFormField(
      style: FxTextStyle.bodyMedium(),
      obscureText: controller.enable ? false : true,
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: FxTextStyle.bodyMedium(),
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        suffixIcon: InkWell(
            onTap: () {
              controller.toggle();
            },
            child: Icon(
              controller.enable
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              size: 20,
              color: theme.colorScheme.primary,
            )),
        prefixIcon: Icon(
          FeatherIcons.lock,
          size: 22,
          color: theme.colorScheme.primary,
        ),
        isDense: true,
        contentPadding: EdgeInsets.all(0),
      ),
      controller: controller.passwordController,
      validator: controller.validatePassword,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.sentences,
      cursorColor: theme.colorScheme.primary,
    );
  }

  Widget forgotPassword() {
    return Align(
      alignment: Alignment.topRight,
      child: FxButton.text(
        onPressed: () {
          controller.goToForgotPasswordScreen();
        },
        elevation: 0,
        padding: FxSpacing.right(0),
        borderRadiusAll: 4,
        child: FxText.bodySmall(
          "Forgot password?",
        ),
      ),
    );
  }

  Widget loginBtn() {
    return FxButton.block(
      padding: FxSpacing.y(12),
      onPressed: () {
        controller.login();
      },
      backgroundColor: theme.colorScheme.primary,
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FxText.bodySmall("Sign In".toUpperCase(),
              fontWeight: 700,
              color: theme.colorScheme.onPrimary,
              letterSpacing: 0.5),
          FxSpacing.width(8),
          Icon(
            FeatherIcons.chevronRight,
            size: 18,
            color: theme.colorScheme.onPrimary,
          )
        ],
      ),
      borderRadiusAll: 24,
    );
  }

  Widget registerBtn() {
    return FxButton.text(
      onPressed: () {
        controller.goToRegisterScreen();
      },
      elevation: 0,
      child: FxText.bodySmall("I haven't an account",
          decoration: TextDecoration.underline),
    );
  }
}
