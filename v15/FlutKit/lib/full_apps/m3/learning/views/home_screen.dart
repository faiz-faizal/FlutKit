import 'package:flutkit/full_apps/m3/learning/controllers/home_controller.dart';
import 'package:flutkit/full_apps/m3/learning/models/course.dart';
import 'package:flutkit/full_apps/m3/learning/models/module.dart';
import 'package:flutkit/full_apps/m3/learning/models/recent_course.dart';
import 'package:flutkit/helpers/localizations/language.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ThemeData theme;
  late HomeController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.learningTheme;
    controller = HomeController();
  }

  List<Widget> _buildCourseList() {
    List<Widget> list = [];

    for (Course course in controller.courses!) {
      list.add(Expanded(
        child: Column(
          children: [
            MyContainer.rounded(
              paddingAll: 12,
              color: theme.colorScheme.primaryContainer,
              child: Icon(
                course.iconData,
                color: theme.colorScheme.primary,
                size: 20,
              ),
            ),
            MySpacing.height(8),
            MyText.labelMedium(
              course.name,
            ),
          ],
        ),
      ));
    }

    return list;
  }

  List<Widget> _buildRecentCourseList() {
    List<Widget> list = [];

    for (RecentCourse recentCourse in controller.recentCourses!) {
      list.add(MyContainer(
        onTap: () {
          controller.goToSingleCourseScreen(recentCourse);
        },
        padding:
            MySpacing.fromLTRB(12, 20, Language.autoDirection(16.0, 12.0)!, 20),
        margin: MySpacing.nTop(20),
        borderRadiusAll: Constant.containerRadius.medium,
        color: theme.colorScheme.primaryContainer,
        child: Row(
          children: [
            Image(
              image: AssetImage(recentCourse.icon),
              height: 40,
              width: 40,
              color: theme.colorScheme.primary,
            ),
            MySpacing.width(8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText.labelMedium(
                    recentCourse.name,
                    fontWeight: 700,
                  ),
                  MySpacing.height(6),
                  MyText.labelSmall(
                    recentCourse.time,
                    xMuted: true,
                    fontWeight: 600,
                  ),
                ],
              ),
            ),
            MySpacing.width(8),
            Stack(
              children: [
                MyContainer.rounded(
                  paddingAll: 6,
                  color: theme.colorScheme.onPrimary,
                  child: Icon(
                    Icons.play_arrow,
                    color: theme.colorScheme.primary,
                  ),
                ),
                CircularProgressIndicator(
                  value: recentCourse.completed / 100,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
                  strokeWidth: 2,
                ),
              ],
            ),
          ],
        ),
      ));
    }

    return list;
  }

  Widget _buildModules() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          MySpacing.width(8),
          ...controller.modules!
              .map((module) => _buildSingleModule(module))
              .toList(),
          MySpacing.width(8),
        ],
      ),
    );
  }

  Widget _buildSingleModule(Module module) {
    bool selected = controller.selectedModule == module;
    return MyContainer(
      bordered: true,
      margin: MySpacing.x(8),
      width: 108,
      onTap: () {
        controller.onChangeSingleModule(module);
      },
      border: Border.all(
          color: selected ? theme.colorScheme.secondary : Colors.transparent),
      padding: MySpacing.xy(20, 20),
      borderRadiusAll: Constant.containerRadius.medium,
      color: theme.colorScheme.secondaryContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            module.iconData,
            color: theme.colorScheme.secondary,
            size: 20,
          ),
          MySpacing.height(20),
          MyText.labelMedium(
            module.name,
            color: theme.colorScheme.onSecondaryContainer,
          ),
          MySpacing.height(4),
          MyText.bodySmall(
            module.chapter,
            muted: true,
            fontSize: 10,
            color: theme.colorScheme.onSecondaryContainer,
          ),
          MySpacing.height(20),
          Row(
            children: [
              Icon(
                LucideIcons.clock,
                size: 12,
                color: selected
                    ? theme.colorScheme.onSecondaryContainer
                    : theme.colorScheme.onSecondaryContainer.withAlpha(120),
              ),
              MySpacing.width(8),
              MyText.bodySmall(
                module.time,
                muted: selected ? true : false,
                fontSize: 10,
                color: theme.colorScheme.onSecondaryContainer,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: controller,
        tag: 'home_controller',
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
        body: LoadingEffect.getSearchLoadingScreen(
          context,
        ),
      );
    } else {
      return Scaffold(
        body: ListView(
          padding: MySpacing.zero,
          children: [
            MyContainer.bordered(
              padding: MySpacing.xy(32, 20),
              margin: MySpacing.x(20),
              borderRadiusAll: Constant.containerRadius.medium,
              onTap: () {
                controller.goToPricingScreen();
              },
              border: Border.all(color: theme.colorScheme.primary),
              color: theme.colorScheme.primaryContainer,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText.labelMedium(
                    'Upgrade your plan \nto Premium',
                    fontWeight: 700,
                    color: theme.colorScheme.primary,
                    letterSpacing: 0.5,
                    height: 1.4,
                  ),
                  MyContainer(
                    borderRadiusAll: Constant.buttonRadius.large,
                    padding: MySpacing.xy(20, 10),
                    color: theme.colorScheme.primary,
                    child: MyText.labelMedium(
                      'Upgrade',
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
            MySpacing.height(20),
            Padding(
              padding: MySpacing.x(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText.labelMedium(
                    'POPULAR COURSES',
                    fontWeight: 700,
                  ),
                  Icon(
                    LucideIcons.moreHorizontal,
                  ),
                ],
              ),
            ),
            MySpacing.height(20),
            Padding(
              padding: MySpacing.x(20),
              child: Row(
                children: _buildCourseList(),
              ),
            ),
            MySpacing.height(20),
            Padding(
              padding: MySpacing.x(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText.labelMedium(
                    'CONTINUE LEARNING',
                    fontWeight: 700,
                  ),
                  Icon(
                    LucideIcons.moreHorizontal,
                  ),
                ],
              ),
            ),
            MySpacing.height(20),
            _buildModules(),
            MySpacing.height(20),
            Padding(
              padding: MySpacing.x(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText.labelMedium(
                    'LAST SEEN COURSES',
                    fontWeight: 700,
                  ),
                  Icon(
                    LucideIcons.moreHorizontal,
                  ),
                ],
              ),
            ),
            MySpacing.height(20),
            Column(
              children: _buildRecentCourseList(),
            ),
          ],
        ),
      );
    }
  }
}
