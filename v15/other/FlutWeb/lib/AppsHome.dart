import 'package:flutkit/apps/event/EventFullApp.dart';
import 'package:flutkit/apps/food/FoodFullApp.dart';
import 'package:flutkit/apps/food/FoodProductScreen.dart';
import 'package:flutkit/apps/shopping/ShoppingLoginScreen.dart';
import 'package:flutkit/style/ScreenMedia.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'AppNotifier.dart';
import 'AppTheme.dart';
import 'SingleGridItem.dart';
import 'apps/course/CourseFullApp.dart';
import 'apps/food/FoodOnboardingScreen.dart';
import 'utils/SizeConfig.dart';

class AppsHome extends StatefulWidget {
  @override
  _AppsHomeState createState() => _AppsHomeState();
}

class _AppsHomeState extends State<AppsHome> {
  CustomAppTheme customAppTheme;


  int noOfGrid = 7;


  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());

        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            switch (ScreenMedia.getScreenMediaType(constraints.maxWidth)) {
              case ScreenMediaType.XS:
                noOfGrid = 2;
                break;
              case ScreenMediaType.SM:
                noOfGrid = 3;
                break;
              case ScreenMediaType.MD:
                noOfGrid = 4;
                break;
              case ScreenMediaType.LG:
                noOfGrid = 5;
                break;
              case ScreenMediaType.XL:
                noOfGrid = 6;
                break;
              case ScreenMediaType.XXL:
                noOfGrid = 8;
                break;
              case ScreenMediaType.XXXL:
                noOfGrid = 8;
                break;
              case ScreenMediaType.XXXXL:
                noOfGrid = 8;
                break;
            }

            return Container(
                color: themeData.colorScheme.background,
                padding: Spacing.fromLTRB(8, 0, 8, 12),
                child: ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          top: 16,
                          left: 8,
                          bottom: 12),
                      child: Text(
                        "APPS",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.subtitle2,
                            fontWeight: 700),
                      ),
                    ),
                    GridView.count(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        crossAxisCount: noOfGrid,
                        padding: Spacing.all(4),
                        mainAxisSpacing: 16,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 16,
                        children: <Widget>[
                          SinglePageItem(
                            iconData: MdiIcons.shoppingOutline,
                            navigation: ShoppingLoginScreen(),
                            title: "Shopping",
                          ),
                          SinglePageItem(
                            icon: './assets/icons/course-outline.png',
                            title: "Course",
                            navigation: CourseFullApp(),
                          ),
                          SinglePageItem(
                            title: "Food",
                            icon: './assets/icons/food-outline.png',
                            navigation: FoodOnboardingScreen(),
                          ),
                          SinglePageItem(
                            title: "Event",
                            icon:  './assets/icons/ticket-outline.png',
                            navigation: EventFullApp(),
                          ),
                        ]
                    ),
                    Spacing.height(24),
                    Center(
                      child: Text("More Apps are coming soon...",
                          style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            letterSpacing: 0.5,
                            fontWeight: 500,
                          )),
                    )
                  ],
                ));
          },
        );
      },
    );
  }
}
