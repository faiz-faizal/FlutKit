import 'package:flutkit/apps/food/FoodFavouriteScreen.dart';
import 'package:flutkit/apps/food/FoodHomeScreen.dart';
import 'package:flutkit/apps/food/FoodLocationScreen.dart';
import 'package:flutkit/apps/food/FoodProfileScreen.dart';
import 'package:flutkit/widgets/custom/MyBottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppNotifier.dart';
import '../../AppTheme.dart';

class FoodFullApp extends StatefulWidget {
  @override
  _FoodFullAppState createState() => _FoodFullAppState();
}

class _FoodFullAppState extends State<FoodFullApp>
    with SingleTickerProviderStateMixin {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  int _currentIndex = 1;

  TabController _tabController;

  _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController.index;
    });
  }

  @override
  void initState() {
    _tabController = new TabController(length: 4, vsync: this, initialIndex: 1);
    _tabController.addListener(_handleTabSelection);
    _tabController.animation.addListener(() {
      final aniValue = _tabController.animation.value;
      if (aniValue - _currentIndex > 0.5) {
        setState(() {
          _currentIndex = _currentIndex + 1;
        });
      } else if (aniValue - _currentIndex < -0.5) {
        setState(() {
          _currentIndex = _currentIndex - 1;
        });
      }
    });
    super.initState();
  }

  onTapped(value) {
    setState(() {
      _currentIndex = value;
    });
  }

  dispose() {
    super.dispose();
    _tabController.dispose();
  }

  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget child) {
        themeData = AppTheme.getThemeFromThemeMode(value.themeMode());
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return MyBottomNavigation(
          icons: [
            MdiIcons.food,
            MdiIcons.mapMarkerOutline,
            MdiIcons.heartOutline,
            MdiIcons.accountOutline,
          ],
          activeIcons: [
            MdiIcons.food,
            MdiIcons.mapMarker,
            MdiIcons.heart,
            MdiIcons.account,
          ],
          screens: [
            FoodHomeScreen(),
            FoodLocationScreen(rootContext: context),
            FoodFavouriteScreen(),
            FoodProfileScreen(rootContext: context),
          ],
          titles: ["Food", "Search", "Timeline", "Account"],
          color: themeData.colorScheme.onBackground,
          activeColor: themeData.colorScheme.primary,
          navigationBackground: customAppTheme.bgLayer1,
          brandTextColor: themeData.colorScheme.onBackground,
          initialIndex: 2,
          verticalDividerColor: customAppTheme.border2,
          bottomNavigationElevation: 8,
        );
      },
    );
  }
}
