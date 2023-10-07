/*
* File : Shopping Onboarding
* Version : 1.0.0
* */

import 'package:flutkit/apps/shopping/shopping_login_screen.dart';
import 'package:flutkit/helpers/theme/app_notifier.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_on_boarding.dart';
import 'package:flutkit/helpers/widgets/my_pages.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingOnboardingScreen extends StatefulWidget {
  @override
  _ShoppingOnboardingScreenState createState() =>
      _ShoppingOnboardingScreenState();
}

class _ShoppingOnboardingScreenState extends State<ShoppingOnboardingScreen> {
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
          builder: (context, child) {
            return Directionality(
              textDirection: AppTheme.textDirection,
              child: child!,
            );
          },
          home: Scaffold(
              body: Container(
                  height: MediaQuery.of(context).size.height,
                  color: theme.colorScheme.background,
                  child: MyOnBoarding(
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
                                image: AssetImage(
                                    './assets/illustration/shopping/illu-1.png'),
                                width: 300,
                                height: 320,
                              )),
                              SizedBox(height: 30),
                              MyText.bodyLarge(
                                  'Find lots of product\naround the world',
                                  fontWeight: 700),
                              SizedBox(height: 16),
                              MyText(
                                  'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Center(
                                  child: Image(
                                image: AssetImage(
                                    './assets/illustration/shopping/illu-2.png'),
                                width: 300,
                                height: 320,
                              )),
                              SizedBox(height: 30),
                              MyText.bodyLarge('Secure payment\nwith SSL ',
                                  fontWeight: 700),
                              SizedBox(height: 16),
                              MyText.bodyMedium(
                                  'Lorem ipsum dolor sit amet, consect adipiing elit, sed do eiusmod tempor incididunt ut labore et.',
                                  fontWeight: 500)
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
                                image: AssetImage(
                                    './assets/illustration/shopping/illu-3.png'),
                                width: 300,
                                height: 320,
                              )),
                              SizedBox(height: 30),
                              MyText.bodyLarge('Fast delivery\nat a snap',
                                  fontWeight: 700),
                              SizedBox(height: 16),
                              MyText.bodyMedium(
                                  'Lorem ipsum dolor sit amet, consect adicing elit, sed do eiusmod tempor incididunt ut labore et.',
                                  fontWeight: 500),
                            ],
                          ),
                        ),
                      ),
                    ],
                    unSelectedIndicatorColor:
                        theme.colorScheme.primary.withAlpha(150),
                    selectedIndicatorColor: theme.colorScheme.primary,
                    doneWidget: InkWell(
                      splashColor: theme.colorScheme.primary,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShoppingLoginScreen()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: MyText.titleSmall("DONE".toUpperCase(),
                            fontWeight: 700, color: theme.colorScheme.primary),
                      ),
                    ),
                    skipWidget: InkWell(
                      splashColor: theme.colorScheme.primary,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShoppingLoginScreen()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: MyText.titleSmall("Skip".toUpperCase(),
                            color: theme.colorScheme.primary,
                            fontWeight: 700,
                            letterSpacing: 0.6),
                      ),
                    ),
                  ))));
    });
  }
}
