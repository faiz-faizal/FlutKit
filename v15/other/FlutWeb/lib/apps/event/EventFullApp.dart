/*
* File : Shopping App
* Version : 1.0.0
* */

import 'package:flutkit/apps/event/EventCreateScreen.dart';
import 'package:flutkit/apps/event/EventHomeScreen.dart';
import 'package:flutkit/apps/event/EventProfileScreen.dart';
import 'package:flutkit/apps/event/EventTicketScreen.dart';
import 'package:flutkit/apps/event/EventUpcomingScreen.dart';
import 'package:flutkit/widgets/custom/MyBottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppNotifier.dart';
import '../../AppTheme.dart';

class EventFullApp extends StatefulWidget {
  @override
  _EventFullAppState createState() => _EventFullAppState();
}


class _EventFullAppState extends State<EventFullApp>
    with SingleTickerProviderStateMixin {
  ThemeData themeData;
  CustomAppTheme customAppTheme;



  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget child) {
        themeData = AppTheme.getThemeFromThemeMode(value.themeMode());
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return MyBottomNavigation(
          icons: [
            MdiIcons.homeOutline,
            MdiIcons.plus,
            MdiIcons.ticketConfirmationOutline,
            MdiIcons.accountOutline,
          ],
          activeIcons: [
            MdiIcons.home,
            MdiIcons.plus,
            MdiIcons.ticketConfirmation,
            MdiIcons.account,
          ],
          screens: [
            EventHomeScreen(),
            EventCreateScreen(),
            EventUpcomingScreen(),
            EventProfileScreen(),
          ],
          titles: ["Home", "Create", "Timeline", "Account"],
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
