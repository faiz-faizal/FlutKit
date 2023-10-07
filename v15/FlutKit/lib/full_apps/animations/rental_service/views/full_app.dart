import 'package:flutkit/full_apps/animations/rental_service/controllers/full_app_controller.dart';
import 'package:flutkit/full_apps/animations/rental_service/views/collection_screen.dart';
import 'package:flutkit/full_apps/animations/rental_service/views/home_screen.dart';
import 'package:flutkit/full_apps/animations/rental_service/views/profile_screen.dart';
import 'package:flutkit/full_apps/animations/rental_service/views/saved_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_tab_indicator_style.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RentalServiceFullApp extends StatefulWidget {
  const RentalServiceFullApp({Key? key}) : super(key: key);

  @override
  _RentalServiceFullAppState createState() => _RentalServiceFullAppState();
}

class _RentalServiceFullAppState extends State<RentalServiceFullApp>
    with TickerProviderStateMixin {
  late ThemeData theme;
  late FullAppController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.rentalServiceTheme;
    controller = FullAppController(this);
  }

  List<Widget> buildTab() {
    List<Widget> tabs = [];

    for (int i = 0; i < controller.navItems.length; i++) {
      bool selected = controller.currentIndex == i;
      tabs.add(Column(
        children: [
          Icon(
            controller.navItems[i].iconData,
            size: selected ? 18 : 20,
            color: selected
                ? theme.colorScheme.primary
                : theme.colorScheme.onBackground,
          ),
          MySpacing.height(selected ? 8 : 0),
          selected
              ? MyText.bodySmall(controller.navItems[i].title,
                  fontSize: 10, color: theme.colorScheme.primary)
              : Container(),
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
        // theme: theme,
        builder: (controller) {
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: TabBarView(
                    controller: controller.tabController,
                    children: const <Widget>[
                      HomeScreen(),
                      CollectionScreen(),
                      SavedScreen(),
                      ProfileScreen(),
                    ],
                  ),
                ),
                MyContainer(
                  bordered: true,
                  enableBorderRadius: false,
                  border: Border(
                      top: BorderSide(
                          color: theme.dividerColor,
                          width: 1,
                          style: BorderStyle.solid)),
                  padding: MySpacing.xy(12, 8),
                  color: theme.scaffoldBackgroundColor,
                  child: TabBar(
                    controller: controller.tabController,
                    indicator: MyTabIndicator(
                        indicatorColor: theme.colorScheme.primary,
                        indicatorHeight: 3,
                        radius: 3,
                        indicatorStyle: MyTabIndicatorStyle.rectangle,
                        yOffset: -10),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: theme.colorScheme.primary,
                    tabs: buildTab(),
                  ),
                )
              ],
            ),
          );
        });
  }
}
