
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

class CourseTasksScreen extends StatefulWidget {
  @override
  _CourseTasksScreenState createState() => _CourseTasksScreenState();
}

class _CourseTasksScreenState extends State<CourseTasksScreen> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget child) {
        int themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);
        return Scaffold(
            appBar: AppBar(
              backgroundColor: customAppTheme.bgLayer1,
              title: Text(
                "Tasks",
                style: AppTheme.getTextStyle(
                    themeData.textTheme.bodyText1,
                    color: themeData
                        .colorScheme.onBackground,
                    fontWeight: 600),
              ),
              centerTitle: true,
              elevation: 0,
            ),
            body: Container(
                color: customAppTheme.bgLayer1,
                child: ListView(
                  padding: Spacing.zero,
                  children: <Widget>[
                    Container(
                      padding: Spacing.fromLTRB(8, 0,8,16),
                      child: MyRow(
                        defaultFlex: {
                          ScreenMediaType.MD : 12,
                          ScreenMediaType.LG:8
                        },
                        children: [
                          MyCol(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  "DUE",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      fontWeight: 700,
                                      muted: true,
                                      color:
                                      themeData.colorScheme.onBackground),
                                ),
                              ),
                              Spacing.height(16),
                              singleTask(
                                subject: "Biology",
                                statusText: "Over due",
                                submissionDate: "31/07/20",
                                status: 0,
                                task: "Lesson 1",
                              ),
                              Spacing.height(16),

                              singleTask(
                                  subject: "Mathematics",
                                  task: "Example 2",
                                  statusText: "Not submit",
                                  status: 1,
                                  submissionDate: "22/07/20"),
                              Spacing.height(16),

                              singleTask(
                                  subject: "History",
                                  task: "Example 2",
                                  statusText: "Not submit",
                                  status: 1,
                                  submissionDate: "20/07/20"),
                            ],
                          )),
                          MyCol(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  "IN REVIEW",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      fontWeight: 700,
                                      muted: true,
                                      color:
                                      themeData.colorScheme.onBackground),
                                ),
                              ),
                              Spacing.height(16),
                              singleTask(
                                subject: "Biology",
                                statusText: "In Review",
                                status: 2,
                                submissionDate: "29/07/20",
                                task: "Lesson 1",
                              ),
                            ],
                          )),
                          MyCol(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                "SUBMITTED",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    fontWeight: 700,
                                    muted: true,
                                    color:
                                    themeData.colorScheme.onBackground),
                              ),
                              Spacing.height(16),
                              singleTask(
                                subject: "Biology",
                                statusText: "35/40",
                                status: 3,
                                submissionDate: "29/07/20",
                                task: "Lesson 1",
                              ),
                              Spacing.height(16),

                              singleTask(
                                subject: "History",
                                task: "Homework 2",
                                statusText: "27/30",
                                status: 3,
                                submissionDate: "24/07/20",
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),
                  ],
                )));
      },
    );
  }

  Widget singleTask(
      {String subject,
        String task,
        String submissionDate,
        String statusText,
        int status = 0}) {
    IconData iconData;
    Color iconBG, iconColor, statusColor;
    switch (status) {
      case 0:
        iconBG = customAppTheme.colorError;
        iconColor = customAppTheme.onError;
        iconData = MdiIcons.plus;
        statusColor = customAppTheme.colorError;
        break;
      case 1:
        iconBG = themeData.colorScheme.primary;
        iconColor = themeData.colorScheme.onPrimary;
        iconData = MdiIcons.plus;
        statusColor = themeData.colorScheme.primary;
        break;
      case 2:
        iconBG = customAppTheme.colorInfo;
        iconColor = customAppTheme.onInfo;
        iconData = MdiIcons.pencilOutline;
        statusColor = customAppTheme.colorInfo;
        break;
      case 3:
        iconBG = customAppTheme.disabledColor;
        iconColor = customAppTheme.onDisabled;
        iconData = MdiIcons.spellcheck;
        statusColor = customAppTheme.disabledColor;
        break;
      default:
        iconBG = customAppTheme.colorError;
        iconColor = customAppTheme.onError;
        iconData = MdiIcons.plus;
        statusColor = customAppTheme.colorError;
        break;
    }

    return MyContainer.bordered(
      padding: Spacing.all(16),
      borderRadiusAll: 8,
      border: Border.all(color: customAppTheme.border2,width: 1),
      color: customAppTheme.bgLayer1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: Spacing.all(6),
            decoration:
            BoxDecoration(color: iconBG, shape: BoxShape.circle),
            child: Icon(
              iconData,
              color: iconColor,
              size: 20,
            ),
          ),
          Expanded(
            child: Container(
              margin: Spacing.left(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    subject,
                    style: AppTheme.getTextStyle(
                        themeData.textTheme.bodyText1,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                  ),
                  Container(
                    margin: Spacing.top(2),
                    child: Text(
                      task,
                      style: AppTheme.getTextStyle(
                        themeData.textTheme.caption,
                        color: themeData.colorScheme.onBackground
                            .withAlpha(160),
                        fontWeight: 600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                submissionDate,
                style: AppTheme.getTextStyle(themeData.textTheme.caption,
                    fontSize: 12,
                    letterSpacing: 0.2,
                    color: themeData.colorScheme.onBackground,
                    muted: true,
                    fontWeight: 600),
              ),
              Container(
                margin: Spacing.top(2),
                child: Text(
                  statusText,
                  style: AppTheme.getTextStyle(
                      themeData.textTheme.bodyText2,
                      color: statusColor == null
                          ? customAppTheme.colorInfo
                          : statusColor,
                      letterSpacing: 0,
                      fontWeight: status == 3 ? 600 : 500),
                ),
              ),
            ],
          ),
        ],
      ),
    );

  }


}

