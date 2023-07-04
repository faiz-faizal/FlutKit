import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../controllers/full_app_controller.dart';

class ShoppingManagerFullApp extends StatefulWidget {
  const ShoppingManagerFullApp({Key? key}) : super(key: key);

  @override
  _ShoppingManagerFullAppState createState() => _ShoppingManagerFullAppState();
}

class _ShoppingManagerFullAppState extends State<ShoppingManagerFullApp>
    with SingleTickerProviderStateMixin {
  late FullAppController controller;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(FullAppController(this));
    theme = AppTheme.shoppingManagerTheme;
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<FullAppController>(
        controller: controller,
        theme: theme,
        builder: (controller) {
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                    child: TabBarView(
                  controller: controller.tabController,
                  children: controller.items,
                )),
                FxContainer(
                  bordered: true,
                  enableBorderRadius: false,
                  border: Border(
                      top: BorderSide(
                          color: theme.dividerColor,
                          width: 1,
                          style: BorderStyle.solid)),
                  padding: FxSpacing.xy(12, 16),
                  color: theme.scaffoldBackgroundColor,
                  child: TabBar(
                    controller: controller.tabController,
                    indicator: FxTabIndicator(
                        indicatorColor: theme.colorScheme.primary,
                        indicatorHeight: 3,
                        radius: 3,
                        indicatorStyle: FxTabIndicatorStyle.rectangle,
                        yOffset: -18),
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

  List<Widget> buildTab() {
    List<Widget> tabs = [];

    for (int i = 0; i < controller.navItems.length; i++) {
      bool selected = controller.currentIndex == i;
      tabs.add(Icon(controller.navItems[i].iconData,
          size: 20,
          color: selected
              ? theme.colorScheme.primary
              : theme.colorScheme.onBackground));
    }
    return tabs;
  }
}
