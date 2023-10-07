import 'package:flutkit/apps/shopping/ShoppingCartScreen.dart';
import 'package:flutkit/apps/shopping/ShoppingHomeScreen.dart';
import 'package:flutkit/apps/shopping/ShoppingProfileScreen.dart';
import 'package:flutkit/apps/shopping/ShoppingSearchScreen.dart';
import 'package:flutkit/widgets/custom/MyBottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppNotifier.dart';
import '../../AppTheme.dart';

class ShoppingFullApp extends StatefulWidget {
  @override
  _ShoppingFullAppState createState() => _ShoppingFullAppState();
}

class _ShoppingFullAppState extends State<ShoppingFullApp>
    with SingleTickerProviderStateMixin {
  //ThemeData
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget child) {

        customAppTheme  = AppTheme.getCustomAppTheme(value.themeMode());
        themeData  = AppTheme.getThemeFromThemeMode(value.themeMode());
        return MaterialApp(
          color: customAppTheme.bgLayer1,

            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: MyBottomNavigation(
              icons: [
                MdiIcons.homeOutline,
                MdiIcons.magnify,
                MdiIcons.cartOutline,
                MdiIcons.accountOutline
              ],
              activeIcons: [
                MdiIcons.home,
                MdiIcons.magnify,
                MdiIcons.cart,
                MdiIcons.account
              ],
              titles: [
                "Home",
                "Search",
                "Cart",
                "Account"
              ],
              iconSize: 22,
              backButton: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(MdiIcons.chevronLeft,color: themeData.colorScheme.onBackground,),
              ),
              screens: [ShoppingHomeScreen(), ShoppingSearchScreen(), ShoppingCartScreen(), ShoppingProfileScreen()],
              navigationBackground: Color(0xff37404a),
              color: Color(0xff8391a2),
              activeColor: Colors.white,
              initialIndex: 1,
              splashColor: Colors.white,
              highlightColor: Colors.transparent,
            ));
      },
    );
  }
}
