import 'package:flutkit/full_apps/other/muvi/controllers/forgot_password_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late ForgotPasswordController controller;

  @override
  void initState() {
    super.initState();
    controller = ForgotPasswordController();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(
        init: controller,
        tag: 'forgot_password_controller',
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    return Scaffold(
      body: ListView(
        padding: MySpacing.top(150),
        children: [
          Image(
            height: 64,
            image: AssetImage('assets/images/apps/muvi/lock.png'),
          ),
          MySpacing.height(12),
          MyText.bodyLarge(
            'Forgot Password',
            fontWeight: 700,
            textAlign: TextAlign.center,
          ),
          MySpacing.height(4),
          MyText.labelMedium(
            'Enter your email address below and we will send\n you further instructions on how to reset your password.',
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
              ],
            ),
          ),
          MySpacing.height(20),
          Padding(
            padding: MySpacing.x(20),
            child: MyButton.small(
              onPressed: () {
                controller.forgotPassword();
              },
              padding: MySpacing.y(20),
              backgroundColor: customTheme.muviPrimary,
              splashColor: customTheme.muviOnPrimary.withAlpha(30),
              elevation: 0,
              borderRadiusAll: 4,
              child: MyText.bodyMedium(
                'Submit',
                fontWeight: 600,
                color: customTheme.muviOnPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
