import 'package:flutkit/full_apps/other/estate/controllers/login_controller.dart';
import 'package:flutkit/full_apps/other/estate/views/forgot_password_screen.dart';
import 'package:flutkit/full_apps/other/estate/views/full_app_screen.dart';
import 'package:flutkit/full_apps/other/estate/views/register_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class EstateLoginScreen extends StatefulWidget {
  const EstateLoginScreen({Key? key}) : super(key: key);

  @override
  _EstateLoginScreenState createState() => _EstateLoginScreenState();
}

class _EstateLoginScreenState extends State<EstateLoginScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;
  late EstateLogInController estateLogInController;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    estateLogInController = EstateLogInController();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EstateLogInController>(
        init: estateLogInController,
        tag: 'estate_log_in_controller',
        builder: (estateLogInController) {
          return Scaffold(
            body: MyContainer(
              color: customTheme.estatePrimary.withAlpha(224),
              marginAll: 0,
              paddingAll: 0,
              child: MyContainer(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16)),
                width: MediaQuery.of(context).size.width,
                margin: MySpacing.top(220),
                child: ListView(
                  children: [
                    MyText.headlineMedium(
                      'Log In',
                      color: customTheme.estatePrimary,
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
                            controller: estateLogInController.emailController,
                            decoration: InputDecoration(
                              hintText: "Your Email Id",
                              hintStyle: TextStyle(fontSize: 12),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              contentPadding: MySpacing.fromLTRB(0, 8, 4, 20),
                              isCollapsed: true,
                              focusColor: customTheme.estatePrimary,
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: customTheme.estatePrimary,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: customTheme.estatePrimary,
                                ),
                              ),
                              disabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: customTheme.estatePrimary,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: customTheme.estatePrimary,
                                ),
                              ),
                            ),
                            cursorColor: customTheme.estatePrimary,
                            autofocus: true,
                          ),
                          MySpacing.height(16),
                          MyText.bodyLarge(
                            'Password',
                            fontWeight: 600,
                          ),
                          TextFormField(
                            controller:
                                estateLogInController.passwordController,
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(fontSize: 12),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              contentPadding: MySpacing.fromLTRB(0, 8, 4, 20),
                              suffixIcon: InkWell(
                                onTap:
                                    estateLogInController.onChangeShowPassword,
                                child: Icon(
                                  estateLogInController.showPassword
                                      ? LucideIcons.eye
                                      : LucideIcons.eyeOff,
                                  size: 20,
                                  color: customTheme.estatePrimary,
                                ),
                              ),
                              suffixIconConstraints:
                                  BoxConstraints(minHeight: 0),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: customTheme.estatePrimary,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: customTheme.estatePrimary,
                                ),
                              ),
                              disabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: customTheme.estatePrimary,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: customTheme.estatePrimary,
                                ),
                              ),
                              isCollapsed: true,
                              focusColor: customTheme.estatePrimary,
                            ),
                            cursorColor: customTheme.estatePrimary,
                            autofocus: true,
                          ),
                          MySpacing.height(16),
                          Align(
                            alignment: Alignment.centerRight,
                            child: MyButton.text(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EstateForgotPasswordScreen()),
                                  );
                                },
                                splashColor:
                                    customTheme.estatePrimary.withAlpha(40),
                                child: MyText.bodySmall("Forgot Password?",
                                    color: customTheme.estatePrimary)),
                          ),
                          MySpacing.height(16),
                          MyButton.block(
                            elevation: 0,
                            borderRadiusAll: 8,
                            padding: MySpacing.y(20),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        EstateFullAppScreen()),
                              );
                            },
                            backgroundColor: customTheme.estatePrimary,
                            child: MyText.titleSmall(
                              "LOG IN",
                              fontWeight: 700,
                              color: customTheme.estateOnPrimary,
                              letterSpacing: 0.4,
                            ),
                          ),
                          MySpacing.height(16),
                          Center(
                            child: MyButton.text(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EstateRegisterScreen()),
                                );
                              },
                              splashColor:
                                  customTheme.estatePrimary.withAlpha(40),
                              child: MyText.labelMedium("I haven't an account",
                                  decoration: TextDecoration.underline,
                                  color: customTheme.estatePrimary),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
