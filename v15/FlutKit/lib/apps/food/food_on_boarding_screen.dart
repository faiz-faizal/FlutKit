import 'package:flutkit/apps/food/food_login_screen.dart';
import 'package:flutkit/helpers/theme/app_notifier.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_pages.dart';
import 'package:flutkit/helpers/widgets/my_on_boarding.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodOnboardingScreen extends StatefulWidget {
  @override
  _FoodOnboardingScreenState createState() => _FoodOnboardingScreenState();
}

class _FoodOnboardingScreenState extends State<FoodOnboardingScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
        builder: (BuildContext context, AppNotifier value, Widget? child) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              body: MyOnBoarding(
            pages: <PageViewModel>[
              PageViewModel(
                theme.colorScheme.background,
                Padding(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Center(
                          child: Image(
                        image:
                            AssetImage('./assets/illustration/food/illu-1.png'),
                        width: 300,
                        height: 320,
                      )),
                      SizedBox(height: 30.0),
                      MyText.bodyLarge('The French Runner', fontWeight: 600),
                      SizedBox(height: 15.0),
                      MyText.bodyMedium(
                        'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                        color: theme.colorScheme.onBackground.withAlpha(200),
                        letterSpacing: 0.1,
                        fontWeight: 500,
                      ),
                    ],
                  ),
                ),
              ),
              PageViewModel(
                theme.colorScheme.background,
                Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Center(
                          child: Image(
                        image:
                            AssetImage('./assets/illustration/food/illu-2.png'),
                        width: 300,
                        height: 320,
                      )),
                      SizedBox(height: 30.0),
                      MyText.bodyLarge('Dinner service', fontWeight: 600),
                      SizedBox(height: 15.0),
                      MyText.bodyMedium(
                          'Lorem ipsum dolor sit amet, consect adipiing elit, sed do eiusmod tempor incididunt ut labore et.',
                          color: theme.colorScheme.onBackground.withAlpha(200),
                          letterSpacing: 0.1,
                          fontWeight: 500),
                    ],
                  ),
                ),
              ),
              PageViewModel(
                theme.colorScheme.background,
                Padding(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                          child: Image(
                        image:
                            AssetImage('./assets/illustration/food/illu-3.png'),
                        width: 300,
                        height: 320,
                      )),
                      SizedBox(height: 30),
                      MyText.bodyLarge('Food delivery\nat a snap',
                          fontWeight: 600),
                      SizedBox(height: 15.0),
                      MyText.bodyMedium(
                          'Lorem ipsum dolor sit amet, consect adicing elit, sed do eiusmod tempor incididunt ut labore et.',
                          color: theme.colorScheme.onBackground.withAlpha(200),
                          letterSpacing: 0.1,
                          fontWeight: 500),
                    ],
                  ),
                ),
              ),
            ],
            unSelectedIndicatorColor: theme.colorScheme.secondary,
            selectedIndicatorColor: theme.colorScheme.primary,
            doneWidget: InkWell(
              splashColor: theme.colorScheme.secondary,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FoodLoginScreen()));
              },
              child: Container(
                padding: EdgeInsets.all(8),
                child: MyText.titleSmall("DONE".toUpperCase(),
                    color: theme.colorScheme.primary, fontWeight: 700),
              ),
            ),
            skipWidget: InkWell(
              splashColor: theme.colorScheme.secondary,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FoodLoginScreen()));
              },
              child: Container(
                padding: EdgeInsets.all(8),
                child: MyText.titleSmall("Skip".toUpperCase(),
                    color: theme.colorScheme.secondary, fontWeight: 700),
              ),
            ),
          )));
    });
  }
}
