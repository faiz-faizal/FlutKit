import 'package:flutkit/full_apps/m3/learning/controllers/explore_controller.dart';
import 'package:flutkit/full_apps/m3/learning/models/mentor.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late ThemeData theme;
  late ExploreController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.learningTheme;
    controller = ExploreController();
  }

  Widget _buildMentors() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          MySpacing.width(8),
          ...controller.mentors!
              .map((mentor) => _buildSingleMentor(mentor))
              .toList(),
          MySpacing.width(8),
        ],
      ),
    );
  }

  List<Widget> _buildCourseList() {
    List<Widget> list = [];

    for (String course in controller.courses) {
      list.add(_buildSingleCourse(course));
    }
    return list;
  }

  Widget _buildSingleMentor(Mentor mentor) {
    return Padding(
      padding: MySpacing.x(8),
      child: Column(
        children: [
          MyContainer.rounded(
            paddingAll: 0,
            child: Image(
              height: 60,
              width: 60,
              fit: BoxFit.cover,
              image: AssetImage(mentor.image),
            ),
          ),
          MySpacing.height(8),
          MyText.bodySmall(
            mentor.name,
            fontWeight: 600,
          ),
        ],
      ),
    );
  }

  Widget _buildSingleCourse(String course) {
    return MyContainer.bordered(
      onTap: () {
        controller.onTap(course);
      },
      borderRadiusAll: 20,
      border: controller.selectedCourses.contains(course)
          ? Border.all(color: theme.colorScheme.secondary)
          : Border.all(color: Colors.transparent),
      color: controller.selectedCourses.contains(course)
          ? theme.colorScheme.secondaryContainer
          : theme.colorScheme.primaryContainer,
      padding: MySpacing.xy(12, 8),
      child: MyText.bodySmall(
        course,
        fontWeight: controller.selectedCourses.contains(course) ? 600 : 500,
        color: controller.selectedCourses.contains(course)
            ? theme.colorScheme.secondary
            : theme.colorScheme.onBackground,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExploreController>(
        init: controller,
        tag: 'explore_controller',
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
            MyContainer(
              margin: MySpacing.x(20),
              padding: MySpacing.y(1),
              color: theme.colorScheme.primaryContainer,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              borderRadiusAll: Constant.containerRadius.large,
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        cursorColor: theme.colorScheme.onBackground,
                        maxLines: 1,
                        style: MyTextStyle.bodyMedium(),
                        decoration: InputDecoration(
                          hintText: "Search ...",
                          hintStyle: MyTextStyle.bodyMedium(
                              color: theme.colorScheme.onBackground),
                          contentPadding: MySpacing.y(16),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          filled: true,
                          isDense: true,
                          fillColor: theme.colorScheme.primaryContainer,
                          prefixIcon: Icon(
                            LucideIcons.search,
                            size: 20,
                            color: theme.colorScheme.onBackground,
                          ),
                        ),
                      ),
                    ),
                    MySpacing.width(8),
                    Container(
                        padding: MySpacing.y(8),
                        child: VerticalDivider(
                          thickness: 1.1,
                          color: theme.colorScheme.outline,
                        )),
                    MySpacing.width(8),
                    Icon(
                      LucideIcons.sliders,
                      size: 20,
                      color: theme.colorScheme.onBackground,
                    ),
                    MySpacing.width(20),
                  ],
                ),
              ),
            ),
            MySpacing.height(20),
            Padding(
              padding: MySpacing.x(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText.labelLarge(
                    'POPULAR MENTORS',
                    fontWeight: 700,
                  ),
                  Icon(
                    LucideIcons.moreHorizontal,
                  ),
                ],
              ),
            ),
            MySpacing.height(20),
            _buildMentors(),
            MySpacing.height(20),
            Padding(
              padding: MySpacing.x(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText.labelLarge(
                    'COURSES',
                    fontWeight: 700,
                  ),
                  Icon(
                    LucideIcons.moreHorizontal,
                  ),
                ],
              ),
            ),
            MySpacing.height(20),
            Container(
              padding: MySpacing.x(20),
              child: Wrap(
                runSpacing: 8,
                spacing: 8,
                children: _buildCourseList(),
              ),
            ),
            MySpacing.height(20),
            Padding(
              padding: MySpacing.x(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText.labelLarge(
                    'RESULT (5)',
                    fontWeight: 700,
                  ),
                  Icon(
                    LucideIcons.moreHorizontal,
                  ),
                ],
              ),
            ),
            MySpacing.height(20),
            ...controller.courseList!.map((course) {
              return Padding(
                padding: MySpacing.nTop(20),
                child: Row(
                  children: [
                    MyContainer.rounded(
                      paddingAll: 12,
                      color: theme.colorScheme.primaryContainer,
                      child: Icon(
                        course.iconData,
                        color: theme.colorScheme.primary,
                        size: 22,
                      ),
                    ),
                    MySpacing.width(20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText.labelMedium(
                          course.lastChapter,
                          fontWeight: 700,
                        ),
                        MySpacing.height(8),
                        MyText.bodySmall(
                          course.name,
                          muted: true,
                          fontSize: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList()
          ],
        ),
      );
    }
  }
}
