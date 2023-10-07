import 'package:flutkit/style/MyCard.dart';
import 'package:flutkit/utils/Generator.dart';
import 'package:flutkit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppNotifier.dart';
import '../../AppTheme.dart';

class CourseNotificationScreen extends StatefulWidget {
  @override
  _CourseNotificationScreenState createState() =>
      _CourseNotificationScreenState();
}

class _CourseNotificationScreenState extends State<CourseNotificationScreen> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget child) {
        int themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Container(
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: customAppTheme.bgLayer1,
            ),
            padding: Spacing.all(16),
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            MdiIcons.chevronLeft,
                            color: themeData.colorScheme.onBackground,
                            size: 24,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Container(
                            child: Text(
                              "Notification",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText1,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 600),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            MdiIcons.notificationClearAll,
                            size: 24,
                            color: themeData.colorScheme.onBackground,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Spacing.height(16),
                singleAnnouncement(
                    title: "Exam Reading Week",
                    desc: Generator.getDummyText(14),
                    date: "19 - 24 May 2021",
                    time: "-",
                    venue: "At Class"),
                Spacing.height(16),
                singleAnnouncement(
                    title: "National Science Day",
                    desc: Generator.getDummyText(28),
                    date: "Sunday, 28 Feb 2021",
                    time: "8:00",
                    venue: "At Auditorium"),
                Spacing.height(16),
                singleAnnouncement(
                    title: "Foundation day",
                    desc: Generator.getDummyText(14),
                    date: "Tuesday, 12 May 2021",
                    time: "10:30",
                    venue: "At Ground"),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget singleAnnouncement(
      {String title, String date, String time, String venue, String desc}) {
    return MyCard(
      paddingAll: 0,
      shadow: MyShadow(
        position: ShadowPosition.center,
        elevation: 12
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: Spacing.nBottom(16),
            child: Text(
              title,
              style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                  color: themeData.colorScheme.onBackground, fontWeight: 600),
            ),
          ),
          Spacing.height(8),
          Container(
            padding: Spacing.x(16),
            child: Text(
              desc,
              style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                  color: themeData.colorScheme.onBackground,
                  letterSpacing: 0.3,
                  fontWeight: 500,
                  height: 1.7),
            ),
          ),
          Spacing.height(16),
          Divider(
            height: 0,
          ),
          Container(
            padding: Spacing.nBottom(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  date,
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                      color: themeData.colorScheme.primary),
                ),
                Text(
                  time,
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                      color: themeData.colorScheme.primary),
                ),
              ],
            ),
          ),
          Spacing.height(4),
          Container(
            padding: Spacing.nTop(16),
            child: Text(
              venue,
              style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                  color: themeData.colorScheme.onBackground.withAlpha(160),
                  fontWeight: 500),
            ),
          )
        ],
      ),
    );
  }
}
