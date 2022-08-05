import 'package:flutkit/style/MyCard.dart';
import 'package:flutkit/style/MyCol.dart';
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
import 'CourseExamTimeScreen.dart';
import 'CourseNotificationScreen.dart';
import 'CourseSubjectScreen.dart';
import 'CourseVideoScreen.dart';

class CourseHomeScreen extends StatefulWidget {
  @override
  _CourseHomeScreenState createState() => _CourseHomeScreenState();
}

class _CourseHomeScreenState extends State<CourseHomeScreen> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget child) {
        int themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);
        return SafeArea(
          child: Scaffold(
              floatingActionButton: FloatingActionButton(
                tooltip: "Video",
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 400),
                          pageBuilder: (_, __, ___) => CourseVideoScreen()));
                },
                child: Icon(
                  MdiIcons.play,
                  size: 24,
                  color: themeData.colorScheme.onPrimary,
                ),
                backgroundColor: themeData.colorScheme.primary,
                elevation: 0,
              ),
              drawerScrimColor: Colors.transparent,
              backgroundColor: customAppTheme.bgLayer1,
              body: ListView(
                shrinkWrap: true,
                padding: Spacing.bottom(16),
                children: <Widget>[
                  Spacing.height(16),
                  Container(
                    margin: Spacing.x(16),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Text(
                              "Hello, Learner",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText1,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 600),
                            ),
                          ),
                        ),
                        Container(
                            child: InkWell(
                          onTap: () {   showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CourseNotificationScreen();
                              });
                          },
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: <Widget>[
                              Icon(
                                MdiIcons.bellOutline,
                                color: themeData.colorScheme.onBackground
                                    .withAlpha(200),
                              ),
                              Positioned(
                                right: -2,
                                top: -2,
                                child: Container(
                                  padding: EdgeInsets.all(0),
                                  height: 14,
                                  width: 14,
                                  decoration: BoxDecoration(
                                      color: themeData.colorScheme.primary,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(40))),
                                  child: Center(
                                    child: Text(
                                      "2",
                                      style: AppTheme.getTextStyle(
                                        themeData.textTheme.overline,
                                        color: themeData.colorScheme.onPrimary,
                                        fontSize: 9,
                                        fontWeight: 500,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                  Spacing.height(16),
                  Container(
                    margin: Spacing.x(8),
                    child: MyRow(
                      defaultFlex: {
                        ScreenMediaType.SM: 12,
                      },
                      children: [
                        MyCol(
                          child: announcementWidget(
                              title: "Mock Test",
                              description: Generator.getDummyText(8),
                              date: "21, July",
                              btnText: "Time Table"),
                        ),
                        MyCol(
                          child: announcementWidget(
                              title: "Math Result",
                              description: Generator.getDummyText(8),
                              date: "Tomorrow",
                              btnText: "Make as read"),
                        ),
                      ],
                    ),
                  ),
                  Spacing.height(16),
                  Container(
                    margin: Spacing.x(16),
                    child: Text(
                      "My Course",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle1,
                          color: themeData.colorScheme.onBackground,
                          fontWeight: 600),
                    ),
                  ),
                  Spacing.height(16),
                  Container(
                    margin: Spacing.x(8),
                    child: MyRow(
                      defaultFlex: {
                        ScreenMediaType.SM: 12,
                        ScreenMediaType.XL: 8,
                      },
                      children: [
                        MyCol(
                            child: singleMyCourse(
                                title: "How to make tubes and paper crafts",
                                image: './assets/images/course/art.jpg',
                                subtitle: "Arts \& Crafts",
                                progress: 0.4,
                                status: "3 of 9 lessons")),
                        MyCol(
                          child: singleMyCourse(
                              title: "Ardunio Robotics with mBot",
                              image: './assets/images/course/robot.jpg',
                              subtitle: "Robotics",
                              progress: 0.6,
                              status: "5 of 8 lessons"),
                        )
                      ],
                    ),
                  ),
                  Spacing.height(16),

                  Container(
                    margin: Spacing.x(16),
                    child: Text(
                      "Up Next",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText1,
                          color: themeData.colorScheme.onBackground,
                          fontWeight: 600),
                    ),
                  ),
                  Spacing.height(16),
                  Container(
                    margin: Spacing.x(8),
                    child: MyRow(
                      defaultFlex: {
                        ScreenMediaType.XS:6,
                        ScreenMediaType.MD:4,

                        ScreenMediaType.XL:3,
                        ScreenMediaType.XXXL:2,
                      },
                      children: [
                        MyCol(
                          child: singleVideoLecture(
                              subject: "Physics",
                              title: "Chap 1",
                              image: './assets/images/course/subject-2.jpg'),
                        ),
                        MyCol(
                          child: singleVideoLecture(
                              subject: "Biology",
                              title: "Lab 1",
                              image: './assets/images/course/biology.jpg'),
                        ),
                        MyCol(
                            child: singleVideoLecture(
                                subject: "Physics",
                                title: "Chap 2",
                                image: './assets/images/course/subject-6.jpg')),
                        MyCol(
                            child: singleVideoLecture(
                                subject: "Chemistry",
                                title: "Lab 2",
                                image: './assets/images/course/subject-2.jpg'))
                      ],
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }

  Widget singleVideoLecture({String subject, String title, String image}) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CourseVideoScreen()));
      },
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Image(
                image: AssetImage(image),

              ),
            ),
            Positioned(
              bottom: 8,
              left: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: Text(
                      subject,
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2,
                          color: Colors.white,
                          fontWeight: 600),
                    ),
                  ),
                  Spacing.height(2),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: themeData.colorScheme.background,
                            shape: BoxShape.circle),
                        child: Icon(
                          MdiIcons.play,
                          color: themeData.colorScheme.onBackground,
                          size: 14,
                        ),
                      ),
                      Container(
                        margin: Spacing.only(left: 8),
                        child: Text(
                          title,
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.caption,
                              color: themeData.colorScheme.background,
                              fontWeight: 600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget announcementWidget(
      {String title, String date, String description, String btnText}) {
    return MyCard(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CourseExamTimeScreen()));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                fontWeight: 700, color: themeData.colorScheme.onBackground),
          ),
          Text(
            date,
            style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                fontWeight: 700, color: themeData.colorScheme.onBackground),
          ),
          Spacing.height(8),
          Text(
            description,
            style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                color: themeData.colorScheme.onBackground.withAlpha(160),
                height: 1.2),
          ),
          Spacing.height(16),
          ElevatedButton(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                overlayColor: MaterialStateProperty.all(
                    themeData.colorScheme.primary.withAlpha(35)),
                backgroundColor: MaterialStateProperty.all(
                    themeData.colorScheme.primary.withAlpha(35))),
            onPressed: () {},
            child: Text(
              btnText,
              style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                  letterSpacing: 0.3,
                  color: themeData.colorScheme.primary,
                  fontWeight: 600),
            ),
          ),
        ],
      ),
      shadow: MyShadow(elevation: 0),
      bordered: true,
    );
  }

  Widget singleMyCourse(
      {String image,
      String title,
      String subtitle,
      String status,
      double progress}) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CourseSubjectScreen()));
      },
      child: MyCard(
        child: Row(
          children: <Widget>[
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Image(
                image: AssetImage(image),
                height: 60,
                width: 60,
              ),
            ),
            Expanded(
              child: Container(
                margin: Spacing.left(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      subtitle,
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2,
                          color: themeData.colorScheme.primary.withAlpha(180),
                          fontWeight: 700),
                    ),
                    Text(
                      title,
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText1,
                          color: themeData.colorScheme.onBackground,
                          letterSpacing: 0,
                          fontWeight: 600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacing.height(8),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            status,
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                color: themeData.colorScheme.onBackground,
                                muted: true),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Expanded(
                          child: Generator.buildProgress(
                              progress: progress,
                              height: 4,
                              activeColor: customAppTheme.colorSuccess,
                              inactiveColor: themeData.colorScheme.onBackground
                                  .withAlpha(80),
                              width: 56),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
