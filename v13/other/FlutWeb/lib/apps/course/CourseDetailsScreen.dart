import 'package:flutkit/style/MyCard.dart';
import 'package:flutkit/style/MyCol.dart';
import 'package:flutkit/style/MyContainer.dart';
import 'package:flutkit/style/MyRow.dart';
import 'package:flutkit/style/ScreenMedia.dart';
import 'package:flutkit/utils/Generator.dart';
import 'package:flutkit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppNotifier.dart';
import '../../AppTheme.dart';

class CourseDetailsScreen extends StatefulWidget {
  @override
  _CourseDetailsScreenState createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  bool isFav = false, isBookmark = false;

  String _descText;

  @override
  void initState() {
    super.initState();
    _descText = Generator.getDummyText(24, withTab: true);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget child) {
        int themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);
        return SafeArea(
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.getThemeFromThemeMode(themeType),
              home: Scaffold(
                  body: Container(
                      color: customAppTheme.bgLayer1,
                      child: ListView(
                        padding: Spacing.y(24),
                        children: [
                          MyRow(
                            wrapAlignment: WrapAlignment.center,
                            defaultFlex: {
                              ScreenMediaType.SM: 20,
                              ScreenMediaType.MD: 16,
                              ScreenMediaType.LG: 12,
                              ScreenMediaType.XL: 8,},
                            children: [
                              MyCol(
                                  child: MyCard(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    MyContainer(
                                      borderRadiusAll: 8,
                                      color: themeData.colorScheme.primary,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Icon(
                                                MdiIcons.chevronLeft,
                                                color: themeData
                                                    .colorScheme.onPrimary,
                                                size: 24,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: Spacing.top(16),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                MyContainer(
                                                  padding: Spacing.xy(8, 4),
                                                  borderRadiusAll: 4,
                                                  color: customAppTheme.colorInfo,
                                                  child: Text(
                                                    "Trending",
                                                    style: AppTheme.getTextStyle(
                                                        themeData
                                                            .textTheme.caption,
                                                        color:
                                                            customAppTheme.onInfo,
                                                        letterSpacing: 0,
                                                        fontWeight: 500),
                                                  ),
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Container(
                                                      child: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            isFav = !isFav;
                                                          });
                                                        },
                                                        child: Icon(
                                                          isFav
                                                              ? MdiIcons.heart
                                                              : MdiIcons
                                                                  .heartOutline,
                                                          color: themeData
                                                              .colorScheme
                                                              .onPrimary,
                                                          size: 22,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: Spacing.left(24),
                                                      child: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            isBookmark =
                                                                !isBookmark;
                                                          });
                                                        },
                                                        child: Icon(
                                                          isBookmark
                                                              ? MdiIcons.bookmark
                                                              : MdiIcons
                                                                  .bookmarkOutline,
                                                          color: themeData
                                                              .colorScheme
                                                              .onPrimary,
                                                          size: 22,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: Spacing.top(16),
                                            child: Text(
                                              "UI Designing",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.headline5,
                                                  fontWeight: 700,
                                                  color: themeData
                                                      .colorScheme.onPrimary),
                                            ),
                                          ),
                                          Container(
                                            margin: Spacing.top(8),
                                            child: Row(
                                              children: <Widget>[
                                                Icon(
                                                  MdiIcons.star,
                                                  size: 18,
                                                  color: themeData
                                                      .colorScheme.onPrimary,
                                                ),
                                                Container(
                                                  margin: Spacing.left(4),
                                                  child: Text(
                                                    "4.7",
                                                    style: AppTheme.getTextStyle(
                                                        themeData
                                                            .textTheme.bodyText2,
                                                        color: themeData
                                                            .colorScheme
                                                            .onPrimary,
                                                        fontWeight: 500),
                                                  ),
                                                ),
                                                Container(
                                                  margin: Spacing.left(16),
                                                  child: Icon(
                                                    MdiIcons.accountMultiple,
                                                    size: 18,
                                                    color: themeData
                                                        .colorScheme.onPrimary,
                                                  ),
                                                ),
                                                Container(
                                                  margin: Spacing.left(4),
                                                  child: Text(
                                                    "7k",
                                                    style: AppTheme.getTextStyle(
                                                        themeData
                                                            .textTheme.bodyText2,
                                                        color: themeData
                                                            .colorScheme
                                                            .onPrimary,
                                                        fontWeight: 500),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: Spacing.top(40),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Text("\$50",
                                                    style: AppTheme.getTextStyle(
                                                      themeData
                                                          .textTheme.headline5,
                                                      color: themeData
                                                          .colorScheme.onPrimary,
                                                      fontWeight: 600,
                                                      letterSpacing: 0.5,
                                                    )),
                                                Spacing.width(8),
                                                Text("\$70",
                                                    style: AppTheme.getTextStyle(
                                                        themeData
                                                            .textTheme.bodyText2,
                                                        color: themeData
                                                            .colorScheme
                                                            .onPrimary,
                                                        fontWeight: 500,
                                                        height: 2.5,
                                                        muted: true,
                                                        decoration: TextDecoration
                                                            .lineThrough)),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Spacing.height(16),
                                    Text(
                                      "Description",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle1,
                                          color:
                                              themeData.colorScheme.onBackground,
                                          fontWeight: 600),
                                    ),
                                    Spacing.height(16),
                                    Text(
                                      _descText,
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText2,
                                          color:
                                              themeData.colorScheme.onBackground,
                                          fontWeight: 500,
                                          letterSpacing: 0.3,
                                          height: 1.4),
                                    ),
                                    Spacing.height(16),
                                    Text(
                                      "Content",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle1,
                                          color:
                                              themeData.colorScheme.onBackground,
                                          fontWeight: 600),
                                    ),
                                    Spacing.height(16),
                                    Container(
                                      margin: Spacing.x(16),
                                      child: Column(
                                       children: [
                                         singleContent(
                                             title: "Welcome to the Course",
                                             time: "4:15 mins",
                                             index: "01"),
                                        Spacing.height(24),

                                         singleContent(
                                             title: "UI - Intro",
                                             time: "8:30 mins",
                                             index: "02"),
                                         Spacing.height(24),
                                         singleContent(
                                             title: "UI - Process",
                                             time: "14:15 mins",
                                             enabled: false,
                                             index: "03"),
                                         Spacing.height(24),
                                         singleContent(
                                             title: "UI - Finishing",
                                             time: "2:45 mins",
                                             enabled: false,
                                             index: "04"),
                                         Spacing.height(24),
                                         singleContent(
                                             title: "Exam",
                                             time: "30:00 mins",
                                             enabled: false,
                                             index: "05"),
                                       ],
                                      ),
                                    ),
                                    Spacing.height(24),
                                    MyContainer.bordered(
                                      color: customAppTheme.bgLayer2,
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                    padding:
                                                        MaterialStateProperty.all(
                                                            Spacing.xy(16, 16))),
                                                onPressed: () {},
                                                child: Text(
                                                  "Buy Now",
                                                  style: AppTheme.getTextStyle(
                                                      themeData
                                                          .textTheme.bodyText2,
                                                      fontWeight: 600,
                                                      color: themeData
                                                          .colorScheme.onPrimary),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Spacing.width(16),
                                          MyContainer(
                                            color: themeData.colorScheme.primary
                                                .withAlpha(40),
                                            paddingAll: 8,
                                            child: Icon(
                                              MdiIcons.shoppingOutline,
                                              size: 20,
                                              color:
                                                  themeData.colorScheme.primary,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ))
                            ],
                          )
                        ],
                      )))),
        );
      },
    );
  }

  Widget singleContent(
      {String index, String time, String title, bool enabled = true}) {
    return Row(
      children: <Widget>[
        Text(
          index,
          style: AppTheme.getTextStyle(themeData.textTheme.headline5,
              color: themeData.colorScheme.onBackground.withAlpha(80),
              fontWeight: 500),
        ),
        Expanded(
          child: Container(
            margin: Spacing.left(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  time,
                  style: AppTheme.getTextStyle(themeData.textTheme.caption,
                      color: themeData.colorScheme.onBackground, muted: true),
                ),
                Text(
                  title,
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                      color: themeData.colorScheme.onBackground,
                      fontWeight: 600),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        ),
        Opacity(
          opacity: enabled ? 1 : 0.5,
          child: Container(
            margin: Spacing.left(16),
            padding: Spacing.all(8),
            decoration: BoxDecoration(
                color: themeData.colorScheme.primary, shape: BoxShape.circle),
            child: Icon(
              MdiIcons.play,
              color: themeData.colorScheme.onPrimary,
              size: 20,
            ),
          ),
        )
      ],
    );
  }
}
