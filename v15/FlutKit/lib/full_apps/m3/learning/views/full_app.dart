import 'package:flutkit/full_apps/m3/learning/controllers/full_app_controller.dart';
import 'package:flutkit/full_apps/m3/learning/views/chat_screen.dart';
import 'package:flutkit/full_apps/m3/learning/views/explore_screen.dart';
import 'package:flutkit/full_apps/m3/learning/views/home_screen.dart';
import 'package:flutkit/full_apps/m3/learning/views/profile_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_tab_indicator_style.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FullApp extends StatefulWidget {
  const FullApp({Key? key}) : super(key: key);

  @override
  _FullAppState createState() => _FullAppState();
}

class _FullAppState extends State<FullApp> with SingleTickerProviderStateMixin {
  late ThemeData theme;
  late FullAppController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.learningTheme;
    controller = FullAppController(this);
  }

  List<Widget> buildTab() {
    List<Widget> tabs = [];

    for (int i = 0; i < controller.navItems.length; i++) {
      tabs.add(Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          MyContainer(
            padding: MySpacing.xy(16, 4),
            color: controller.currentIndex == i
                ? theme.colorScheme.primary.withAlpha(80)
                : Colors.transparent,
            borderRadiusAll: 24,
            child: Icon(
              controller.currentIndex == i
                  ? controller.navItems[i].activeIconData
                  : controller.navItems[i].inactiveIconData,
              size: 20,
              color: theme.colorScheme.onBackground,
            ),
          ),
          MySpacing.height(4),
          MyText.bodySmall(controller.navItems[i].title,
              letterSpacing: 0,
              fontWeight: controller.currentIndex == i ? 700 : 500),
        ],
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FullAppController>(
        init: controller,
        tag: 'full_app_controller',
        builder: (shoppingFullAppController) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: MyContainer(
                color: Colors.transparent,
                margin: MySpacing.left(4),
                onTap: () {
                  controller.goToSetting();
                },
                child: Icon(
                  LucideIcons.settings,
                  size: 20,
                ),
              ),
              title: MyText.titleMedium(
                controller.navItems[controller.currentIndex].title
                    .toUpperCase(),
                fontWeight: 700,
              ),
              actions: [
                InkWell(
                  onTap: () {
                    controller.goToTimeTable();
                  },
                  child: Container(
                    margin: MySpacing.x(20),
                    child: Icon(
                      LucideIcons.calendar,
                      size: 20,
                    ),
                  ),
                )
              ],
              centerTitle: true,
            ),
            body: Column(
              children: [
                MySpacing.height(4),
                Expanded(
                  child: TabBarView(
                    controller: controller.tabController,
                    children: const <Widget>[
                      HomeScreen(),
                      ExploreScreen(),
                      ChatScreen(),
                      ProfileScreen(),
                    ],
                  ),
                ),
                MyContainer(
                  borderRadiusAll: 0,
                  color: theme.colorScheme.primaryContainer.withAlpha(100),
                  child: TabBar(
                    controller: controller.tabController,
                    indicator: MyTabIndicator(
                      indicatorColor: Colors.transparent,
                      radius: 0,
                    ),
                    tabs: buildTab(),
                  ),
                )
              ],
            ),
          );
        });
  }
}
