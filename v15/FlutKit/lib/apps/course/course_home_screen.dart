import 'package:flutkit/apps/course/course_exam_time_screen.dart';
import 'package:flutkit/apps/course/course_notification_screen.dart';
import 'package:flutkit/apps/course/course_subject_screen.dart';
import 'package:flutkit/apps/course/course_video_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/generator.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_progress_bar.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CourseHomeScreen extends StatefulWidget {
  @override
  _CourseHomeScreenState createState() => _CourseHomeScreenState();
}

class _CourseHomeScreenState extends State<CourseHomeScreen> {
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
      shrinkWrap: true,
      padding: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
      children: <Widget>[
        Container(
          margin: MySpacing.fromLTRB(24, 0, 24, 0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: MyText.bodyLarge("Hello, Learner",
                    color: theme.colorScheme.onBackground, fontWeight: 600),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return CourseNotificationScreen();
                      },
                      fullscreenDialog: true));
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    Icon(
                      LucideIcons.bell,
                      color: theme.colorScheme.onBackground.withAlpha(200),
                    ),
                    Positioned(
                      right: -2,
                      top: -2,
                      child: Container(
                        padding: EdgeInsets.all(0),
                        height: 14,
                        width: 14,
                        decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        child: Center(
                          child: MyText.labelSmall(
                            "2",
                            color: theme.colorScheme.onPrimary,
                            fontSize: 9,
                            fontWeight: 500,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          margin: MySpacing.fromLTRB(24, 16, 24, 0),
          child: examWidget(),
        ),
        Container(
          margin: MySpacing.fromLTRB(24, 24, 0, 0),
          child: MyText.titleMedium("My Course",
              color: theme.colorScheme.onBackground, fontWeight: 600),
        ),
        Container(
          margin: MySpacing.fromLTRB(24, 16, 24, 0),
          child: Column(
            children: <Widget>[
              singleMyCourse(
                  title: "How to make tubes and paper crafts",
                  image: './assets/images/apps/course/art.jpg',
                  subtitle: "Arts & Crafts",
                  progress: 0.4,
                  status: "3 of 9 lessons"),
              Container(
                margin: MySpacing.top(24),
                child: singleMyCourse(
                    title: "Ardunio Robotics with mBot",
                    image: './assets/images/apps/course/robot.jpg',
                    subtitle: "Robotics",
                    progress: 0.6,
                    status: "5 of 8 lessons"),
              ),
            ],
          ),
        ),
        Container(
          margin: MySpacing.fromLTRB(24, 24, 24, 0),
          child: MyText.bodyLarge("Up Next",
              color: theme.colorScheme.onBackground, fontWeight: 600),
        ),
        Container(
          margin: MySpacing.fromLTRB(24, 16, 24, 16),
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: <Widget>[
              singleVideoLecture(
                  subject: "Physics",
                  title: "Chap 1",
                  image: './assets/images/apps/course/subject-2.jpg'),
              singleVideoLecture(
                  subject: "Biology",
                  title: "Lab 1",
                  image: './assets/images/apps/course/biology.jpg'),
              singleVideoLecture(
                  subject: "Physics",
                  title: "Chap 2",
                  image: './assets/images/apps/course/subject-6.jpg'),
              singleVideoLecture(
                  subject: "Chemistry",
                  title: "Lab 2",
                  image: './assets/images/apps/course/subject-2.jpg'),
            ],
          ),
        )
      ],
    ));
  }

  Widget singleVideoLecture(
      {required String subject, required String title, required String image}) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CourseVideoScreen()));
      },
      child: Stack(
        children: <Widget>[
          Container(
            clipBehavior: Clip.antiAlias,
            height: (MediaQuery.of(context).size.width - 66) / 2,
            width: (MediaQuery.of(context).size.width - 66) / 2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Image(
              image: AssetImage(image),
              height: (MediaQuery.of(context).size.width - 74) / 2,
              width: (MediaQuery.of(context).size.width - 74) / 2,
            ),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                MyText.bodyMedium(subject,
                    color: Colors.white, fontWeight: 600),
                Container(
                  margin: MySpacing.only(top: 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      MyContainer.rounded(
                        paddingAll: 2,
                        color: theme.colorScheme.background,
                        shape: BoxShape.circle,
                        child: Center(
                          child: Icon(
                            LucideIcons.play,
                            color: theme.colorScheme.onBackground,
                            size: 16,
                          ),
                        ),
                      ),
                      Container(
                        margin: MySpacing.only(left: 8),
                        child: MyText.bodyLarge(title,
                            color: theme.colorScheme.background,
                            fontWeight: 600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget examWidget() {
    return MyContainer.bordered(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CourseExamTimeScreen()));
      },
      borderRadiusAll: 4,
      padding: MySpacing.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium("Mock Test\n21, July",
              fontWeight: 700, color: theme.colorScheme.onBackground),
          Container(
            margin: MySpacing.top(8),
            child: MyText.bodyMedium(Generator.getDummyText(8),
                color: theme.colorScheme.onBackground.withAlpha(160),
                height: 1.2),
          ),
          Container(
            margin: MySpacing.top(16),
            padding: MySpacing.fromLTRB(12, 8, 12, 8),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withAlpha(28),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: MyText.bodyMedium("Time Table",
                letterSpacing: 0.3,
                color: theme.colorScheme.primary,
                fontWeight: 600),
          ),
        ],
      ),
    );
  }

  Widget singleMyCourse(
      {required String image,
      required String title,
      required String subtitle,
      required String status,
      required double progress}) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CourseSubjectScreen()));
      },
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
              margin: MySpacing.left(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyText.bodyMedium(subtitle,
                      color: theme.colorScheme.primary.withAlpha(180),
                      fontWeight: 700),
                  MyText.bodyLarge(
                    title,
                    color: theme.colorScheme.onBackground,
                    letterSpacing: 0,
                    fontWeight: 600,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: MyText.bodyMedium(
                          status,
                          color: theme.colorScheme.onBackground,
                          muted: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      MyProgressBar(
                          progress: progress,
                          height: 4,
                          activeColor: customTheme.colorSuccess,
                          inactiveColor:
                              theme.colorScheme.onBackground.withAlpha(80),
                          width: 56)
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
