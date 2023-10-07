// ignore_for_file: unnecessary_string_escapes

import 'package:flutkit/full_apps/other/cookify/models/date_time.dart';
import 'package:flutkit/full_apps/other/cookify/models/meal_plan.dart';
import 'package:flutkit/full_apps/other/cookify/views/recipe_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class CookifyMealPlanScreen extends StatefulWidget {
  @override
  _CookifyMealPlanScreenState createState() => _CookifyMealPlanScreenState();
}

class _CookifyMealPlanScreenState extends State<CookifyMealPlanScreen> {
  int _selectedDate = 0;
  late List<DateTime> _listDateTime;
  late List<MealPlan> _listMealPlan;
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    _listDateTime = DateTime.getList();
    _listMealPlan = MealPlan.getList();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: customTheme.cookifyPrimary.withAlpha(40))),
      child: SafeArea(
        child: Scaffold(
          body: ListView(padding: MySpacing.all(24), children: [
            MyText.headlineSmall("Today\'s Plan",
                fontWeight: 700, letterSpacing: -0.2),
            MySpacing.height(16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: buildDateTime(),
              ),
            ),
            MySpacing.height(24),
            MyContainer(
              color: customTheme.cookifyPrimary.withAlpha(40),
              child: Column(
                children: [
                  Center(
                      child: MyText.titleLarge(
                    "Vitamins & Minerals",
                    color: customTheme.cookifyPrimary,
                    fontWeight: 600,
                  )),
                  MySpacing.height(4),
                  Center(
                      child: MyText.bodySmall(
                    "How Much Should You Take?",
                    color: theme.colorScheme.onBackground,
                    xMuted: true,
                    letterSpacing: 0,
                  )),
                  MySpacing.height(16),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            MyText.headlineLarge(
                              "80",
                              fontWeight: 800,
                              color: customTheme.cookifyPrimary,
                            ),
                            MyText.bodySmall(
                              "Vitamin A",
                              xMuted: true,
                              letterSpacing: 0,
                              fontSize: 10,
                            )
                          ],
                        )),
                        VerticalDivider(
                          thickness: 1,
                          color: customTheme.cookifyPrimary.withAlpha(200),
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            MyText.headlineLarge(
                              "16",
                              fontWeight: 800,
                              color: customTheme.cookifyPrimary,
                            ),
                            MyText.bodySmall(
                              "Vitamin B",
                              fontSize: 10,
                              xMuted: true,
                              letterSpacing: 0,
                            )
                          ],
                        )),
                        VerticalDivider(
                          thickness: 1,
                          color: customTheme.cookifyPrimary.withAlpha(200),
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            MyText.headlineLarge(
                              "97",
                              fontWeight: 800,
                              color: customTheme.cookifyPrimary,
                            ),
                            MyText.bodySmall(
                              "Water",
                              xMuted: true,
                              letterSpacing: 0,
                              fontSize: 10,
                            )
                          ],
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            MySpacing.height(24),
            Column(
              children: buildMealPlan(),
            )
          ]),
        ),
      ),
    );
  }

  List<Widget> buildDateTime() {
    List<Widget> list = [];

    for (int i = 0; i < _listDateTime.length; i++) {
      list.add(singleDateTime(i));
    }

    return list;
  }

  Widget singleDateTime(int index) {
    DateTime dateTime = _listDateTime[index];
    bool active = _selectedDate == index;

    return MyContainer.none(
      onTap: () {
        setState(() {
          _selectedDate = index;
        });
      },
      splashColor: customTheme.cookifyPrimary.withAlpha(40),
      width: 40,
      margin: MySpacing.x(2),
      padding: MySpacing.y(8),
      borderRadiusAll: 4,
      color: active ? customTheme.cookifyPrimary : Colors.transparent,
      child: Column(
        children: [
          MyText.bodySmall(dateTime.date,
              color: active
                  ? customTheme.cookifyOnPrimary
                  : theme.colorScheme.onBackground),
          MySpacing.height(8),
          MyText.bodySmall(dateTime.day,
              color: active
                  ? customTheme.cookifyOnPrimary
                  : theme.colorScheme.onBackground),
        ],
      ),
    );
  }

  List<Widget> buildMealPlan() {
    List<Widget> list = [];

    for (MealPlan mealPlan in _listMealPlan) {
      list.add(singleMealPlan(mealPlan));
    }

    return list;
  }

  Widget singleMealPlan(MealPlan mealPlan) {
    return InkWell(
      child: MyContainer.none(
        splashColor: customTheme.cookifyPrimary.withAlpha(40),
        onTap: () {
          Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(builder: (context) => CookifyRecipeScreen()));
        },
        color: Colors.transparent,
        margin: MySpacing.bottom(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.bodyMedium(mealPlan.type, muted: true, letterSpacing: 0),
            MySpacing.height(8),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                    image: AssetImage(mealPlan.image),
                    height: 56,
                    width: 56,
                  ),
                ),
                MySpacing.width(8),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText.bodyMedium(mealPlan.title,
                        fontWeight: 700, letterSpacing: 0),
                    MySpacing.height(8),
                    MyText.bodySmall(mealPlan.time,
                        muted: true, letterSpacing: 0),
                  ],
                )),
                Icon(
                  Icons.chevron_right,
                  color: theme.colorScheme.onBackground,
                  size: 20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
