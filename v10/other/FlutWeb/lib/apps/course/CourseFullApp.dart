import 'package:flutkit/widgets/custom/MyBottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppNotifier.dart';
import '../../AppTheme.dart';
import 'CourseHomeScreen.dart';
import 'CourseProfileScreen.dart';
import 'CourseSearchScreen.dart';
import 'CourseTasksScreen.dart';

class CourseFullApp extends StatefulWidget {
  @override
  _CourseFullAppState createState() => _CourseFullAppState();
}

class _CourseFullAppState extends State<CourseFullApp>
    with SingleTickerProviderStateMixin {
  //Theme
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
            MdiIcons.homeOutline,
            MdiIcons.magnify,
            MdiIcons.chartTimelineVariant,
            MdiIcons.downloadOutline,
          ],
          activeIcons: [
            MdiIcons.home,
            MdiIcons.magnify,
            MdiIcons.chartTimelineVariant,
            MdiIcons.download,
          ],
          screens: [
            CourseHomeScreen(),
            CourseSearchScreen(),
            CourseTasksScreen(),
            CourseProfileScreen(),
          ],
          titles: ["Home", "Search", "Timeline", "Account"],
          color: themeData.colorScheme.onBackground,
          activeColor: themeData.colorScheme.primary,
          navigationBackground: customAppTheme.bgLayer1,
          brandTextColor: themeData.colorScheme.onBackground,
          initialIndex: 0,
          verticalDividerColor: customAppTheme.border2,
          bottomNavigationElevation: 8,
        );
      },
    );
  }
}
