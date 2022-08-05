
import 'package:flutkit/style/MyCol.dart';
import 'package:flutkit/style/MyContainer.dart';
import 'package:flutkit/style/MyRow.dart';
import 'package:flutkit/style/ScreenMedia.dart';
import 'package:flutkit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppNotifier.dart';
import '../../AppTheme.dart';
import 'CourseExamScreen.dart';

class CourseExamTimeScreen extends StatefulWidget {
  @override
  _CourseExamTimeScreenState createState() => _CourseExamTimeScreenState();
}

class _CourseExamTimeScreenState extends State<CourseExamTimeScreen> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget child) {
        int themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(themeType),
            home: Scaffold(
                appBar: AppBar(
                  backgroundColor: customAppTheme.bgLayer1,
                  elevation: 0,
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      MdiIcons.chevronLeft,
                      color: themeData.colorScheme.onBackground,
                      size: 24,
                    ),
                  ),
                  title: Text(
                    "Exam",
                    style: AppTheme.getTextStyle(
                        themeData.textTheme.bodyText1,
                        color: themeData
                            .colorScheme.onBackground,
                        fontWeight: 600),
                  ),

                ),
                body: Container(
                    color: customAppTheme.bgLayer1,
                    child: ListView(
                      padding: Spacing.fromLTRB(8,0,8,8),
                      children: <Widget>[
                      MyRow(
                        defaultFlex: {
                          ScreenMediaType.SM : 12,
                          ScreenMediaType.LG : 8,
                          ScreenMediaType.XL : 6,
                        },
                          children: [
                            MyCol(child: singleExam(
                                subject: "Biology",
                                date: "Today",
                                place: "Room. 147",
                                teacherImage:
                                './assets/images/avatar-2.jpg',
                                teacherName: "Elliot Haines",
                                time: "9:00 - 13:20",
                                type: "Open Book"),),
                            MyCol(child: singleExam(
                                subject: "Science",
                                date: "2 Aug",
                                place: "Lab. 1",
                                teacherImage:
                                './assets/images/avatar-4.jpg',
                                teacherName: "Shane Tierney",
                                time: "12:30 - 15:00",
                                type: "Close Book")),
                            MyCol(
                              child: singleExam(
                                  subject: "Mathematics",
                                  date: "5 Aug",
                                  place: "Room. 24",
                                  teacherImage:
                                  './assets/images/avatar-3.jpg',
                                  teacherName: "Dustin Wilkerson",
                                  time: "8:00 - 11:00",
                                  type: "Open Book"),
                            ),
                            MyCol(child: singleExam(
                                subject: "English",
                                date: "7 Aug",
                                place: "Announce soon",
                                teacherImage:
                                './assets/images/avatar-1.jpg',
                                teacherName: "Zakaria Navarro",
                                time: "7:45 - 10:00",
                                type: "On Mobile"))
                          ],
                        ),
                      Spacing.height(24),
                      Center(
                        child: Text(
                            "If you have any queries about exam",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.caption,
                                color:
                                themeData.colorScheme.onBackground),
                          ),
                      ),
                        Spacing.height(8),
                        Center(
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                              ),
                              onPressed: () {},
                              child: Text(
                                "Contact us".toUpperCase(),
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    fontSize: 12,
                                    letterSpacing: 0.5,
                                    fontWeight: 600,
                                    color: themeData
                                        .colorScheme.onPrimary),
                              )),
                        ),
                      ],
                    ))));
      },
    );
  }

  Widget singleExam(
      {String subject,
        String date,
        String time,
        String place,
        String teacherImage,
        String teacherName,
        String type}) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                CourseExamScreen()));
      },
      child: MyContainer.bordered(
        paddingAll: 0,
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: Spacing.fromLTRB(16, 16, 0, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          subject,
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 600),
                        ),
                        Container(
                          margin: Spacing.top(2),
                          child: Text(
                            date,
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.caption,
                                muted: true,
                                color: themeData.colorScheme.onBackground,
                                letterSpacing: 0,
                                fontWeight: 600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: Spacing.fromLTRB(0, 16, 16, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          place,
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 600),
                        ),
                        Container(
                          margin: Spacing.top(2),
                          child: Text(
                            time,
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.caption,
                                muted: true,
                                color: themeData.colorScheme.onBackground,
                                letterSpacing: 0,
                                fontWeight: 600),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              height: 0,
            ),
            Container(
              margin: Spacing.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius:
                      BorderRadius.all(Radius.circular(18)),
                      child: Image(
                        image: AssetImage(teacherImage),
                        height: 36,
                        width: 36,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                        margin: Spacing.left(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              teacherName,
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText2,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 600),
                            ),
                            Text(
                              "Examine",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.caption,
                                  fontSize: 12,
                                  color: customAppTheme.colorInfo,
                                  fontWeight: 500),
                            ),
                          ],
                        ),
                      )),
                  Container(
                    child: Text(
                      type,
                      style: AppTheme.getTextStyle(themeData.textTheme.caption,
                          letterSpacing: 0,
                          color: themeData.colorScheme.primary,
                          fontWeight: 500),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

