import 'package:flutkit/full_apps/m3/homemade/controllers/splash_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/theme/theme_type.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
    MyTextStyle.changeFontFamily(GoogleFonts.k2d);
    // FxControllerStore.resetStore();

    MyTextStyle.changeDefaultFontWeight({
      100: FontWeight.w100,
      200: FontWeight.w200,
      300: FontWeight.w300,
      400: FontWeight.w400,
      500: FontWeight.w500,
      600: FontWeight.w600,
      700: FontWeight.w700,
      800: FontWeight.w800,
      900: FontWeight.w900,
    });

    theme = AppTheme.homemadeTheme;
    controller = SplashController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: theme.colorScheme.primaryContainer)),
      debugShowCheckedModeBanner: false,
      home: GetBuilder<SplashController>(
          init: controller,
          tag: 'splash_controller',
          builder: (splashController) {
            return Scaffold(
              body: Stack(
                children: [
                  Opacity(
                    opacity: 0.8,
                    child: MyContainer.none(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      clipBehavior: Clip.hardEdge,
                      child: Image(
                        image: AssetImage(
                            'assets/images/apps/homemade/splash.jpg'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyText.displaySmall(
                        'Find your Products Inside',
                        fontWeight: 700,
                        color: AppTheme.themeType == ThemeType.dark
                            ? theme.colorScheme.onPrimary
                            : theme.colorScheme.primary,
                        textAlign: TextAlign.center,
                      ),
                      MySpacing.height(32),
                      Padding(
                        padding: MySpacing.horizontal(80),
                        child: MyButton.block(
                          borderRadiusAll: Constant.buttonRadius.large,
                          elevation: 0,
                          padding: MySpacing.y(20),
                          backgroundColor: theme.colorScheme.primary,
                          onPressed: () {
                            controller.goToLogin();
                          },
                          child: MyText.bodyLarge(
                            'Log In',
                            color: theme.colorScheme.onPrimary,
                            fontWeight: 700,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      MySpacing.height(24),
                      Padding(
                        padding: MySpacing.horizontal(80),
                        child: MyButton.block(
                            borderRadiusAll: Constant.buttonRadius.large,
                            elevation: 0,
                            backgroundColor: theme.colorScheme.secondary,
                            onPressed: () {
                              controller.goToRegister();
                            },
                            padding: MySpacing.y(20),
                            child: MyText.bodyLarge(
                              'Register',
                              color: theme.colorScheme.onSecondary,
                              fontWeight: 700,
                              letterSpacing: 0.5,
                            )),
                      ),
                      MySpacing.height(40),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
