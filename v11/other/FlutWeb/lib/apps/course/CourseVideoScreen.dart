import 'dart:async';

import 'package:flutkit/style/MyCol.dart';
import 'package:flutkit/style/MyRow.dart';
import 'package:flutkit/style/ScreenMedia.dart';
import 'package:flutkit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppNotifier.dart';
import '../../AppTheme.dart';

class CourseVideoScreen extends StatefulWidget {
  @override
  _CourseVideoScreenState createState() => _CourseVideoScreenState();
}

class _CourseVideoScreenState extends State<CourseVideoScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  bool isPlaying = false;

  Timer _timer;
  int _duration = 200, repeatType = 0;
  int _position = 0;
  String _time = "0:00";

  convertTime() {
    int hour = (_position / 3600).floor();
    int minute = ((_position - 3600 * hour) / 60).floor();
    int second = (_position - 3600 * hour - 60 * minute);
    String time = "";
    if (second < 10) {
      time += minute.toString() + ":0" + second.toString();
    } else {
      time += minute.toString() + ":" + second.toString();
    }

    setState(() {
      _time = time;
    });
  }

  _onTrackDurationChange(double value) {
    setState(() {
      _position = value.floor();
    });
    convertTime();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          if (_position >= (_duration - 1)) {
            timer.cancel();
            _position += 1;
            convertTime();
            isPlaying = false;
            _animationController.reverse();
          } else {
            _position += 1;
            convertTime();
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));

   startTimer();
  }



  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    if (_timer != null) _timer.cancel();
  }

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
                  elevation: 0,
                  backgroundColor: customAppTheme.bgLayer1,
                  centerTitle: true,
                  leading: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(
                      MdiIcons.chevronLeft,
                      color: themeData.colorScheme.onBackground,
                      size: 24,
                    ),
                  ),

                ),
                body: Container(
                    color: customAppTheme.bgLayer1,
                    child: ListView(
                      padding: Spacing.fromLTRB(8,0,8,16),
                      children: [
                        MyRow(
                          defaultFlex: {
                            ScreenMediaType.MD:12,
                          },
                          wrapAlignment: WrapAlignment.center,
                          children: [
                            MyCol(

                              child: Container(
                                margin: Spacing.x(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        child: Image(
                                          image: AssetImage(
                                              './assets/images/course/class-l1.jpg'),
                                          fit: BoxFit.fill,
                                        )),
                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          Text(_time,
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.caption,
                                                  fontWeight: 500)),
                                          Expanded(
                                            child: SliderTheme(
                                              data: SliderTheme.of(context).copyWith(
                                                trackHeight: 2.5,
                                                thumbShape: RoundSliderThumbShape(
                                                    enabledThumbRadius: 7),
                                              ),
                                              child: Slider(
                                                value: _position.toDouble(),
                                                onChanged: _onTrackDurationChange,
                                                min: 0,
                                                max: _duration.toDouble(),
                                              ),
                                            ),
                                          ),
                                          Text("3:20",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.caption,
                                                  fontWeight: 500)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  "1.0 Introduction of UI Designing",
                                                  style: AppTheme.getTextStyle(
                                                      themeData.textTheme.bodyText2,
                                                      color: themeData
                                                          .colorScheme.onBackground,
                                                      fontWeight: 600),
                                                ),
                                                Container(
                                                  margin: Spacing.top(4),
                                                  child: Text(
                                                    "120 Views  \u2022  20 mins ago",
                                                    style: AppTheme.getTextStyle(
                                                        themeData.textTheme.caption,
                                                        color: themeData
                                                            .colorScheme.onBackground,
                                                        fontWeight: 500,
                                                        muted: true),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Icon(
                                            MdiIcons.chevronDown,
                                            color: themeData.colorScheme.onBackground,
                                          )
                                        ],
                                      ),
                                    ),
                                    Spacing.height(16),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Icon(
                                              MdiIcons.thumbUp,
                                              color: themeData.colorScheme.primary,
                                              size: 22,
                                            ),
                                            Text(
                                              "16 Likes",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.caption,
                                                  fontSize: 12,
                                                  color:
                                                  themeData.colorScheme.primary,
                                                  fontWeight: 600,
                                                  letterSpacing: 0),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Icon(
                                              MdiIcons.messageOutline,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              size: 22,
                                            ),
                                            Text(
                                              "Comment",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.caption,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  fontWeight: 500,
                                                  fontSize: 12,
                                                  letterSpacing: 0),
                                            )
                                          ],
                                        ),Column(
                                          children: <Widget>[
                                            Icon(
                                              MdiIcons.shareOutline,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              size: 22,
                                            ),
                                            Text(
                                              "Share",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.caption,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  fontWeight: 500,
                                                  fontSize: 12,
                                                  letterSpacing: 0),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Icon(
                                              MdiIcons.downloadOutline,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              size: 24,
                                            ),
                                            Text(
                                              "Download",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.caption,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  fontWeight: 500,
                                                  letterSpacing: 0),
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            MyCol(

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      "Next",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText1,
                                          color:
                                          themeData.colorScheme.onBackground,
                                          fontWeight: 600),
                                    ),
                                  ),
                                  Spacing.height(16),
                                  singleLecture(
                                      time: "6:21",
                                      title: "Intro",
                                      info: "Start intro"),
                                  Spacing.height(16),
                                  singleLecture(
                                      time: "12:15",
                                      title: "Lesson 1",
                                      info: "Question type 1"),
                                  Spacing.height(16),
                                  singleLecture(
                                      time: "10:30",
                                      title: "Lesson 2",
                                      info: "Question type 2"),
                                  Spacing.height(16),
                                  singleLecture(
                                      time: "22:48",
                                      title: "Lesson 3",
                                      info: "Question type 3"),
                                  Spacing.height(16),
                                  singleLecture(
                                      time: "6:21",
                                      title: "Intro",
                                      info: "Start intro"),
                                  Spacing.height(16),
                                  singleLecture(
                                      time: "12:15",
                                      title: "Lesson 1",
                                      info: "Question type 1"),
                                  Spacing.height(16),
                                  singleLecture(
                                      time: "10:30",
                                      title: "Lesson 2",
                                      info: "Question type 2"),
                                  Spacing.height(16),
                                  singleLecture(
                                      time: "22:48",
                                      title: "Lesson 3",
                                      info: "Question type 3"),
                                  Spacing.height(16),
                                  Center(
                                    child: TextButton(
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                                      ),
                                      onPressed: () {  },
                                      child: Text(
                                        "show all".toUpperCase(),
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.caption,
                                            color: themeData.colorScheme.primary,
                                            fontWeight: 600),
                                      ),
                                    )
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),)));
      },
    );
  }

  Widget singleLecture({String title, String info, String time}) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            padding: Spacing.all(10),
            decoration: BoxDecoration(
                color: themeData.colorScheme.primary.withAlpha(40),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Icon(
              MdiIcons.play,
              color: themeData.colorScheme.primary,
            ),
          ),
          Expanded(
            child: Container(
              margin: Spacing.left(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                  ),
                  Text(
                    info,
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 500,
                        muted: true),
                  ),
                ],
              ),
            ),
          ),
          Text(
            time,
            style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                color: themeData.colorScheme.onBackground,
                muted: true,
                fontWeight: 600),
          )
        ],
      ),
    );
  }
}

