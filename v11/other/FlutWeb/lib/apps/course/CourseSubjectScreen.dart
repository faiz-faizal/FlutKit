import 'package:flutkit/style/MyCard.dart';
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

class CourseSubjectScreen extends StatefulWidget {
  @override
  _CourseSubjectScreenState createState() => _CourseSubjectScreenState();
}

class _CourseSubjectScreenState extends State<CourseSubjectScreen> {
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
            home: SafeArea(
              child: Scaffold(
                  body: Container(
                      color: customAppTheme.bgLayer1,
                      child: ListView(
                        padding: Spacing.y(16),
                        children: [
                          MyRow(
                            wrapAlignment: WrapAlignment.center,
                            defaultFlex: {
                              ScreenMediaType.MD: 16,
                              ScreenMediaType.LG: 12,
                              ScreenMediaType.XL: 8,
                            },
                            children: [
                              MyCol(
                                  child: MyCard(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        MyContainer(
                                          color: themeData.colorScheme.primary,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Icon(
                                                    MdiIcons.chevronLeft,
                                                    color: themeData.colorScheme.onPrimary,
                                                    size: 24,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: Spacing.top(16),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: <Widget>[
                                                    Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Text(
                                                          "Biology",
                                                          style: AppTheme.getTextStyle(
                                                              themeData.textTheme.headline5,
                                                              fontWeight: 700,
                                                              color: themeData
                                                                  .colorScheme.onPrimary),
                                                        ),
                                                        Text(
                                                          "DS100",
                                                          style: AppTheme.getTextStyle(
                                                              themeData.textTheme.bodyText1,
                                                              fontWeight: 500,
                                                              color: themeData
                                                                  .colorScheme.onPrimary),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(24)),
                                                        child: Image(
                                                            image: AssetImage(
                                                                './assets/images/avatar-2.jpg'),
                                                            width: 48,
                                                            height: 48),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin: Spacing.top(24),
                                                child: Text(
                                                  "60 / 62 students",
                                                  style: AppTheme.getTextStyle(
                                                      themeData.textTheme.bodyText1,
                                                      color: themeData.colorScheme.onPrimary,
                                                      fontWeight: 500),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Spacing.height(16),
                                        Text(
                                          "Resources",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.subtitle1,
                                              color:
                                              themeData.colorScheme.onBackground,
                                              fontWeight: 600),
                                        ),
                                        Spacing.height(16),
                                        Container(
                                          child: GridView.count(
                                            physics: ClampingScrollPhysics(),
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 16,
                                            crossAxisSpacing: 16,
                                            shrinkWrap: true,
                                            childAspectRatio: 1.5,
                                            children: <Widget>[
                                              singleResource(
                                                  title: "All",
                                                  isSelected: true,
                                                  resource: "14 Files"),
                                              singleResource(
                                                  title: "Lectures",
                                                  iconData: MdiIcons.fileVideoOutline,
                                                  resource: "3 Videos"),
                                              singleResource(
                                                  title: "Reading Material",
                                                  isSelected: false,
                                                  iconData: MdiIcons.filePdfOutline,
                                                  resource: "3 PDFs"),
                                              singleResource(
                                                  title: "Assignment",
                                                  isSelected: false,
                                                  iconData: MdiIcons.fileEditOutline,
                                                  resource: "3 Lessons"),
                                              singleResource(
                                                  title: "Tasks",
                                                  isSelected: false,
                                                  resource: "3 Task"),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ))
                            ],
                          )
                        ],
                      ))),
            ));
      },
    );
  }




  Widget singleResource(
      {String title,
      String resource,
      bool isSelected = false,
      IconData iconData = MdiIcons.fileOutline}) {
    return MyContainer(
      padding: Spacing.all(16),
      color: isSelected
        ? themeData.colorScheme.primary.withAlpha(40)
        : customAppTheme.bgLayer1,
      bordered: !isSelected,
      border: isSelected
          ? null
          : Border.all(color: customAppTheme.border2, width: 1.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                color: isSelected
                    ? themeData.colorScheme.primary
                    : themeData.colorScheme.onBackground,
                fontWeight: 600),
          ),
          Row(
            children: <Widget>[
              Container(
                child: Icon(
                  iconData,
                  color: isSelected
                      ? themeData.colorScheme.primary
                      : themeData.colorScheme.onBackground,
                  size: 18,
                ),
              ),
              Container(
                margin: Spacing.left(4),
                child: Text(
                  resource,
                  style: AppTheme.getTextStyle(
                    themeData.textTheme.caption,
                    color: isSelected
                        ? themeData.colorScheme.primary
                        : themeData.colorScheme.onBackground,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
