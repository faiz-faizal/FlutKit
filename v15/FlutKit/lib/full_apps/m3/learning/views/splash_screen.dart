import 'package:flutkit/full_apps/m3/learning/controllers/splash_controller.dart';
import 'package:flutkit/helpers/theme/app_notifier.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    theme = AppTheme.learningTheme;
    // FxControllerStore.resetStore();
    controller = SplashController();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
        builder: (BuildContext context, AppNotifier value, Widget? child) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme.copyWith(
              colorScheme: theme.colorScheme
                  .copyWith(secondary: theme.colorScheme.primaryContainer)),
          builder: (context, child) {
            return Directionality(
                textDirection: AppTheme.textDirection, child: child!);
          },
          home: Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyContainer(
                  margin: MySpacing.x(20),
                  color: theme.colorScheme.primaryContainer,
                  borderRadiusAll: Constant.containerRadius.medium,
                  child: Image(
                    image: AssetImage(Images.learningSplash),
                  ),
                ),
                MySpacing.height(48),
                MyText.displayLarge('Nourish your \ninner skills',
                    fontWeight: 700, textAlign: TextAlign.center),
                MySpacing.height(20),
                MyText.bodyMedium(
                  'Choose your favorite course and start learning.',
                  xMuted: true,
                  textAlign: TextAlign.center,
                ),
                MySpacing.height(20),
                Container(
                  margin: MySpacing.x(20),
                  child: MyButton.block(
                    onPressed: () {
                      controller.goToLogInScreen();
                    },
                    padding: MySpacing.y(20),
                    backgroundColor: theme.colorScheme.primary,
                    splashColor: theme.colorScheme.onPrimary.withAlpha(30),
                    elevation: 0,
                    borderRadiusAll: Constant.buttonRadius.large,
                    child: MyText.labelLarge(
                      'Get Started',
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
