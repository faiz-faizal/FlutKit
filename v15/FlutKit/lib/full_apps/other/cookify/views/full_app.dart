import 'package:flutkit/full_apps/other/cookify/views/home_screen.dart';
import 'package:flutkit/full_apps/other/cookify/views/meal_plan_screen.dart';
import 'package:flutkit/full_apps/other/cookify/views/profile_screen.dart';
import 'package:flutkit/full_apps/other/cookify/views/showcase_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_bottom_navigation_bar.dart';
import 'package:flutkit/helpers/widgets/my_bottom_navigation_bar_item.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';

class CookifyFullApp extends StatefulWidget {
  @override
  _CookifyFullAppState createState() => _CookifyFullAppState();
}

class _CookifyFullAppState extends State<CookifyFullApp> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: customTheme.cookifyPrimary.withAlpha(40))),
      child: Scaffold(
        body: MyBottomNavigationBar(
          activeTitleStyle: MyTextStyle.bodySmall(
              color: customTheme.cookifyPrimary, fontWeight: 800),
          itemList: [
            MyBottomNavigationBarItem(
              page: CookifyHomeScreen(),
              icon: Icon(
                Icons.cottage_outlined,
                color: customTheme.cookifyPrimary,
                size: 24,
              ),
              activeIcon: Icon(
                Icons.cottage,
                color: customTheme.cookifyPrimary,
                size: 24,
              ),
              title: "Home",
              // activeIconColor: customTheme.cookifyPrimary,
            ),
            MyBottomNavigationBarItem(
              page: CookifyShowcaseScreen(),
              icon: Icon(
                Icons.menu_book_outlined,
                color: customTheme.cookifyPrimary,
                size: 24,
              ),
              activeIcon: Icon(
                Icons.menu_book,
                color: customTheme.cookifyPrimary,
                size: 24,
              ),
              title: "Showcase",
              activeIconColor: customTheme.cookifyPrimary,
              activeTitleColor: customTheme.cookifyPrimary,
            ),
            MyBottomNavigationBarItem(
              page: CookifyMealPlanScreen(),
              icon: Icon(
                Icons.lunch_dining_outlined,
                color: customTheme.cookifyPrimary,
                size: 24,
              ),
              activeIcon: Icon(
                Icons.lunch_dining,
                color: customTheme.cookifyPrimary,
                size: 24,
              ),
              title: "Meal",
              activeIconColor: customTheme.cookifyPrimary,
              activeTitleColor: customTheme.cookifyPrimary,
            ),
            MyBottomNavigationBarItem(
              page: CookifyProfileScreen(),
              icon: Icon(
                Icons.person_outline,
                color: customTheme.cookifyPrimary,
                size: 24,
              ),
              activeIcon: Icon(
                Icons.person,
                color: customTheme.cookifyPrimary,
                size: 24,
              ),
              title: "Setting",
              activeIconColor: customTheme.cookifyPrimary,
              activeTitleColor: customTheme.cookifyPrimary,
            ),
          ],
          activeContainerColor: customTheme.cookifyPrimary.withAlpha(100),
          myBottomNavigationBarType: MyBottomNavigationBarType.normal,
          backgroundColor: customTheme.card,
          showLabel: false,
          labelSpacing: 8,
          initialIndex: 0,
          labelDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
