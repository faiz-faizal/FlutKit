import 'package:flutkit/full_apps/other/estate/controllers/forgot_password_controller.dart';
import 'package:flutkit/full_apps/other/estate/views/full_app_screen.dart';
import 'package:flutkit/full_apps/other/estate/views/register_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EstateForgotPasswordScreen extends StatefulWidget {
  const EstateForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _EstateForgotPasswordScreenState createState() =>
      _EstateForgotPasswordScreenState();
}

class _EstateForgotPasswordScreenState
    extends State<EstateForgotPasswordScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;
  late EstateForgotPasswordController estateForgotPasswordController;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    estateForgotPasswordController = EstateForgotPasswordController();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EstateForgotPasswordController>(
        init: estateForgotPasswordController,
        tag: 'estate_forgot_password_controller',
        builder: (estateForgotPasswordController) {
          return Scaffold(
            backgroundColor: theme.scaffoldBackgroundColor,
            body: MyContainer(
              color: customTheme.estatePrimary.withAlpha(220),
              marginAll: 0,
              paddingAll: 0,
              child: SingleChildScrollView(
                child: MyContainer(
                  paddingAll: 24,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16)),
                  width: MediaQuery.of(context).size.width,
                  margin: MySpacing.top(220),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText.displaySmall(
                        'Forgot Password?',
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
                              controller: estateForgotPasswordController
                                  .emailController,
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
                            MySpacing.height(32),
                            MyButton.block(
                              elevation: 0,
                              borderRadiusAll: 8,
                              padding: MySpacing.y(20),
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EstateFullAppScreen()),
                                );
                              },
                              backgroundColor: customTheme.estatePrimary,
                              child: MyText.labelLarge(
                                "Forgot Password",
                                fontWeight: 700,
                                color: customTheme.estateOnPrimary,
                                letterSpacing: 0.4,
                              ),
                            ),
                            MySpacing.height(16),
                            Center(
                              child: MyButton.text(
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EstateRegisterScreen()),
                                  );
                                },
                                splashColor:
                                    customTheme.estatePrimary.withAlpha(40),
                                child: MyText.bodySmall("I haven't an account",
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
            ),
          );
        });
  }
}
