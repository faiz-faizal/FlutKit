import 'package:flutkit/full_apps/other/homemade/controllers/register_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;
  late RegisterController registerController;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    registerController = RegisterController();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
        init: registerController,
        tag: 'register_controller',
        builder: (registerController) {
          return Scaffold(
            body: ListView(
              padding: MySpacing.fromLTRB(24, 44, 24, 0),
              children: [
                MyText.displaySmall(
                  'Hey !\nSignup to get started',
                  color: customTheme.homemadePrimary,
                  fontWeight: 700,
                ),
                MySpacing.height(60),
                Padding(
                  padding: MySpacing.horizontal(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          filled: true,
                          fillColor: customTheme.homemadePrimary.withAlpha(50),
                          hintText: 'Name',
                          hintStyle: MyTextStyle.bodySmall(
                            color: customTheme.homemadePrimary,
                          ),
                          prefixIcon: Icon(
                            LucideIcons.user,
                            color: customTheme.homemadePrimary,
                            size: 20,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: MySpacing.all(12),
                        ),
                        cursorColor: customTheme.homemadePrimary,
                      ),
                      MySpacing.height(24),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          filled: true,
                          fillColor: customTheme.homemadePrimary.withAlpha(50),
                          hintText: 'Email Address',
                          hintStyle: MyTextStyle.bodySmall(
                            color: customTheme.homemadePrimary,
                          ),
                          prefixIcon: Icon(
                            LucideIcons.mail,
                            color: customTheme.homemadePrimary,
                            size: 20,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: MySpacing.all(12),
                        ),
                        cursorColor: customTheme.homemadePrimary,
                      ),
                      MySpacing.height(24),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          filled: true,
                          fillColor: customTheme.homemadePrimary.withAlpha(50),
                          hintText: 'Password',
                          hintStyle: MyTextStyle.bodySmall(
                            color: customTheme.homemadePrimary,
                          ),
                          prefixIcon: Icon(
                            LucideIcons.lock,
                            color: customTheme.homemadePrimary,
                            size: 20,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: MySpacing.all(12),
                        ),
                        cursorColor: customTheme.homemadePrimary,
                      ),
                      MySpacing.height(32),
                      MyButton.block(
                        elevation: 0,
                        borderRadiusAll: 8,
                        onPressed: () {
                          registerController.register();
                        },
                        backgroundColor: customTheme.homemadePrimary,
                        child: MyText.titleMedium(
                          "REGISTER",
                          fontWeight: 700,
                          color: customTheme.homemadeOnPrimary,
                          letterSpacing: 0.4,
                        ),
                      ),
                      MySpacing.height(16),
                      Center(
                        child: MyButton.text(
                          onPressed: () {
                            registerController.goToLogin();
                          },
                          splashColor:
                              customTheme.homemadePrimary.withAlpha(40),
                          child: MyText.bodySmall("I already have an account",
                              decoration: TextDecoration.underline,
                              color: customTheme.homemadePrimary),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
