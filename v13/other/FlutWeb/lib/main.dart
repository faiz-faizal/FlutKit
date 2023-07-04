/*
* File : Main File
* Version : 1.0.0
* */

import 'package:flutkit/AppsHome.dart';
import 'package:flutkit/apps/event/EventFullApp.dart';
import 'package:flutkit/apps/food/FoodLoginScreen.dart';
import 'package:flutkit/apps/food/FoodPasswordScreen.dart';
import 'package:flutkit/apps/food/FoodRegisterScreen.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'AppNotifier.dart';
import 'AppTheme.dart';
import 'CupertinoWidgetsHome.dart';
import 'CustomAppsHome.dart';
import 'MaterialWidgetsHome.dart';
import 'utils/SizeConfig.dart';

void main() {
  //You will need to initialize AppThemeNotifier class for theme changes.
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider<AppNotifier>(
    create: (context) => AppNotifier(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: MyHomePage());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedPage = 2;
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  final List<Widget> _fragmentView = [
    MaterialWidgetsHome(),
    CupertinoWidgetsHome(),
    AppsHome(),
    CustomAppsHome(),
  ];

  final List<String> _fragmentTitle = [
    'Material Widgets',
    'Cupertino Widgets',
    'Material Apps',
    'Custom Apps'
  ];

  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    //You will need to initialize MySize class for responsive spaces.
    themeData = Theme.of(context);
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
              key: _drawerKey,
              backgroundColor: themeData.colorScheme.background,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: customAppTheme.bgLayer2,
                title: Text(_fragmentTitle[_selectedPage],
                    style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                        fontWeight: 600)),
              ),
              body: _fragmentView[_selectedPage],
              drawer: Drawer(
                  child: Container(
                color: customAppTheme.bgLayer1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SafeArea(
                      child: Container(
                        padding: Spacing.only(left: 16, bottom: 24, top: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image(
                              image: AssetImage('assets/brand/flutkit.png'),
                              height: 102,
                              width: 102,
                            ),
                            Spacing.height(16),
                            Container(
                              padding: Spacing.fromLTRB(12, 4, 12, 4),
                              decoration: BoxDecoration(
                                  color: themeData.colorScheme.primary
                                      .withAlpha(40),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
                              child: Text('v. 5.1.0',
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      color: themeData.colorScheme.primary,
                                      fontWeight: 600,
                                      letterSpacing: -0.2)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                    Container(
                      color: customAppTheme.bgLayer1,
                      child: ListTile(
                        title: Text(
                          "Dark Theme",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2,
                              fontWeight: 600),
                        ),
                        trailing: Switch(
                          value: value.themeMode() != 1,
                          onChanged: (bool value) {
                            Provider.of<AppNotifier>(context, listen: false)
                                .updateTheme(value ? 2 : 1);
                          },
                          activeColor: themeData.colorScheme.primary,
                        ),
                      ),
                    ),
                    Divider(),
                    Expanded(
                      flex: 5,
                      child: Container(
                        color: customAppTheme.bgLayer1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: Spacing.fromLTRB(16,8,0,0),
                                child: Text(
                              "WIDGETS",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.caption,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 700,letterSpacing: 0,
                                  muted: true),
                            )),
                            ListTile(
                              leading: Icon(MdiIcons.materialDesign,
                                  color: _selectedPage == 0
                                      ? themeData.colorScheme.primary
                                      : themeData.colorScheme.onBackground),
                              title: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Material",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          fontWeight:
                                              _selectedPage == 0 ? 700 : 600,
                                          color: _selectedPage == 0
                                              ? themeData.colorScheme.primary
                                              : themeData
                                                  .colorScheme.onBackground)),
                                  Spacing.width(16),
                                  Container(
                                    padding: Spacing.fromLTRB(12, 4, 12, 4),
                                    decoration: BoxDecoration(
                                        color:
                                            customAppTheme.orange.withAlpha(60),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16))),
                                    child: Text(
                                      "Coming Soon",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.caption,
                                          color: customAppTheme.orange,
                                          fontWeight: 500),
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  _selectedPage = 0;
                                  _drawerKey.currentState.openEndDrawer();
                                });
                              },
                            ),
                            ListTile(
                              leading: Icon(MdiIcons.appleIos,
                                  color: _selectedPage == 1
                                      ? themeData.colorScheme.primary
                                      : themeData.colorScheme.onBackground),
                              title: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Cupertino",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          fontWeight:
                                              _selectedPage == 1 ? 700 : 600,
                                          color: _selectedPage == 1
                                              ? themeData.colorScheme.primary
                                              : themeData
                                                  .colorScheme.onBackground)),
                                  Spacing.width(16),
                                  Container(
                                    padding: Spacing.fromLTRB(12, 4, 12, 4),
                                    decoration: BoxDecoration(
                                        color:
                                            customAppTheme.orange.withAlpha(60),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16))),
                                    child: Text(
                                      "Coming Soon",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.caption,
                                          color: customAppTheme.orange,
                                          fontWeight: 500),
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  _selectedPage = 1;
                                  _drawerKey.currentState.openEndDrawer();
                                });
                              },
                            ),
                            Spacing.height(16),
                            Container(
                                padding: Spacing.left(16),
                                child: Text(
                                  "APPS",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      color: themeData.colorScheme.onBackground,
                                      fontWeight: 700,letterSpacing: 0,
                                      muted: true),
                                )),
                            ListTile(
                              leading: Icon(
                                MdiIcons.viewCarouselOutline,
                                color: _selectedPage == 2
                                    ? themeData.colorScheme.primary
                                    : themeData.colorScheme.onBackground,
                                size: 24,
                              ),
                              title: Text("Material",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle2,
                                      fontWeight:
                                      _selectedPage == 2 ? 700 : 600,
                                      color: _selectedPage == 2
                                          ? themeData.colorScheme.primary
                                          : themeData
                                          .colorScheme.onBackground)),
                              onTap: () {
                                setState(() {
                                  _selectedPage = 2;
                                  _drawerKey.currentState.openEndDrawer();
                                });
                              },
                            ),
                            ListTile(
                              leading: Icon(
                                MdiIcons.phoneOutline,
                                color: _selectedPage == 3
                                    ? themeData.colorScheme.primary
                                    : themeData.colorScheme.onBackground,
                                size: 24,
                              ),
                              title: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Custom",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          fontWeight:
                                              _selectedPage == 3 ? 700 : 600,
                                          color: _selectedPage == 3
                                              ? themeData.colorScheme.primary
                                              : themeData
                                                  .colorScheme.onBackground)),
                                  Spacing.width(16),
                                  Container(
                                    padding: Spacing.fromLTRB(12, 4, 12, 4),
                                    decoration: BoxDecoration(
                                        color: customAppTheme.orange
                                            .withAlpha(60),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16))),
                                    child: Text(
                                      "Coming Soon",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.caption,
                                          color: customAppTheme.orange,
                                          fontWeight: 500),
                                    ),
                                  )
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  _selectedPage = 3;
                                  _drawerKey.currentState.openEndDrawer();
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
            ));
      },
    );
  }
}
