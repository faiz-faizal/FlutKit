import 'package:flutkit/full_apps/m3/cookify/controllers/meal_plan_controller.dart';
import 'package:flutkit/full_apps/m3/cookify/models/date_time.dart';
import 'package:flutkit/full_apps/m3/cookify/models/meal_plan.dart';
import 'package:flutkit/full_apps/m3/cookify/views/recipe_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MealPlanScreen extends StatefulWidget {
  @override
  _MealPlanScreenState createState() => _MealPlanScreenState();
}

class _MealPlanScreenState extends State<MealPlanScreen> {
  late ThemeData theme;
  late MealPlanController controller;

  @override
  void initState() {
    super.initState();
    controller = MealPlanController();
    theme = AppTheme.cookifyTheme;
  }

  List<Widget> buildDateTime() {
    List<Widget> list = [];

    for (int i = 0; i < controller.listDateTime.length; i++) {
      list.add(singleDateTime(i));
    }

    return list;
  }

  Widget singleDateTime(int index) {
    DateTime dateTime = controller.listDateTime[index];
    bool active = controller.selectedDate == index;

    return MyContainer.none(
      onTap: () {
        setState(() {
          controller.selectedDate = index;
        });
      },
      splashColor: theme.colorScheme.primaryContainer,
      width: 40,
      margin: MySpacing.x(2),
      padding: MySpacing.y(8),
      borderRadiusAll: 4,
      color: active ? theme.colorScheme.primary : Colors.transparent,
      child: Column(
        children: [
          MyText.bodySmall(dateTime.date,
              color: active
                  ? theme.colorScheme.onPrimary
                  : theme.colorScheme.onBackground),
          MySpacing.height(8),
          MyText.bodySmall(dateTime.day,
              color: active
                  ? theme.colorScheme.onPrimary
                  : theme.colorScheme.onBackground),
        ],
      ),
    );
  }

  List<Widget> buildMealPlan() {
    List<Widget> list = [];

    for (MealPlan mealPlan in controller.listMealPlan) {
      list.add(singleMealPlan(mealPlan));
    }

    return list;
  }

  Widget singleMealPlan(MealPlan mealPlan) {
    return InkWell(
      child: MyContainer.none(
        splashColor: theme.colorScheme.primaryContainer,
        onTap: () {
          Navigator.of(context, rootNavigator: true)
              .push(MaterialPageRoute(builder: (context) => RecipeScreen()));
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

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MealPlanController>(
        init: controller,
        tag: 'meal_plan_controller',
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
        body: Padding(
          padding: MySpacing.top(MySpacing.safeAreaTop(context) + 16),
          child: LoadingEffect.getSearchLoadingScreen(context),
        ),
      );
    } else {
      return Scaffold(
        body: ListView(
            padding: MySpacing.fromLTRB(
                20, MySpacing.safeAreaTop(context) + 20, 20, 20),
            children: [
              MyText.displaySmall("Today's Plan",
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
                color: theme.colorScheme.primaryContainer,
                child: Column(
                  children: [
                    Center(
                        child: MyText.titleLarge(
                      "Vitamins & Minerals",
                      color: theme.colorScheme.primary,
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
                              MyText.displayLarge(
                                "80",
                                fontWeight: 800,
                                color: theme.colorScheme.primary,
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
                            color: theme.colorScheme.primary.withAlpha(200),
                          ),
                          Expanded(
                              child: Column(
                            children: [
                              MyText.displayLarge(
                                "16",
                                fontWeight: 800,
                                color: theme.colorScheme.primary,
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
                            color: theme.colorScheme.primary.withAlpha(200),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                MyText.displayLarge(
                                  "97",
                                  fontWeight: 800,
                                  color: theme.colorScheme.primary,
                                ),
                                MyText.bodySmall(
                                  "Water",
                                  xMuted: true,
                                  letterSpacing: 0,
                                  fontSize: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              MySpacing.height(24),
              Column(
                children: buildMealPlan(),
              ),
            ]),
      );
    }
  }
}
