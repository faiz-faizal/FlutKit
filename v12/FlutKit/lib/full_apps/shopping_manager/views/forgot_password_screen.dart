import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../controllers/forgot_password_controller.dart';

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
    theme = AppTheme.shoppingManagerTheme;
    controller = FxControllerStore.putOrFind(ForgotPasswordController());
    outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        color: theme.dividerColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<ForgotPasswordController>(
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
                forgotPasswordForm(),
                FxSpacing.height(20),
                forgotPasswordBtn(),
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
        "Forgot Password?",
        fontWeight: 700,
      ),
    );
  }

  Widget forgotPasswordForm() {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          emailField(),
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

  Widget forgotPasswordBtn() {
    return FxButton.block(
      padding: FxSpacing.y(12),
      onPressed: () {
        controller.forgotPassword();
      },
      backgroundColor: theme.colorScheme.primary,
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FxText.bodySmall("Submit".toUpperCase(),
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
      child: FxText.bodySmall("I don't have an account",
          decoration: TextDecoration.underline),
    );
  }
}
