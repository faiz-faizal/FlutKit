import 'package:flutkit/full_apps/other/cookify/views/login_screen.dart';
import 'package:flutkit/full_apps/other/cookify/views/register_screen.dart';
import 'package:flutkit/helpers/theme/app_notifier.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CookifySplashScreen extends StatefulWidget {
  @override
  _CookifySplashScreenState createState() => _CookifySplashScreenState();
}

class _CookifySplashScreenState extends State<CookifySplashScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();

    MyTextStyle.changeFontFamily(GoogleFonts.mali);
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
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
        builder: (BuildContext context, AppNotifier value, Widget? child) {
      theme = AppTheme.theme;
      customTheme = AppTheme.customTheme;
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme.copyWith(
            colorScheme: theme.colorScheme
                .copyWith(secondary: customTheme.cookifyPrimary.withAlpha(40))),
        home: Scaffold(
          body: Container(
            margin: MySpacing.fromLTRB(24, 100, 24, 32),
            child: Column(
              children: [
                MyText.displaySmall(
                  "Welcome to Cookify",
                  color: customTheme.cookifyPrimary,
                ),
                Expanded(
                  child: Center(
                    child: Image(
                      image: AssetImage(
                          './assets/images/apps/cookify/splash-1.png'),
                      width: 320,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: MyButton.text(
                      splashColor: customTheme.cookifyPrimary.withAlpha(40),
                      padding: MySpacing.y(8),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                              builder: (context) => CookifyRegisterScreen()),
                        );
                      },
                      child: MyText.labelLarge(
                        "SIGN UP",
                        color: customTheme.cookifyPrimary,
                        letterSpacing: 0.5,
                      ),
                    )),
                    Expanded(
                        child: MyButton(
                      elevation: 0,
                      padding: MySpacing.y(20),
                      borderRadiusAll: 4,
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                              builder: (context) => CookifyLoginScreen()),
                        );
                      },
                      backgroundColor: customTheme.cookifyPrimary,
                      child: MyText.labelLarge(
                        "LOG IN",
                        color: customTheme.cookifyOnPrimary,
                        letterSpacing: 0.5,
                      ),
                    )),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
