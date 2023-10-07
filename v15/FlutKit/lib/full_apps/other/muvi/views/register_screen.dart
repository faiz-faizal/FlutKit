import 'package:flutkit/full_apps/other/muvi/controllers/register_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
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

  late RegisterController controller;

  @override
  void initState() {
    super.initState();
    controller = RegisterController();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
        init: controller,
        tag: 'register_controller',
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: MySpacing.top(100),
          children: [
            Image(
              height: 80,
              image: AssetImage('assets/images/apps/muvi/profile.png'),
            ),
            MySpacing.height(12),
            MyText.bodyLarge(
              'Register',
              fontWeight: 700,
              textAlign: TextAlign.center,
            ),
            MySpacing.height(4),
            MyText.labelMedium(
              'Enter your details below to \nregister yourself with us.',
              xMuted: true,
              textAlign: TextAlign.center,
            ),
            MySpacing.height(20),
            Divider(),
            MySpacing.height(20),
            MyContainer.bordered(
              borderRadiusAll: 4,
              margin: MySpacing.x(20),
              color: customTheme.card,
              padding: MySpacing.y(6),
              child: Column(
                children: [
                  TextFormField(
                    maxLines: 1,
                    cursorColor: theme.colorScheme.onBackground,
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: MyTextStyle.bodySmall(
                        color: theme.colorScheme.onBackground,
                      ),
                      isCollapsed: true,
                      contentPadding: MySpacing.xy(16, 6),
                      isDense: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    scrollPadding: MySpacing.zero,
                  ),
                  Divider(),
                  TextFormField(
                    maxLines: 1,
                    cursorColor: theme.colorScheme.onBackground,
                    decoration: InputDecoration(
                        hintText: "UserName",
                        hintStyle: MyTextStyle.bodySmall(
                          color: theme.colorScheme.onBackground,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusColor: Colors.transparent,
                        isDense: true,
                        isCollapsed: true,
                        contentPadding: MySpacing.xy(16, 6)),
                    scrollPadding: MySpacing.zero,
                  ),
                  Divider(),
                  TextFormField(
                    maxLines: 1,
                    cursorColor: theme.colorScheme.onBackground,
                    decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: MyTextStyle.bodySmall(
                          color: theme.colorScheme.onBackground,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusColor: Colors.transparent,
                        isDense: true,
                        isCollapsed: true,
                        contentPadding: MySpacing.xy(16, 6)),
                    scrollPadding: MySpacing.zero,
                  ),
                ],
              ),
            ),
            MySpacing.height(20),
            Padding(
              padding: MySpacing.x(20),
              child: Row(
                children: [
                  MyContainer.bordered(
                    onTap: () {
                      controller.toggleSelect();
                    },
                    borderRadiusAll: 4,
                    border: Border.all(
                        color: controller.selected
                            ? customTheme.muviPrimary
                            : theme.dividerColor),
                    paddingAll: controller.selected ? 0 : 8,
                    color: controller.selected
                        ? customTheme.muviPrimary
                        : customTheme.card.withAlpha(120),
                    child: controller.selected
                        ? Icon(
                            LucideIcons.check,
                            size: 16,
                            color: customTheme.muviOnPrimary,
                          )
                        : Container(),
                  ),
                  MySpacing.width(12),
                  MyText.bodySmall(
                    'Sign in automatically on each visit',
                    xMuted: true,
                  ),
                ],
              ),
            ),
            Container(
              margin: MySpacing.x(20),
              alignment: Alignment.centerRight,
              child: MyButton.text(
                splashColor: customTheme.muviPrimary.withAlpha(30),
                onPressed: () {
                  controller.goToLoginScreen();
                },
                padding: MySpacing.x(10),
                child: MyText.bodySmall(
                  'Already have account? ',
                  color: customTheme.muviPrimary,
                ),
              ),
            ),
            Padding(
              padding: MySpacing.x(30),
              child: MyButton.small(
                onPressed: () {
                  controller.signIn();
                },
                backgroundColor: customTheme.muviPrimary,
                splashColor: customTheme.muviOnPrimary.withAlpha(30),
                elevation: 0,
                padding: MySpacing.y(20),
                borderRadiusAll: 4,
                child: MyText.bodyMedium(
                  'Register',
                  fontWeight: 600,
                  color: customTheme.muviOnPrimary,
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyText.bodySmall(
                    'Forgot the magic word?',
                    xMuted: true,
                  ),
                  MySpacing.width(8),
                  MyButton.text(
                    onPressed: () {
                      controller.goToForgotPasswordScreen();
                    },
                    padding: MySpacing.zero,
                    splashColor: customTheme.muviPrimary.withAlpha(30),
                    child: MyText.bodySmall(
                      'Forgot Password',
                      fontWeight: 700,
                      color: customTheme.muviPrimary,
                      muted: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
