import 'package:flutkit/apps/course/course_exam_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CourseExamTimeScreen extends StatefulWidget {
  @override
  _CourseExamTimeScreenState createState() => _CourseExamTimeScreenState();
}

class _CourseExamTimeScreenState extends State<CourseExamTimeScreen> {
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
        body: ListView(
      padding: MySpacing.zero,
      children: <Widget>[
        Container(
          margin: MySpacing.fromLTRB(24, 44, 24, 0),
          child: Row(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  LucideIcons.chevronLeft,
                  color: theme.colorScheme.onBackground,
                  size: 24,
                ),
              ),
              Expanded(
                child: Center(
                  child: MyText.bodyLarge("Exam",
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                ),
              ),
              Icon(
                LucideIcons.heart,
                color: theme.colorScheme.onBackground,
                size: 24,
              )
            ],
          ),
        ),
        Container(
          margin: MySpacing.fromLTRB(0, 16, 0, 0),
          child: Column(
            children: <Widget>[
              singleExam(
                  subject: "Biology",
                  date: "Today",
                  place: "Room. 147",
                  teacherImage: './assets/images/profile/avatar_2.jpg',
                  teacherName: "Elliot Haines",
                  time: "9:00 - 13:20",
                  type: "Open Book"),
              Container(
                margin: MySpacing.top(24),
                child: singleExam(
                    subject: "Science",
                    date: "2 Aug",
                    place: "Lab. 1",
                    teacherImage: './assets/images/profile/avatar_4.jpg',
                    teacherName: "Shane Tierney",
                    time: "12:30 - 15:00",
                    type: "Close Book"),
              ),
              Container(
                margin: MySpacing.top(24),
                child: singleExam(
                    subject: "Mathematics",
                    date: "5 Aug",
                    place: "Room. 24",
                    teacherImage: './assets/images/profile/avatar_3.jpg',
                    teacherName: "Dustin Wilkerson",
                    time: "8:00 - 11:00",
                    type: "Open Book"),
              ),
              Container(
                margin: MySpacing.top(24),
                child: singleExam(
                    subject: "English",
                    date: "7 Aug",
                    place: "Announce soon",
                    teacherImage: './assets/images/profile/avatar_1.jpg',
                    teacherName: "Zakaria Navarro",
                    time: "7:45 - 10:00",
                    type: "On Mobile"),
              ),
            ],
          ),
        ),
        Container(
          margin: MySpacing.top(20),
          child: Column(
            children: <Widget>[
              MyText.bodySmall("If you have any queries about exam",
                  color: theme.colorScheme.onBackground),
              Container(
                margin: MySpacing.vertical(8),
                child: MyButton(
                    elevation: 0,
                    borderRadiusAll: 4,
                    onPressed: () {},
                    child: MyText.bodySmall("Contact us".toUpperCase(),
                        fontSize: 12,
                        letterSpacing: 0.5,
                        fontWeight: 600,
                        color: theme.colorScheme.onPrimary)),
              ),
            ],
          ),
        )
      ],
    ));
  }

  Widget singleExam(
      {required String subject,
      required String date,
      required String time,
      required String place,
      required String teacherImage,
      required String teacherName,
      required String type}) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CourseExamScreen()));
      },
      child: MyContainer.bordered(
        margin: MySpacing.fromLTRB(24, 0, 24, 0),
        borderRadiusAll: 4,
        paddingAll: 0,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: MySpacing.fromLTRB(16, 16, 0, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MyText.titleSmall(subject,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600),
                      Container(
                        margin: MySpacing.top(2),
                        child: MyText.bodySmall(date,
                            muted: true,
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0,
                            fontWeight: 600),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: MySpacing.fromLTRB(0, 16, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      MyText.bodyLarge(place,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600),
                      Container(
                        margin: MySpacing.top(2),
                        child: MyText.bodySmall(time,
                            muted: true,
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0,
                            fontWeight: 600),
                      )
                    ],
                  ),
                )
              ],
            ),
            Divider(
              height: 0,
            ),
            Container(
              margin: MySpacing.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    child: Image(
                      image: AssetImage(teacherImage),
                      height: 36,
                      width: 36,
                    ),
                  ),
                  Expanded(
                      child: Container(
                    margin: MySpacing.left(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        MyText.bodyMedium(teacherName,
                            color: theme.colorScheme.onBackground,
                            fontWeight: 600),
                        MyText.bodySmall("Examine",
                            fontSize: 12,
                            color: customTheme.colorInfo,
                            fontWeight: 500),
                      ],
                    ),
                  )),
                  MyText.bodySmall(type,
                      letterSpacing: 0,
                      color: theme.colorScheme.primary,
                      fontWeight: 500)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
