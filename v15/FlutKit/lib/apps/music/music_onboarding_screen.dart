/*
* File : Music Onboarding
* Version : 1.0.0
* */

import 'package:flutkit/apps/music/music_login_screen.dart';
import 'package:flutkit/helpers/theme/app_notifier.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_on_boarding.dart';
import 'package:flutkit/helpers/widgets/my_pages.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MusicOnboardingScreen extends StatefulWidget {
  @override
  _MusicOnboardingScreenState createState() => _MusicOnboardingScreenState();
}

class _MusicOnboardingScreenState extends State<MusicOnboardingScreen> {
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
              body: Container(
                  height: double.infinity,
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
                                    './assets/illustration/music/illu-1.png'),
                                width: 300,
                                height: 320,
                              )),
                              SizedBox(height: 30),
                              MyText.bodyLarge(
                                  'Play lots of songs\naround the world',
                                  fontWeight: 600),
                              SizedBox(height: 16),
                              MyText.bodyMedium(
                                  'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                                  color: theme.colorScheme.onBackground
                                      .withAlpha(200),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Center(
                                  child: Image(
                                image: AssetImage(
                                    './assets/illustration/music/illu-2.png'),
                                width: 300,
                                height: 320,
                              )),
                              SizedBox(height: 30),
                              MyText.bodyLarge(
                                  'Play songs\nwith beautiful player',
                                  fontWeight: 600),
                              SizedBox(height: 16),
                              MyText.bodyMedium(
                                  'Lorem ipsum dolor sit amet, consect adipiing elit, sed do eiusmod tempor incididunt ut labore et.',
                                  color: theme.colorScheme.onBackground
                                      .withAlpha(200),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MusicLoginScreen()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: MyText.titleSmall("DONE".toUpperCase(),
                            color: theme.colorScheme.primary,
                            fontWeight: 700,
                            letterSpacing: 0.6),
                      ),
                    ),
                    skipWidget: InkWell(
                      splashColor: theme.colorScheme.secondary,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MusicLoginScreen()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: MyText.titleSmall("Skip".toUpperCase(),
                            color: theme.colorScheme.secondary,
                            fontWeight: 700,
                            letterSpacing: 0.6),
                      ),
                    ),
                  ))));
    });
  }
}
