import 'package:flutkit/full_apps/m3/learning/controllers/single_course_controller.dart';
import 'package:flutkit/full_apps/m3/learning/models/recent_course.dart';
import 'package:flutkit/helpers/extensions/extensions.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/images.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SingleCourseScreen extends StatefulWidget {
  final RecentCourse recentCourse;

  const SingleCourseScreen(
    this.recentCourse, {
    Key? key,
  }) : super(key: key);

  @override
  _SingleCourseScreenState createState() => _SingleCourseScreenState();
}

class _SingleCourseScreenState extends State<SingleCourseScreen> {
  late ThemeData theme;
  late SingleCourseController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.learningTheme;
    controller = SingleCourseController(widget.recentCourse);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingleCourseController>(
        init: controller,
        tag: 'single_course_controller',
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
        body: Padding(
          padding: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
          child: LoadingEffect.getSearchLoadingScreen(context),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () {
              controller.goBack();
            },
            child: Icon(
              LucideIcons.chevronLeft,
              size: 20,
              color: theme.colorScheme.onBackground,
            ).autoDirection(),
          ),
        ),
        body: Padding(
          padding: MySpacing.nTop(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText.bodyLarge(
                      controller.recentCourse.name,
                      fontWeight: 700,
                    ),
                    MySpacing.height(8),
                    MyText.bodySmall(
                      controller.recentCourse.professor,
                      fontWeight: 600,
                      xMuted: true,
                    ),
                    MyContainer(
                      paddingAll: 20,
                      margin: MySpacing.y(20),
                      color: theme.colorScheme.primaryContainer,
                      borderRadiusAll: Constant.containerRadius.medium,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Center(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(Images.courseBanner),
                          width: 200,
                        ),
                      ),
                    ),
                    MySpacing.height(8),
                    MyText.bodySmall(
                      controller.recentCourse.description,
                      xMuted: true,
                      height: 1.2,
                    ),
                    MySpacing.height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText.titleMedium(
                          'Course Details',
                          fontWeight: 600,
                        ),
                        MyContainer(
                          padding: MySpacing.xy(20, 8),
                          borderRadiusAll: Constant.containerRadius.medium,
                          border: Border.all(color: theme.colorScheme.primary),
                          color: theme.colorScheme.primary.withAlpha(40),
                          child: Row(
                            children: [
                              Icon(
                                LucideIcons.clock,
                                size: 20,
                                color: theme.colorScheme.primary,
                              ),
                              MySpacing.width(8),
                              MyText.bodySmall(
                                controller.recentCourse.time,
                                fontWeight: 600,
                                color: theme.colorScheme.primary,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    MySpacing.height(20),
                    Row(
                      children: [
                        Expanded(
                          child: MyContainer.bordered(
                            color: Colors.transparent,
                            border:
                                Border.all(color: theme.colorScheme.primary),
                            borderRadiusAll: Constant.containerRadius.medium,
                            child: Column(
                              children: [
                                MyText.displaySmall(
                                  controller.recentCourse.chapter.toString(),
                                  color: theme.colorScheme.primary,
                                  fontWeight: 600,
                                ),
                                MySpacing.height(4),
                                MyText.bodySmall(
                                  'Chapters',
                                  color: theme.colorScheme.onBackground,
                                ),
                              ],
                            ),
                          ),
                        ),
                        MySpacing.width(20),
                        Expanded(
                          child: MyContainer.bordered(
                            color: Colors.transparent,
                            border:
                                Border.all(color: theme.colorScheme.primary),
                            borderRadiusAll: Constant.containerRadius.medium,
                            child: Column(
                              children: [
                                MyText.displaySmall(
                                  controller.recentCourse.exam.toString(),
                                  color: theme.colorScheme.primary,
                                  fontWeight: 600,
                                ),
                                MySpacing.height(4),
                                MyText.bodySmall(
                                  'Exams',
                                  color: theme.colorScheme.onBackground,
                                ),
                              ],
                            ),
                          ),
                        ),
                        MySpacing.width(20),
                        Expanded(
                          child: MyContainer.bordered(
                            color: Colors.transparent,
                            border:
                                Border.all(color: theme.colorScheme.primary),
                            borderRadiusAll: Constant.containerRadius.medium,
                            child: Column(
                              children: [
                                MyText.displaySmall(
                                  controller.recentCourse.reward.toString(),
                                  color: theme.colorScheme.primary,
                                  fontWeight: 600,
                                ),
                                MySpacing.height(4),
                                MyText.bodySmall(
                                  'Rewards',
                                  color: theme.colorScheme.onBackground,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(20),
              MyButton.block(
                borderRadiusAll: Constant.buttonRadius.large,
                splashColor: theme.colorScheme.onPrimary.withAlpha(20),
                elevation: 0,
                backgroundColor: theme.colorScheme.primary,
                onPressed: () {},
                child: MyText.bodyLarge(
                  'Start Course',
                  fontWeight: 600,
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
