import 'package:flutkit/full_apps/other/dating/controllers/splash_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatingSplashScreen extends StatefulWidget {
  const DatingSplashScreen({Key? key}) : super(key: key);

  @override
  _DatingSplashScreenState createState() => _DatingSplashScreenState();
}

class _DatingSplashScreenState extends State<DatingSplashScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;
  late DatingSplashController controller;

  @override
  void initState() {
    super.initState();

    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    // FxControllerStore.resetStore();

    controller = DatingSplashController();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DatingSplashController>(
        tag: 'dating_splash_controller',
        init: controller,
        builder: (controller) {
          return Theme(
            data: theme.copyWith(
                colorScheme: theme.colorScheme.copyWith(
                    secondary: customTheme.datingPrimary.withAlpha(80))),
            child: Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/apps/dating/splash.png'),
                  ),
                  MyText.headlineMedium(
                    'Find your \nBest matches',
                    fontWeight: 600,
                    textAlign: TextAlign.center,
                    fontSize: 28,
                    letterSpacing: 0,
                  ),
                  MySpacing.height(32),
                  Container(
                    margin: MySpacing.x(40),
                    child: MyButton.block(
                      onPressed: () {
                        controller.goToHomeScreen();
                      },
                      padding: MySpacing.y(20),
                      elevation: 0,
                      splashColor: customTheme.datingOnPrimary.withAlpha(60),
                      borderRadiusAll: 4,
                      backgroundColor: customTheme.datingPrimary,
                      child: MyText.bodyMedium(
                        'Find Someone',
                        color: customTheme.datingOnPrimary,
                        fontWeight: 600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
