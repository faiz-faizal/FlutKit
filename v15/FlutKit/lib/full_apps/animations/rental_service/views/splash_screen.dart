import 'package:flutkit/full_apps/animations/rental_service/controllers/splash_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late ThemeData theme;
  late SplashController controller;
  late OutlineInputBorder outlineInputBorder;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.rentalServiceTheme;
    controller = SplashController();
    outlineInputBorder = OutlineInputBorder(
      borderRadius:
          BorderRadius.all(Radius.circular(Constant.containerRadius.medium)),
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: controller,
        tag: 'rental_splash',
        // theme: theme,
        builder: (controller) {
          return Scaffold(
            body: Padding(
              padding: MySpacing.fromLTRB(
                  20, MySpacing.safeAreaTop(context) + 20, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  image(),
                  MySpacing.height(32),
                  MyText.headlineSmall(
                    "Book Car in Easy Steps",
                    fontWeight: 700,
                  ),
                  MySpacing.height(12),
                  MyText.bodySmall(
                    "Renting a car brings you freedom, and we'll help you find the best car for you at a great price.",
                  ),
                  MySpacing.height(12),
                  stars(),
                  MySpacing.height(12),
                  Expanded(
                    child: MyText.bodySmall(
                      "Trust by 10 million customers.",
                      xMuted: true,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MyButton.outlined(
                          borderColor: theme.dividerColor,
                          borderRadiusAll: Constant.buttonRadius.small,
                          onPressed: () {
                            controller.goToLoginScreen();
                          },
                          padding: MySpacing.y(12),
                          child: MyText.labelLarge(
                            "Sign In",
                          ),
                        ),
                      ),
                      MySpacing.width(20),
                      Expanded(
                        child: MyButton.small(
                          padding: MySpacing.y(20),
                          borderRadiusAll: Constant.buttonRadius.small,
                          onPressed: () {
                            controller.goToRegisterScreen();
                          },
                          elevation: 0,
                          child: MyText.labelLarge(
                            "Register",
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget image() {
    return MyContainer(
      paddingAll: 0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadiusAll: Constant.containerRadius.large,
      child: Image(
        height: 400,
        fit: BoxFit.cover,
        image: AssetImage(
            "assets/images/full_apps/rental_service/images/splash.jpg"),
      ),
    );
  }

  Widget stars() {
    List<Widget> list = [];

    for (int i = 0; i < 5; i++) {
      list.add(
        MyContainer(
          paddingAll: 4,
          margin: MySpacing.right(8),
          color: theme.colorScheme.primary,
          borderRadiusAll: Constant.containerRadius.small,
          child: Icon(
            Icons.star,
            size: 16,
            color: theme.colorScheme.onPrimary,
          ),
        ),
      );
    }

    return Row(
      children: list,
    );
  }
}
