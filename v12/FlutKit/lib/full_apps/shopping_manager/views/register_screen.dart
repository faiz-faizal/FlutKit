import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../controllers/register_controller.dart';

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
    theme = AppTheme.shoppingManagerTheme;
    controller = FxControllerStore.putOrFind(RegisterController());
    outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        color: theme.dividerColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<RegisterController>(
        controller: controller,
        theme: theme,
        builder: (controller) {
          return Scaffold(
              body: Container(
            padding: FxSpacing.x(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                title(),
                FxSpacing.height(20),
                registerForm(),
                FxSpacing.height(20),
                registerBtn(),
                FxSpacing.height(20),
                loginBtn()
              ],
            ),
          ));
        });
  }

  Widget title() {
    return Align(
      alignment: Alignment.centerLeft,
      child: FxText.headlineMedium(
        "Sign Up",
        fontWeight: 700,
      ),
    );
  }

  Widget registerForm() {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          nameField(),
          FxSpacing.height(20),
          emailField(),
          FxSpacing.height(20),
          passwordField(),
        ],
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

  Widget nameField() {
    return TextFormField(
      style: FxTextStyle.bodyMedium(),
      decoration: InputDecoration(
        hintText: "Name",
        hintStyle: FxTextStyle.bodyMedium(),
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        prefixIcon: Icon(
          FeatherIcons.user,
          size: 22,
          color: theme.colorScheme.primary,
        ),
        isDense: true,
        contentPadding: EdgeInsets.all(0),
      ),
      controller: controller.nameController,
      validator: controller.validateName,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.sentences,
      cursorColor: theme.colorScheme.primary,
    );
  }

  Widget registerBtn() {
    return FxButton.block(
      padding: FxSpacing.y(12),
      onPressed: () {
        controller.register();
      },
      backgroundColor: theme.colorScheme.primary,
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FxText.bodySmall("Sign Up".toUpperCase(),
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

  Widget loginBtn() {
    return FxButton.text(
      onPressed: () {
        controller.goToLoginScreen();
      },
      elevation: 0,
      child: FxText.bodySmall("I already have an account",
          decoration: TextDecoration.underline),
    );
  }
}
