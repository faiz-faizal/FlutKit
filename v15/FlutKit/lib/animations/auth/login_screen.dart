import 'package:flare_flutter/flare_actor.dart';
import 'package:flutkit/animations/auth/login_controller.dart';
import 'package:flutkit/animations/auth/tracking_text_input.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen>
    with TickerProviderStateMixin {
  late ThemeData theme;
  late LogInController controller;
  late OutlineInputBorder outlineInputBorder;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;

    controller = LogInController();
    outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LogInController>(
        init: controller,
        tag: 'log_in_controller',
        builder: (controller) {
          return Scaffold(
            body: ListView(
              padding: MySpacing.fromLTRB(
                  20, MySpacing.safeAreaTop(context) + 64, 20, 20),
              children: [
                Container(
                    height: 200,
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: FlareActor(
                      "assets/animations/rive/teddy.flr",
                      shouldClip: false,
                      alignment: Alignment.bottomCenter,
                      fit: BoxFit.contain,
                      controller: controller.teddyController,
                    )),
                Form(
                  key: controller.formKey,
                  child: MyContainer.bordered(
                    color: theme.colorScheme.background,
                    child: Column(
                      children: [
                        MyText.headlineSmall(
                          'Hello Again!',
                          fontWeight: 700,
                          textAlign: TextAlign.center,
                        ),
                        MySpacing.height(20),
                        TrackingTextInput(
                          style: MyTextStyle.bodyMedium(),
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              filled: true,
                              isDense: true,
                              fillColor: theme.cardTheme.color,
                              prefixIcon: Icon(
                                LucideIcons.mail,
                                color: theme.colorScheme.onBackground,
                              ),
                              hintText: "Email Address",
                              enabledBorder: outlineInputBorder,
                              focusedBorder: outlineInputBorder,
                              border: outlineInputBorder,
                              contentPadding: MySpacing.all(16),
                              hintStyle: MyTextStyle.bodyMedium(),
                              isCollapsed: true),
                          controller: controller.emailTE,
                          validator: controller.validateEmail,
                          cursorColor: theme.colorScheme.onBackground,
                          focusNode: controller.emailNode,
                          onCaretMoved: (offset) {
                            controller.onCaretMoved(offset);
                          },
                        ),
                        MySpacing.height(20),
                        TrackingTextInput(
                          style: MyTextStyle.bodyMedium(),
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              filled: true,
                              isDense: true,
                              fillColor: theme.cardTheme.color,
                              prefixIcon: Icon(
                                LucideIcons.lock,
                                color: theme.colorScheme.onBackground,
                              ),
                              hintText: "Password",
                              enabledBorder: outlineInputBorder,
                              focusedBorder: outlineInputBorder,
                              border: outlineInputBorder,
                              contentPadding: MySpacing.all(16),
                              hintStyle: MyTextStyle.bodyMedium(),
                              isCollapsed: true),
                          controller: controller.passwordTE,
                          focusNode: controller.passwordNode,
                          validator: controller.validatePassword,
                          cursorColor: theme.colorScheme.onBackground,
                        ),
                        MySpacing.height(20),
                        MyButton.block(
                          elevation: 0,
                          borderRadiusAll: 4,
                          onPressed: () {
                            controller.login();
                          },
                          padding: MySpacing.y(20),
                          splashColor:
                              theme.colorScheme.onPrimary.withAlpha(28),
                          backgroundColor: theme.colorScheme.primary,
                          child: MyText.labelMedium(
                            "Sign In",
                            fontWeight: 600,
                            color: theme.colorScheme.onPrimary,
                            letterSpacing: 0.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
