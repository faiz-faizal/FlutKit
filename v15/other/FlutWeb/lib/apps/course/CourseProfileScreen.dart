import 'package:flutkit/style/MyCard.dart';
import 'package:flutkit/style/MyCol.dart';
import 'package:flutkit/style/MyContainer.dart';
import 'package:flutkit/style/MyRow.dart';
import 'package:flutkit/style/ScreenMedia.dart';
import 'package:flutkit/utils/Generator.dart';
import 'package:flutkit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppNotifier.dart';
import '../../AppTheme.dart';

class CourseProfileScreen extends StatefulWidget {
  @override
  _CourseProfileScreenState createState() => _CourseProfileScreenState();
}

class _CourseProfileScreenState extends State<CourseProfileScreen> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  String _upgradeText;

  @override
  void initState() {
    super.initState();
    _upgradeText = Generator.getDummyText(12);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget child) {
        int themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);
        return SafeArea(
          child: Scaffold(
              body: Container(
                  color: customAppTheme.bgLayer1,
                  child: ListView(
                    padding: Spacing.xy(8,16),
                    children: <Widget>[
                      MyRow(
                        wrapAlignment: WrapAlignment.center,
                        children: [
                          MyCol(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                            child: Image(
                                              image: AssetImage(
                                                  './assets/images/avatar-3.jpg'),
                                              width: 48,
                                              height: 48,
                                            )),
                                      ),
                                      Spacing.width(16),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Denise Andrew",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.bodyText1,
                                                color: themeData
                                                    .colorScheme.onBackground,
                                                fontWeight: 600),
                                          ),
                                          Text(
                                            "Regular profile",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.caption,
                                                color: themeData
                                                    .colorScheme.onBackground,
                                                muted: true,
                                                fontWeight: 600),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Spacing.height(16),
                                upgradeWidget(),
                                Spacing.height(16),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Progress",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 600,
                                          letterSpacing: 0.25),
                                    ),
                                    Spacing.height(16),
                                    progressWidget(
                                        title: "Download - Flutter Lesson 1",
                                        progress: 48,
                                        iconData: MdiIcons.play),
                                    Spacing.height(16),
                                    progressWidget(
                                        title: "Download - Flutter Lesson 2"
                                            "",
                                        progress: 64,
                                        iconData: MdiIcons.pause),
                                    Spacing.height(16),
                                    progressWidget(
                                        title: "Download - Flutter Lesson 3"
                                            "",
                                        progress: 0,
                                        iconData: MdiIcons.download),
                                  ],
                                )
                              ],
                            ),
                            flex: {
                              ScreenMediaType.SM: 20,
                              ScreenMediaType.MD: 16,
                              ScreenMediaType.LG: 12,
                              ScreenMediaType.XL: 8,
                            },
                          )
                        ],
                      ),
                    ],
                  ))),
        );
      },
    );
  }

  Widget upgradeWidget() {
    return MyContainer(
      color: themeData.colorScheme.primary,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              "Upgrade\nYour Account",
              style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                  fontWeight: 700, color: themeData.colorScheme.onPrimary),
            ),
          ),
          Container(
            margin: Spacing.top(8),
            child: Text(
              _upgradeText,
              style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                  color: themeData.colorScheme.onPrimary.withAlpha(160),
                  height: 1.2),
            ),
          ),
          Container(
            margin: Spacing.top(16),
            padding: Spacing.fromLTRB(12, 6, 12, 6),
            decoration: BoxDecoration(
              color: customAppTheme.colorInfo,
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
            child: Text(
              "Upgrade",
              style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                  color: customAppTheme.onInfo),
            ),
          ),
        ],
      ),
    );
  }

  Widget progressWidget({String title, int progress, IconData iconData}) {
    return MyCard(
      shadow: MyShadow(
        elevation: 4
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                  ),
                  Container(
                    margin: Spacing.top(8),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Generator.buildProgress(
                              progress: progress.toDouble(),
                              activeColor: customAppTheme.colorInfo,
                              inactiveColor: themeData.colorScheme.onBackground.withAlpha(24)),
                        ),
                        Container(
                          margin: Spacing.left(16),
                          child: Text(
                            progress.toString() + "%",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.caption,
                                color: themeData.colorScheme.onBackground,
                                muted: true,
                                fontWeight: 600,
                                letterSpacing: 0.5),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Spacing.width(16),
          Container(
            padding: Spacing.all(8),
            decoration: BoxDecoration(
                color: themeData.colorScheme.primary, shape: BoxShape.circle),
            child: Icon(
              iconData,
              color: themeData.colorScheme.onPrimary,
              size: 20,
            ),
          )
        ],
      ),
    );
  }
}
