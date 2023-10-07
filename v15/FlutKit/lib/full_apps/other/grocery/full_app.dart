/*
* File : Grocery App
* Version : 1.0.0
* */

import 'package:flutkit/full_apps/other/grocery/cart_screen.dart';
import 'package:flutkit/full_apps/other/grocery/home_screen.dart';
import 'package:flutkit/full_apps/other/grocery/profile_screen.dart';
import 'package:flutkit/full_apps/other/grocery/search_screen.dart';
import 'package:flutkit/helpers/theme/app_notifier.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

class GroceryFullApp extends StatefulWidget {
  @override
  _GroceryFullAppState createState() => _GroceryFullAppState();
}

class _GroceryFullAppState extends State<GroceryFullApp>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  TabController? _tabController;

  _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController!.index;
    });
  }

  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    MyTextStyle.changeFontFamily(GoogleFonts.libreFranklin);

    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController!.addListener(_handleTabSelection);
    _tabController!.animation!.addListener(() {
      final aniValue = _tabController!.animation!.value;
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
  }

  onTapped(value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme.copyWith(
              colorScheme: theme.colorScheme.copyWith(
                  secondary: customTheme.groceryPrimary.withAlpha(80))),
          home: Scaffold(
            body: Stack(
              children: [
                TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    GroceryHomeScreen(
                      rootContext: context,
                    ),
                    GrocerySearchScreen(
                      rootContext: context,
                    ),
                    GroceryCartScreen(
                      rootContext: context,
                    ),
                    GroceryProfileScreen(rootContext: context)
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: MySpacing.all(16),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: customTheme.card.withAlpha(220),
                        // borderRadius: Shape.circular(16)
                      ),
                      padding: MySpacing.vertical(12),
                      child: TabBar(
                        controller: _tabController,
                        indicator: BoxDecoration(),
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor: customTheme.groceryPrimary,
                        tabs: <Widget>[
                          Container(
                            child: (_currentIndex == 0)
                                ? Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      MyText.bodyMedium("Home",
                                          color: customTheme.groceryPrimary,
                                          letterSpacing: 0,
                                          fontWeight: 600),
                                      Container(
                                        margin: MySpacing.top(6),
                                        decoration: BoxDecoration(
                                            color: customTheme.groceryPrimary,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(2.5))),
                                        height: 5,
                                        width: 5,
                                      )
                                    ],
                                  )
                                : Icon(
                                    LucideIcons.home,
                                    size: 20,
                                    color: theme.colorScheme.onBackground,
                                  ),
                          ),
                          Container(
                              child: (_currentIndex == 1)
                                  ? Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        MyText.bodyMedium("Search",
                                            color: customTheme.groceryPrimary,
                                            letterSpacing: 0,
                                            fontWeight: 600),
                                        Container(
                                          margin: MySpacing.top(6),
                                          decoration: BoxDecoration(
                                              color: customTheme.groceryPrimary,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(2.5))),
                                          height: 5,
                                          width: 5,
                                        )
                                      ],
                                    )
                                  : Icon(
                                      LucideIcons.search,
                                      size: 20,
                                      color: theme.colorScheme.onBackground,
                                    )),
                          Container(
                              child: (_currentIndex == 2)
                                  ? Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        MyText.bodyMedium("Cart",
                                            color: customTheme.groceryPrimary,
                                            letterSpacing: 0,
                                            fontWeight: 600),
                                        Container(
                                          margin: MySpacing.top(6),
                                          decoration: BoxDecoration(
                                              color: customTheme.groceryPrimary,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(2.5))),
                                          height: 5,
                                          width: 5,
                                        )
                                      ],
                                    )
                                  : Icon(
                                      LucideIcons.shoppingCart,
                                      size: 20,
                                      color: theme.colorScheme.onBackground,
                                    )),
                          Container(
                              child: (_currentIndex == 3)
                                  ? Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        MyText.bodyMedium("Profile",
                                            color: customTheme.groceryPrimary,
                                            letterSpacing: 0,
                                            fontWeight: 600),
                                        Container(
                                          margin: MySpacing.top(6),
                                          decoration: BoxDecoration(
                                              color: customTheme.groceryPrimary,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(2.5))),
                                          height: 5,
                                          width: 5,
                                        )
                                      ],
                                    )
                                  : Icon(
                                      LucideIcons.user,
                                      size: 20,
                                      color: theme.colorScheme.onBackground,
                                    )),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
