import 'package:flutkit/style/MyCol.dart';
import 'package:flutkit/style/MyContainer.dart';
import 'package:flutkit/style/MyRow.dart';
import 'package:flutkit/style/ScreenMedia.dart';
import 'package:flutkit/utils/SizeConfig.dart';
import 'package:flutkit/widgets/custom/MyPagination.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppNotifier.dart';
import '../../AppTheme.dart';

class CourseExamScreen extends StatefulWidget {
  @override
  _CourseExamScreenState createState() => _CourseExamScreenState();
}

class _CourseExamScreenState extends State<CourseExamScreen> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  bool isPlaying = false;

  int repeatType = 0;

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
            home: SafeArea(
              child: Scaffold(
                backgroundColor: customAppTheme.bgLayer1,
                body: ListView(
                  padding: Spacing.fromLTRB(8, 16, 8, 16),
                  children: [
                    MyRow(
                      wrapAlignment: WrapAlignment.center,
                      children: [
                        MyCol(
                          flex: {
                            ScreenMediaType.MD: 12,
                            ScreenMediaType.XL: 8,
                          },
                          child: Column(
                            children: <Widget>[
                              MyContainer.bordered(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          "Attempted",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText2,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              fontWeight: 600),
                                        ),
                                        Container(
                                          margin: Spacing.top(8),
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              color: themeData
                                                  .colorScheme.primary
                                                  .withAlpha(40),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8))),
                                          child: Center(
                                            child: Text(
                                              "8",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.bodyText1,
                                                  color: themeData
                                                      .colorScheme.primary,
                                                  fontWeight: 700),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          "Remaining",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText2,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              fontWeight: 600),
                                        ),
                                        Container(
                                          margin: Spacing.top(8),
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              color: themeData
                                                  .colorScheme.primary
                                                  .withAlpha(40),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8))),
                                          child: Center(
                                            child: Text(
                                              "12",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.bodyText1,
                                                  color: themeData
                                                      .colorScheme.primary,
                                                  fontWeight: 700),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          "Time",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText2,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              fontWeight: 600),
                                        ),
                                        Container(
                                          margin: Spacing.top(8),
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                    color: themeData
                                                        .colorScheme.primary
                                                        .withAlpha(40),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                8))),
                                                child: Center(
                                                  child: Text(
                                                    "6",
                                                    style:
                                                        AppTheme.getTextStyle(
                                                            themeData.textTheme
                                                                .bodyText1,
                                                            color: themeData
                                                                .colorScheme
                                                                .primary,
                                                            fontWeight: 700),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: Spacing.horizontal(8),
                                                child: Text(
                                                  ":",
                                                  style: AppTheme.getTextStyle(
                                                      themeData
                                                          .textTheme.bodyText1,
                                                      color: themeData
                                                          .colorScheme
                                                          .onBackground,
                                                      fontWeight: 600),
                                                ),
                                              ),
                                              Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                    color: themeData
                                                        .colorScheme.primary
                                                        .withAlpha(40),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                8))),
                                                child: Center(
                                                  child: Text(
                                                    "16",
                                                    style:
                                                        AppTheme.getTextStyle(
                                                            themeData.textTheme
                                                                .bodyText1,
                                                            color: themeData
                                                                .colorScheme
                                                                .primary,
                                                            fontWeight: 700),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Spacing.height(16),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        child: Image(
                                          image: AssetImage(
                                              './assets/images/course/subject-6.jpg'),
                                          width: 120,
                                          height: 120,
                                        )),
                                    Container(
                                      margin: Spacing.left(16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Lesson 1\nOnline Exam",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.bodyText1,
                                                color: themeData
                                                    .colorScheme.onBackground,
                                                fontWeight: 600),
                                          ),
                                          Container(
                                            margin: Spacing.top(2),
                                            child: Text(
                                              "5 Question from lesson 1",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.caption,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  fontWeight: 500,
                                                  muted: true),
                                            ),
                                          ),
                                          Text(
                                            "MCQs",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.caption,
                                                color: themeData
                                                    .colorScheme.onBackground,
                                                fontWeight: 500,
                                                muted: true),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Spacing.height(16),
                              SingleQuestion(
                                themeType: value.themeMode(),
                                qNumber: 1,
                                question: "Young's modulus is the property of?",
                                options: [
                                  "Gas only",
                                  "Both Solid and Liquid",
                                  "Solid only",
                                  "Liquid only"
                                ],
                              ),
                              Spacing.height(16),
                              SingleQuestion(
                                themeType: value.themeMode(),
                                qNumber: 2,
                                question:
                                    "Movement of cell against concentration gradient is called",
                                options: [
                                  "osmosis",
                                  "active transport",
                                  "diffusion",
                                  "passive transport"
                                ],
                              ),
                              Spacing.height(16),
                              SingleQuestion(
                                themeType: value.themeMode(),
                                qNumber: 3,
                                question:
                                    "Plants receive their nutrients mainly from",
                                options: [
                                  "chlorophyll",
                                  "atmosphere",
                                  "light",
                                  "soil"
                                ],
                              ),
                              Spacing.height(16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      MdiIcons.chevronLeft,
                                      color: themeData.colorScheme.onBackground,
                                      size: 20,
                                    ),
                                  ),
                                  MyPagination()
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}

class SingleQuestion extends StatefulWidget {
  final int qNumber, themeType;
  final question;
  final List<String> options;

  const SingleQuestion(
      {Key key,
      this.qNumber,
      this.question,
      this.options,
      @required this.themeType})
      : super(key: key);

  @override
  _SingleQuestionState createState() => _SingleQuestionState();
}

class _SingleQuestionState extends State<SingleQuestion> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  int selectedOption = -1;

  @override
  void initState() {
    super.initState();
    customAppTheme = AppTheme.getCustomAppTheme(widget.themeType);
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);

    Widget buildOptions() {
      List<Widget> _list = [];
      for (int i = 0; i < widget.options.length; i++) {
        _list.add(Container(
          margin: Spacing.bottom(12),
          child: InkWell(
            onTap: () {
              setState(() {
                selectedOption = i;
              });
            },
            child: Row(
              children: <Widget>[
                Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                      color: selectedOption == i
                          ? customAppTheme.colorSuccess
                          : customAppTheme.bgLayer2,
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Center(
                    child: selectedOption == i
                        ? Icon(
                            MdiIcons.check,
                            size: 16,
                            color: customAppTheme.onSuccess,
                          )
                        : Container(),
                  ),
                ),
                Spacing.width(16),
                Text(
                  widget.options[i],
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                      color: themeData.colorScheme.onBackground,
                      fontWeight: 500),
                )
              ],
            ),
          ),
        ));
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _list,
      );
    }

    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: Spacing.all(8),
            decoration: BoxDecoration(
                color: customAppTheme.bgLayer2,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Text(
              "Q." + widget.qNumber.toString(),
              style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                  color: themeData.colorScheme.onBackground, fontWeight: 600),
            ),
          ),
          Spacing.width(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.question,
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                      color: themeData.colorScheme.onBackground,
                      fontWeight: 600),
                ),
                Container(
                  margin: Spacing.top(16),
                  child: Column(
                    children: <Widget>[buildOptions()],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
