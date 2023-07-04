import 'package:flutkit/m3/cookify/controllers/login_controller.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class LoginScreen extends StatefulWidget {
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
    theme = AppTheme.cookifyTheme;
    controller = FxControllerStore.putOrFind(LoginController());
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
    return FxBuilder<LoginController>(
        controller: controller,
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    return Scaffold(
      body: ListView(
        padding: FxSpacing.fromLTRB(24, 100, 24, 0),
        children: [
          FxTwoToneIcon(
            FxTwoToneMdiIcons.menu_book,
            color: theme.colorScheme.primary,
            size: 64,
          ),
          FxSpacing.height(20),
          Center(
            child: FxText.displaySmall("Log In",
                color: theme.colorScheme.primary, fontWeight: 800),
          ),
          FxSpacing.height(32),
          Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  style:
                      FxTextStyle.bodyMedium(color: theme.colorScheme.primary),
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      isDense: true,
                      labelStyle: FxTextStyle.bodyMedium(),
                      fillColor: theme.colorScheme.primaryContainer,
                      prefixIcon: Icon(
                        FeatherIcons.mail,
                        color: theme.colorScheme.primary,
                      ),
                      hintText: "Email Address",
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      border: outlineInputBorder,
                      contentPadding: FxSpacing.all(16),
                      hintStyle: FxTextStyle.bodyMedium(
                          color: theme.colorScheme.primary),
                      isCollapsed: true),
                  maxLines: 1,
                  controller: controller.emailTE,
                  validator: controller.validateEmail,
                  cursorColor: theme.colorScheme.onPrimaryContainer,
                ),
                FxSpacing.height(20),
                TextFormField(
                  style:
                      FxTextStyle.bodyMedium(color: theme.colorScheme.primary),
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      isDense: true,
                      fillColor: theme.colorScheme.primaryContainer,
                      prefixIcon: Icon(
                        FeatherIcons.lock,
                        color: theme.colorScheme.primary,
                      ),
                      hintText: "Password",
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      border: outlineInputBorder,
                      contentPadding: FxSpacing.all(16),
                      hintStyle: FxTextStyle.bodyMedium(
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
          FxSpacing.height(20),
          Align(
            alignment: Alignment.centerRight,
            child: FxButton.text(
                onPressed: () {
                  controller.goToForgotPasswordScreen();
                },
                padding: FxSpacing.zero,
                splashColor: theme.colorScheme.primaryContainer,
                child: FxText.labelMedium("Forgot Password?",
                    color: theme.colorScheme.primary)),
          ),
          FxSpacing.height(20),
          FxButton.block(
            borderRadiusAll: Constant.buttonRadius.large,
            onPressed: () {
              controller.login();
            },
            elevation: 0,
            backgroundColor: theme.colorScheme.primary,
            child: FxText.labelLarge(
              "Log In",
              color: theme.colorScheme.onPrimary,
            ),
          ),
          FxSpacing.height(16),
          FxButton.text(
            onPressed: () {
              controller.goToRegisterScreen();
            },
            splashColor: theme.colorScheme.primaryContainer,
            child: FxText.labelMedium("I haven't an account",
                decoration: TextDecoration.underline,
                color: theme.colorScheme.primary),
          ),
        ],
      ),
    );
  }
}
