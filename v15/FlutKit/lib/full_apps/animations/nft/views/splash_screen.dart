import 'package:flutkit/full_apps/animations/nft/controllers/splash_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
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

  @override
  void initState() {
    super.initState();
    theme = AppTheme.nftTheme;
    controller = SplashController();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        tag: 'splash_controller',
        init: controller,
        // theme: theme,
        builder: (controller) {
          return Scaffold(
            body: Padding(
              padding: MySpacing.fromLTRB(
                  20, MySpacing.safeAreaTop(context) + 32, 20, 0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    image(),
                    MySpacing.height(40),
                    MyText.titleLarge(
                      "Hey! Welcome",
                      fontWeight: 800,
                    ),
                    MySpacing.height(20),
                    MyText.bodyMedium(
                      "This is a best-fit app to invest in Cryptocurrency for beginners and do trading.",
                      textAlign: TextAlign.center,
                    ),
                    MySpacing.height(20),
                    register(),
                    MySpacing.height(20),
                    login(),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget image() {
    return Image(
      height: 120,
      width: 120,
      color: theme.colorScheme.primary,
      image: AssetImage('assets/images/full_apps/nft/icons/splash.png'),
    );
  }

  Widget register() {
    return MyButton.block(
      onPressed: () {
        controller.goToRegisterScreen();
      },
      padding: MySpacing.y(20),
      borderRadiusAll: 4,
      elevation: 0,
      child: MyText.labelLarge(
        "Get Started",
        color: theme.colorScheme.onPrimary,
        fontWeight: 600,
      ),
    );
  }

  Widget login() {
    return MyButton.block(
      onPressed: () {
        controller.goToLoginScreen();
      },
      elevation: 0,
      padding: MySpacing.y(20),
      borderRadiusAll: 4,
      backgroundColor: theme.cardTheme.color,
      child: MyText.labelLarge(
        "I already have an account",
        color: theme.colorScheme.onBackground,
        fontWeight: 600,
      ),
    );
  }
}
