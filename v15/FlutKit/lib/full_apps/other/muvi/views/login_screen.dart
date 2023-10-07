import 'package:flutkit/full_apps/other/muvi/controllers/login_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
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
  late CustomTheme customTheme;

  late LoginController controller;

  @override
  void initState() {
    super.initState();
    controller = LoginController();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: controller,
        tag: 'login_controller',
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    return Scaffold(
      body: ListView(
        padding: MySpacing.top(120),
        children: [
          Image(
            height: 80,
            image: AssetImage('assets/images/apps/muvi/profile.png'),
          ),
          MySpacing.height(12),
          MyText.bodyLarge(
            'Log In',
            fontWeight: 700,
            textAlign: TextAlign.center,
          ),
          MySpacing.height(4),
          MyText.labelMedium(
            'Enter your credentials to login yourself.',
            xMuted: true,
            textAlign: TextAlign.center,
          ),
          MySpacing.height(20),
          Divider(),
          MySpacing.height(20),
          MyContainer.bordered(
            borderRadiusAll: 4,
            margin: MySpacing.x(20),
            padding: MySpacing.y(6),
            child: Column(
              children: [
                TextFormField(
                  maxLines: 1,
                  cursorColor: theme.colorScheme.onBackground,
                  decoration: InputDecoration(
                    hintText: "UserName",
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
          Container(
            margin: MySpacing.x(20),
            alignment: Alignment.centerRight,
            child: MyButton.text(
              padding: MySpacing.x(10),
              splashColor: customTheme.muviPrimary.withAlpha(30),
              onPressed: () {
                controller.goToRegisterScreen();
              },
              child: MyText.bodySmall(
                'Don\'t have an account? ',
                color: customTheme.muviPrimary,
              ),
            ),
          ),
          Padding(
            padding: MySpacing.x(30),
            child: MyButton.small(
              onPressed: () {
                controller.logIn();
              },
              backgroundColor: customTheme.muviPrimary,
              splashColor: customTheme.muviOnPrimary.withAlpha(30),
              elevation: 0,
              borderRadiusAll: 4,
              padding: MySpacing.y(20),
              child: MyText.bodyMedium(
                'Log In',
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
    );
  }
}
