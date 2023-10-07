import 'package:flutkit/full_apps/m3/estate/controllers/forgot_password_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late ThemeData theme;
  late ForgotPasswordController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.estateTheme;
    controller = ForgotPasswordController();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(
        init: controller,
        tag: 'forgot_password_controller',
        builder: (controller) {
          return Theme(
            data: theme.copyWith(
                colorScheme: theme.colorScheme
                    .copyWith(secondary: theme.colorScheme.primaryContainer)),
            child: Scaffold(
              backgroundColor: theme.scaffoldBackgroundColor,
              body: MyContainer(
                color: theme.colorScheme.primary,
                marginAll: 0,
                paddingAll: 0,
                child: SingleChildScrollView(
                  child: MyContainer(
                    paddingAll: 24,
                    borderRadius: BorderRadius.only(
                        topRight:
                            Radius.circular(Constant.containerRadius.large),
                        topLeft:
                            Radius.circular(Constant.containerRadius.large)),
                    width: MediaQuery.of(context).size.width,
                    margin: MySpacing.top(220),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText.displaySmall(
                          'Forgot Password?',
                          color: theme.colorScheme.primary,
                          fontWeight: 700,
                        ),
                        MySpacing.height(24),
                        Padding(
                          padding: MySpacing.horizontal(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText.bodyLarge(
                                'Email',
                                fontWeight: 600,
                              ),
                              TextFormField(
                                controller: controller.emailController,
                                decoration: InputDecoration(
                                  hintText: "Your Email Id",
                                  hintStyle: TextStyle(fontSize: 12),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  contentPadding:
                                      MySpacing.fromLTRB(0, 8, 4, 20),
                                  isCollapsed: true,
                                  focusColor: theme.colorScheme.primary,
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
                                  disabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
                                ),
                                cursorColor: theme.colorScheme.primary,
                                autofocus: true,
                              ),
                              MySpacing.height(32),
                              MyButton.block(
                                elevation: 0,
                                borderRadiusAll: Constant.buttonRadius.large,
                                onPressed: () {
                                  controller.goToHome();
                                },
                                padding: MySpacing.y(20),
                                backgroundColor: theme.colorScheme.primary,
                                child: MyText.labelLarge(
                                  "FORGOT PASSWORD",
                                  fontWeight: 700,
                                  color: theme.colorScheme.onPrimary,
                                  letterSpacing: 0.4,
                                ),
                              ),
                              MySpacing.height(16),
                              Center(
                                child: MyButton.text(
                                  onPressed: () {
                                    controller.goToRegisterScreen();
                                  },
                                  splashColor:
                                      theme.colorScheme.primary.withAlpha(40),
                                  child: MyText.bodySmall(
                                      "I haven't an account",
                                      decoration: TextDecoration.underline,
                                      color: theme.colorScheme.primary),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
