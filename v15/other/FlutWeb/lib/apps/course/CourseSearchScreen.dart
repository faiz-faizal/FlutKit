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
import 'CourseDetailsScreen.dart';

class CourseSearchScreen extends StatefulWidget {
  @override
  _CourseSearchScreenState createState() => _CourseSearchScreenState();
}

class _CourseSearchScreenState extends State<CourseSearchScreen> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget child) {
        int themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);
        return SafeArea(
          child: Scaffold(
            key: _scaffoldKey,
              endDrawer: FilterWidget(
                themeType: themeType,
                scaffoldKey: _scaffoldKey,
              ),
              resizeToAvoidBottomInset: false,
              body: Container(
                  color: customAppTheme.bgLayer1,
                  child: ListView(
                    padding: Spacing.xy(0,16),
                    children: <Widget>[
                      Container(
                        margin: Spacing.x(16),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: MyCard(
                                color: customAppTheme.bgLayer2,
                                paddingAll: 8,
                                borderRadiusAll: 4,
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: 16),
                                        child: TextFormField(
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText2,
                                              letterSpacing: 0,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              fontWeight: 500),
                                          decoration: InputDecoration(
                                            hintText:
                                            "Search courses skills and videos",
                                            hintStyle:
                                            AppTheme.getTextStyle(
                                                themeData.textTheme
                                                    .bodyText2,
                                                letterSpacing: 0,
                                                color: themeData
                                                    .colorScheme
                                                    .onBackground,
                                                fontWeight: 500),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                  Radius.circular(
                                                      8),
                                                ),
                                                borderSide:
                                                BorderSide.none),
                                            enabledBorder:
                                            OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                  Radius.circular(
                                                      8),
                                                ),
                                                borderSide:
                                                BorderSide.none),
                                            focusedBorder:
                                            OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                  Radius.circular(
                                                      8),
                                                ),
                                                borderSide:
                                                BorderSide.none),
                                            isDense: true,
                                            contentPadding:
                                            EdgeInsets.all(0),
                                          ),
                                          textInputAction:
                                          TextInputAction.search,
                                          textCapitalization:
                                          TextCapitalization.sentences,
                                        ),
                                      ),
                                    ),
                                    MyContainer(
                                      paddingAll : 6,
                                      borderRadiusAll: 4,
                                      color: themeData.colorScheme.primary.withAlpha(60),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Icon(
                                          MdiIcons.magnify,
                                          color: themeData
                                              .colorScheme.primary,
                                          size: 16,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Spacing.width(16),
                            MyCard(
                              borderRadiusAll: 4,
                              paddingAll: 12,
                              onTap: (){

                                _scaffoldKey.currentState.openEndDrawer();


                              },
                              child: Icon(
                                MdiIcons.tune,
                                color: themeData.colorScheme.primary,
                                size: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                      Spacing.height(16),
                      Container(
                        margin: Spacing.x(16),
                        child: Text(
                          "Category",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle1,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 700),
                        ),
                      ),
                      Spacing.height(16),
                      Container(
                        margin: Spacing.x(8),
                        child: MyRow(
                          defaultFlex: {
                            ScreenMediaType.XS:12,
                            ScreenMediaType.MD:8,
                            ScreenMediaType.LG:6,
                            ScreenMediaType.XXL:4,
                          },
                          children: [
                            MyCol(child:  singleCategory(
                                title: "UI",
                                image:
                                './assets/images/course/subject-1.jpg',
                                courses: 25),),
                            MyCol(child:  singleCategory(
                                title: "Business",
                                image:
                                './assets/images/course/subject-2.jpg',
                                courses: 80)),
                            MyCol(
                              child:  singleCategory(
                                  title: "Lifestyle",
                                  image:
                                  './assets/images/course/subject-3.jpg',
                                  courses: 120),
                            ),
                            MyCol(child: singleCategory(
                                title: "Marketing",
                                image:
                                './assets/images/course/subject-4.jpg',
                                courses: 50)),
                            MyCol(
                              child: singleCategory(
                                  title: "UX",
                                  image:
                                  './assets/images/course/subject-5.jpg',
                                  courses: 145),
                            ),
                            MyCol(child:  singleCategory(
                                title: "Social",
                                image:
                                './assets/images/course/subject-6.jpg',
                                courses: 15))
                          ],
                        ),
                      ),
                      Spacing.height(16),
                      Container(
                        margin: Spacing.x(16),
                        child: Text(
                          "Recommended",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle1,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 700),
                        ),
                      ),
                      Spacing.height(16),
                      Container(
                        margin: Spacing.x(8),
                        child: MyRow(
                          defaultFlex: {
                            ScreenMediaType.XS:12,
                            ScreenMediaType.MD:8,
                            ScreenMediaType.LG:6,
                            ScreenMediaType.XXL:4,
                          },
                          children: [
                            MyCol(
                              child:  singleResult(
                                  title: "React",
                                  image:
                                  "./assets/images/course/subject-1.jpg",
                                  price: 148),
                            ),
                            MyCol(
                              child:   singleResult(
                                  title: "Flutter",
                                  image:
                                  "./assets/images/course/subject-2.jpg",
                                  price: 259),
                            ),
                            MyCol(
                              child: singleResult(
                                  title: "Web",
                                  image:
                                  "./assets/images/course/subject-6.jpg",
                                  price: 59),
                            ),
                            MyCol(child:  singleResult(
                                title: "React Native",
                                image:
                                "./assets/images/course/subject-5.jpg",
                                price: 59)),

                          ],
                        ),
                      ),
                    ],
                  ))),
        );
      },
    );
  }

  Widget singleResult({String title, String image, int price}) {
    return MyCard(
      paddingAll: 0,
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CourseDetailsScreen()));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8)),
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                padding: Spacing.fromLTRB(12, 6, 12, 6),
                decoration: BoxDecoration(
                  color: themeData.colorScheme.primary.withAlpha(240),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8)),
                ),
                child: Text(
                  "\$ " + price.toString(),
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                      color: themeData.colorScheme.onPrimary,
                      fontWeight: 500),
                ),
              )
            ],
          ),
          Container(
            margin: Spacing.all(8),
            child: Text(
              title,
              style: AppTheme.getTextStyle(
                themeData.textTheme.bodyText1,
                fontWeight: 600,
                color: themeData.colorScheme.onBackground,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget singleCategory({String image, String title, int courses}) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CourseDetailsScreen()));
      },
      child: MyContainer.bordered(
        color: customAppTheme.bgLayer1,
        paddingAll: 8,
        child: Row(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                child: Image(
                  image: AssetImage(image),
                  height: 42,
                  width: 42,
                )),
            Spacing.width(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    title,
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                  ),
                  Text(
                    courses.toString() + "+ Courses",
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                        color: themeData.colorScheme.onBackground,
                        letterSpacing: 0,
                        fontWeight: 500,
                        muted: true),
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

class FilterWidget extends StatefulWidget {
  final int themeType;
  final GlobalKey<ScaffoldState> scaffoldKey;


  const FilterWidget({Key key, @required this.themeType, this.scaffoldKey}) : super(key: key);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  List<String> _course,
      _selectedCourse,
      _duration,
      _selectedDuration,
      _type,
      _selectedType;

  @override
  void initState() {
    super.initState();
    themeData = AppTheme.getThemeFromThemeMode(widget.themeType);
    customAppTheme = AppTheme.getCustomAppTheme(widget.themeType);
    _course = [
      "Physics",
      "Biology",
      "Computer",
      "Maths",
      "Chemistry",
      "Economics",
      "Sport",
      "History",
      "English",
      "Art"
    ];

    _duration = ["1-2 Week", "3-4 Week", "2 Month", "3 Month"];
    _type = ["Beginner", "Intermediate", "Advanced", "Expert"];

    _selectedCourse = ["Maths"];
    _selectedDuration = ["3-4 Week"];
    _selectedType = ["Intermediate"];
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> courseWidget = [], durationWidget = [], typeWidget = [];
    int i = 0;
    for (i = 0; i < _course.length; i++) {
      courseWidget.add(InkWell(
        onTap: () {
          setState(() {
            if (_selectedCourse.contains(_course[i])) {
              _selectedCourse.remove(_course[i]);
            } else {
              _selectedCourse.add(_course[i]);
            }
          });
        },
        child: optionCourseChip(
            option: _course[i],
            isSelected: _selectedCourse.contains(_course[i])),
      ));
    }

    for (i = 0; i < _duration.length; i++) {
      durationWidget.add(InkWell(
        onTap: () {
          setState(() {
            if (_selectedDuration.contains(_duration[i])) {
              _selectedDuration.remove(_duration[i]);
            } else {
              _selectedDuration.add(_duration[i]);
            }
          });
        },
        child: optionDurationChip(
            isSelected: _selectedDuration.contains(_duration[i]),
            option: _duration[i]),
      ));
    }
    for (i = 0; i < _type.length; i++) {
      typeWidget.add(optionTypeChip(
          isSelected: _selectedType.contains(_type[i]), option: _type[i]));
    }

    return Container(
      width: 300,
      margin: Spacing.y(16),
      padding: Spacing.xy(24,16),
      decoration: BoxDecoration(
          color: customAppTheme.bgLayer1,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16))),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        "Filter",
                        style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 700),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: Spacing.all(6),
                      decoration: BoxDecoration(
                        color: themeData.colorScheme.primary.withAlpha(40),
                        shape: BoxShape.circle
                      ),
                      child: Icon(MdiIcons.check,color: themeData.colorScheme.primary,size: 20,),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: Spacing.top(24),
              child: Text(
                "Course",
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                    color: themeData.colorScheme.onBackground,
                    fontWeight: 600),
              ),
            ),
            Container(
              margin: Spacing.top(12),
              child: Wrap(
                spacing: 8,
                runSpacing: 12,
                children: courseWidget,
              ),
            ),
            Container(
              margin: Spacing.top(24),
              child: Text(
                "Type",
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                    color: themeData.colorScheme.onBackground,
                    fontWeight: 600),
              ),
            ),
            Container(
              margin: Spacing.top(12),
              child: Wrap(
                spacing: 8,
                runSpacing: 12,
                children: typeWidget,
              ),
            ),
            Container(
              margin: Spacing.top(24),
              child: Text(
                "Duration",
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                    color: themeData.colorScheme.onBackground,
                    fontWeight: 600),
              ),
            ),
            Container(
              margin: Spacing.top(12),
              child: Wrap(
                spacing: 8,
                runSpacing: 12,
                children: durationWidget,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget optionCourseChip({String option, bool isSelected}) {
    return InkWell(
      onTap: () {
        setState(() {
          if (_selectedCourse.contains(option)) {
            _selectedCourse.remove(option);
          } else {
            _selectedCourse.add(option);
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color:
                isSelected ? themeData.colorScheme.primary : customAppTheme.bgLayer2,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        padding: Spacing.fromLTRB(10, 6, 10, 6),
        child: Text(
          option,
          style: AppTheme.getTextStyle(themeData.textTheme.caption,
              color: isSelected
                  ? themeData.colorScheme.onPrimary
                  : themeData.colorScheme.onBackground),
        ),
      ),
    );
  }

  Widget optionTypeChip({String option, bool isSelected}) {
    return InkWell(
      onTap: () {
        setState(() {
          if (_selectedType.contains(option)) {
            _selectedType.remove(option);
          } else {
            _selectedType.add(option);
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color:
                isSelected ? themeData.colorScheme.primary : customAppTheme.bgLayer2,

            borderRadius: BorderRadius.all(Radius.circular(16))),
        padding: Spacing.fromLTRB(10, 6, 10, 6),
        child: Text(
          option,
          style: AppTheme.getTextStyle(themeData.textTheme.caption,
              color: isSelected
                  ? themeData.colorScheme.onPrimary
                  : themeData.colorScheme.onBackground),
        ),
      ),
    );
  }

  Widget optionDurationChip({String option, bool isSelected}) {
    return InkWell(
      onTap: () {
        setState(() {
          if (_selectedDuration.contains(option)) {
            _selectedDuration.remove(option);
          } else {
            _selectedDuration.add(option);
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color:
                isSelected ? themeData.colorScheme.primary :customAppTheme.bgLayer2,

            borderRadius: BorderRadius.all(Radius.circular(16))),
        padding: Spacing.fromLTRB(10, 6, 10, 6),
        child: Text(
          option,
          style: AppTheme.getTextStyle(themeData.textTheme.caption,
              color: isSelected
                  ? themeData.colorScheme.onPrimary
                  : themeData.colorScheme.onBackground),
        ),
      ),
    );
  }
}

