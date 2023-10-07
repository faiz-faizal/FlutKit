import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/generator.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CourseNotificationScreen extends StatefulWidget {
  @override
  _CourseNotificationScreenState createState() =>
      _CourseNotificationScreenState();
}

class _CourseNotificationScreenState extends State<CourseNotificationScreen> {
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
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              LucideIcons.chevronLeft,
              color: theme.colorScheme.onBackground,
              size: 20,
            ),
          ),
          title: MyText.bodyLarge("Notification",
              color: theme.colorScheme.onBackground, fontWeight: 600),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                LucideIcons.x,
                size: 24,
                color: theme.colorScheme.onBackground,
              ),
            ),
            MySpacing.width(20)
          ],
        ),
        body: ListView(
          padding: MySpacing.bottom(16),
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  margin: MySpacing.fromLTRB(24, 0, 24, 0),
                  child: singleAnnouncement(
                      title: "Exam Reading Week",
                      desc: Generator.getDummyText(14),
                      date: "19 - 24 May 2021",
                      time: "-",
                      venue: "At Class"),
                ),
                Container(
                  margin: MySpacing.fromLTRB(24, 24, 24, 0),
                  child: singleAnnouncement(
                      title: "National Science Day",
                      desc: Generator.getDummyText(28),
                      date: "Sunday, 28 Feb 2021",
                      time: "8:00",
                      venue: "At Auditorium"),
                ),
                Container(
                  margin: MySpacing.fromLTRB(24, 24, 24, 0),
                  child: singleAnnouncement(
                      title: "Foundation day",
                      desc: Generator.getDummyText(14),
                      date: "Tuesday, 12 May 2021",
                      time: "10:30",
                      venue: "At Ground"),
                )
              ],
            )
          ],
        ));
  }

  Widget singleAnnouncement(
      {required String title,
      required String date,
      required String time,
      required String venue,
      required String desc}) {
    return MyContainer.bordered(
      padding: MySpacing.vertical(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: MySpacing.horizontal(24),
            child: MyText.titleSmall(title,
                color: theme.colorScheme.onBackground, fontWeight: 600),
          ),
          Container(
            padding: MySpacing.horizontal(24),
            margin: MySpacing.top(4),
            child: MyText.bodyMedium(desc,
                color: theme.colorScheme.onBackground,
                letterSpacing: 0.3,
                fontWeight: 500,
                height: 1.7),
          ),
          Container(
              margin: MySpacing.top(16),
              child: Divider(
                height: 0,
              )),
          Container(
            padding: MySpacing.only(left: 24, right: 24, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MyText.bodyMedium(date, color: theme.colorScheme.primary),
                MyText.bodyMedium(time, color: theme.colorScheme.primary),
              ],
            ),
          ),
          Container(
            margin: MySpacing.top(4),
            padding: MySpacing.horizontal(24),
            child: MyText.bodyMedium(venue,
                color: theme.colorScheme.onBackground.withAlpha(160),
                fontWeight: 500),
          )
        ],
      ),
    );
  }
}
