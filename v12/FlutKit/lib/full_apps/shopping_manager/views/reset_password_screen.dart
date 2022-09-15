import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../controllers/reset_password_controller.dart';

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
    theme = AppTheme.shoppingManagerTheme;
    controller = FxControllerStore.putOrFind(ResetPasswordController());
    outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        color: theme.dividerColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<ResetPasswordController>(
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
                resetForm(),
                FxSpacing.height(20),
                resetBtn()
              ],
            ),
          ));
        });
  }

  Widget title() {
    return Align(
      alignment: Alignment.centerLeft,
      child: FxText.headlineMedium(
        "Reset Password",
        fontWeight: 700,
      ),
    );
  }

  Widget resetForm() {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [passwordField(), FxSpacing.height(20), resetPasswordField()],
      ),
    );
  }

  Widget passwordField() {
    return TextFormField(
      style: FxTextStyle.bodyMedium(),
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: FxTextStyle.bodyMedium(),
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        prefixIcon: Icon(
          FeatherIcons.lock,
          size: 22,
          color: theme.colorScheme.primary,
        ),
        isDense: true,
        contentPadding: EdgeInsets.all(0),
      ),
      controller: controller.passwordTE,
      validator: controller.validatePassword,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.sentences,
      cursorColor: theme.colorScheme.primary,
    );
  }

  Widget resetPasswordField() {
    return TextFormField(
      style: FxTextStyle.bodyMedium(),
      decoration: InputDecoration(
        hintText: "Confirm Password",
        hintStyle: FxTextStyle.bodyMedium(),
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        prefixIcon: Icon(
          FeatherIcons.lock,
          size: 22,
          color: theme.colorScheme.primary,
        ),
        isDense: true,
        contentPadding: EdgeInsets.all(0),
      ),
      controller: controller.confirmPasswordTE,
      validator: controller.validateConfirmPassword,
      keyboardType: TextInputType.text,
      cursorColor: theme.colorScheme.primary,
      textCapitalization: TextCapitalization.sentences,
    );
  }

  Widget resetBtn() {
    return FxButton.block(
      padding: FxSpacing.y(12),
      onPressed: () {
        controller.resetPassword();
      },
      backgroundColor: theme.colorScheme.primary,
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FxText.bodySmall("Reset Password".toUpperCase(),
              fontWeight: 700,
              color: theme.colorScheme.onPrimary,
              letterSpacing: 0.5),
          FxSpacing.width(8),
          Icon(
            FeatherIcons.chevronRight,
            size: 20,
            color: theme.colorScheme.onPrimary,
          )
        ],
      ),
      borderRadiusAll: 24,
    );
  }
}
