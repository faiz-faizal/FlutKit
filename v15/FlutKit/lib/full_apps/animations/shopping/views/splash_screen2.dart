import 'package:flutkit/full_apps/animations/shopping/controllers/splash_screen2_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  _SplashScreen2State createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  late ThemeData theme;

  late SplashScreen2Controller controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.shoppingTheme;

    controller = SplashScreen2Controller();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreen2Controller>(
        init: controller,
        tag: 'splash_screen2_controller',
        builder: (controller) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: "splash_username",
                    child: MyText.titleLarge(
                      "Hey Nency,",
                      fontWeight: 700,
                    ),
                  ),
                  MyText.bodySmall(
                    "Wait here, we are fetching data",
                  ),
                ],
              ),
            ),
          );
        });
  }
}
