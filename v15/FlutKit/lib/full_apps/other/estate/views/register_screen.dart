import 'package:flutkit/full_apps/other/estate/controllers/register_controller.dart';
import 'package:flutkit/full_apps/other/estate/views/full_app_screen.dart';
import 'package:flutkit/full_apps/other/estate/views/login_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class EstateRegisterScreen extends StatefulWidget {
  const EstateRegisterScreen({Key? key}) : super(key: key);

  @override
  _EstateRegisterScreenState createState() => _EstateRegisterScreenState();
}

class _EstateRegisterScreenState extends State<EstateRegisterScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;
  late EstateRegisterController estateRegisterController;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    estateRegisterController = EstateRegisterController();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EstateRegisterController>(
        init: estateRegisterController,
        tag: 'estate_register_controller',
        builder: (estateRegisterController) {
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
                      'Register',
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
                            'Name',
                            fontWeight: 600,
                          ),
                          TextFormField(
                            controller: estateRegisterController.nameController,
                            decoration: InputDecoration(
                              hintText: "Your Name",
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
                            'Email',
                            fontWeight: 600,
                          ),
                          TextFormField(
                            controller:
                                estateRegisterController.emailController,
                            decoration: InputDecoration(
                              hintText: "Your email id",
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
                                estateRegisterController.passwordController,
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(fontSize: 12),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              contentPadding: MySpacing.fromLTRB(0, 8, 4, 20),
                              suffixIcon: InkWell(
                                onTap: estateRegisterController
                                    .onChangeShowPassword,
                                child: Icon(
                                  estateRegisterController.showPassword
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
                            maxLines: 1,
                            cursorColor: customTheme.estatePrimary,
                            autofocus: true,
                          ),
                          MySpacing.height(32),
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
                              "REGISTER",
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
                                          EstateLoginScreen()),
                                );
                              },
                              splashColor:
                                  customTheme.estatePrimary.withAlpha(40),
                              child: MyText.labelMedium(
                                  "I already have an account",
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
