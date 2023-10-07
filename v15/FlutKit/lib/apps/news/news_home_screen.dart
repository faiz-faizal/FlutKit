import 'package:flutkit/apps/news/single_news_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class NewsHomeScreen extends StatefulWidget {
  @override
  _NewsHomeScreenState createState() => _NewsHomeScreenState();
}

class _NewsHomeScreenState extends State<NewsHomeScreen> {
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
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: MySpacing.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  ClipRRect(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    child: Image(
                      image: AssetImage('./assets/images/profile/avatar_2.jpg'),
                      height: 36,
                      width: 36,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  MyText.bodyMedium("19 Jan, 2020",
                      color: theme.colorScheme.onBackground, fontWeight: 400)
                ],
              ),
              Container(
                margin: MySpacing.top(16),
                child: MyText.headlineMedium("Breaking News",
                    color: theme.colorScheme.onBackground, fontWeight: 800),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SingleNewsScreen()));
                },
                child: Container(
                  margin: MySpacing.top(24),
                  decoration: BoxDecoration(
                      color: customTheme.card,
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      boxShadow: [
                        BoxShadow(
                            color: customTheme.shadowColor.withAlpha(120),
                            blurRadius: 24,
                            spreadRadius: 4)
                      ]),
                  child: Column(
                    children: [
                      ClipRRect(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        child: Image(
                          image: AssetImage('./assets/images/all/all-l2.jpg'),
                        ),
                      ),
                      Container(
                        padding: MySpacing.all(16),
                        child: Column(
                          children: [
                            MyText.titleLarge(
                                "14 Passengers Banned By Nona Airlines After bad Behaviour",
                                color: theme.colorScheme.onBackground,
                                fontWeight: 600),
                            Container(
                              margin: MySpacing.top(16),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(14)),
                                    child: Image(
                                      image: AssetImage(
                                          './assets/images/profile/avatar_2.jpg'),
                                      height: 28,
                                      width: 28,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  MyText.bodySmall("John smith",
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 600,
                                      xMuted: true),
                                  Expanded(child: Container()),
                                  MyText.bodySmall("10 Jan, 2020",
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 500,
                                      xMuted: true),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SingleNewsScreen()));
                },
                child: Container(
                  margin: MySpacing.top(24),
                  child: Row(
                    children: [
                      ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        child: Image(
                          image: AssetImage('./assets/images/all/all-l2.jpg'),
                          width: 90,
                          height: 72,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            MyText.bodyMedium(
                                "An illinois town fights to save its power plant",
                                color: theme.colorScheme.onBackground,
                                fontWeight: 600),
                            Container(
                              margin: MySpacing.top(8),
                              child: Row(
                                children: [
                                  Icon(
                                    LucideIcons.calendar,
                                    color: theme.colorScheme.onBackground
                                        .withAlpha(160),
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  MyText.labelSmall("Jan 10, 2021",
                                      color: theme.colorScheme.onBackground,
                                      letterSpacing: 0,
                                      muted: true),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Icon(
                                    LucideIcons.clock,
                                    color: theme.colorScheme.onBackground
                                        .withAlpha(160),
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  MyText.labelSmall("10 min read",
                                      color: theme.colorScheme.onBackground,
                                      letterSpacing: 0,
                                      muted: true),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SingleNewsScreen()));
                },
                child: Container(
                  margin: MySpacing.top(24),
                  child: Row(
                    children: [
                      ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        child: Image(
                          image: AssetImage('./assets/images/all/all-l3.jpg'),
                          width: 90,
                          height: 72,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            MyText.bodyMedium(
                                "An illinois town fights to save its power plant",
                                color: theme.colorScheme.onBackground,
                                fontWeight: 600),
                            Container(
                              margin: MySpacing.top(8),
                              child: Row(
                                children: [
                                  Icon(
                                    LucideIcons.calendar,
                                    color: theme.colorScheme.onBackground
                                        .withAlpha(160),
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  MyText.labelSmall("Jan 10, 2021",
                                      color: theme.colorScheme.onBackground,
                                      letterSpacing: 0,
                                      muted: true),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Icon(
                                    LucideIcons.clock,
                                    color: theme.colorScheme.onBackground
                                        .withAlpha(160),
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  MyText.labelSmall("10 min read",
                                      color: theme.colorScheme.onBackground,
                                      letterSpacing: 0,
                                      muted: true),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: MySpacing.top(24),
                child: Row(
                  children: [
                    ClipRRect(
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      child: Image(
                        image: AssetImage('./assets/images/all/all-l1.jpg'),
                        width: 90,
                        height: 72,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          MyText.bodyMedium(
                              "An illinois town fights to save its power plant",
                              color: theme.colorScheme.onBackground,
                              fontWeight: 600),
                          Container(
                            margin: MySpacing.top(8),
                            child: Row(
                              children: [
                                Icon(
                                  LucideIcons.calendar,
                                  color: theme.colorScheme.onBackground
                                      .withAlpha(160),
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                MyText.labelSmall("Jan 10, 2021",
                                    color: theme.colorScheme.onBackground,
                                    letterSpacing: 0,
                                    muted: true),
                                SizedBox(
                                  width: 16,
                                ),
                                Icon(
                                  LucideIcons.clock,
                                  color: theme.colorScheme.onBackground
                                      .withAlpha(160),
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                MyText.labelSmall("10 min read",
                                    color: theme.colorScheme.onBackground,
                                    letterSpacing: 0,
                                    muted: true),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
