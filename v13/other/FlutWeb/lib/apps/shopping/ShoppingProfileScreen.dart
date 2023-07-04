import 'package:flutkit/apps/shopping/ShoppingAddCardScreen.dart';
import 'package:flutkit/apps/shopping/ShoppingMegaMenuScreen.dart';
import 'package:flutkit/apps/shopping/ShoppingOrderScreen.dart';
import 'package:flutkit/style/MyCol.dart';
import 'package:flutkit/style/MyRow.dart';
import 'package:flutkit/style/ScreenMedia.dart';
import 'package:flutkit/utils/Generator.dart';
import 'package:flutkit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppNotifier.dart';
import '../../AppTheme.dart';
import 'ShoppingFavoriteScreen.dart';

class ShoppingProfileScreen extends StatefulWidget {

  @override
  _ShoppingProfileScreenState createState() => _ShoppingProfileScreenState();
}

class _ShoppingProfileScreenState extends State<ShoppingProfileScreen> {
  //ThemeData
  int themeType;
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget child) {
        themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return buildScreen(
                  ScreenMedia.getScreenMediaType(constraints.maxWidth));
            },
          ),
        );
      },
    );
  }

  Widget buildScreen(ScreenMediaType screenMediaType){
    return Scaffold(
      backgroundColor: customAppTheme.bgLayer1,
      body: ListView(
        padding: Spacing.xy(16, 24),
        children: [
          MyRow(
            wrapAlignment: WrapAlignment.center,
            children: [
              MyCol(
                flex: {
                  ScreenMediaType.MD:12,
                  ScreenMediaType.XL:8,
                },
                child: Column(
                  children: [
                    Container(
                      margin: Spacing.top(16),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image:
                                  AssetImage("./assets/images/avatar-3.jpg"),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Container(
                            margin: Spacing.top(8),
                            child: Text("Derrick Malone",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    fontWeight: 600,
                                    letterSpacing: 0)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: Spacing.top(24),
                      padding: Spacing.xy(16,8),
                      decoration: BoxDecoration(
                          color: themeData.colorScheme.primary,
                          borderRadius:
                          BorderRadius.all(Radius.circular(4))),
                      child: Row(
                        children: <Widget>[
                          Icon(MdiIcons.informationOutline,
                              color: themeData.colorScheme.onPrimary,
                              size: 18),
                          Container(
                            margin: Spacing.left(16),
                            child: Text(
                              "Gold member",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText2,
                                  color: Generator.goldColor,
                                  fontWeight: 600,
                                  letterSpacing: 0.2),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Upgrade",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    color: themeData.colorScheme.onPrimary,
                                    fontWeight: 600,
                                    letterSpacing: 0.2),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: Spacing.top(24),
                      child: Column(
                        children: <Widget>[
                          singleOption(
                            iconData: MdiIcons.contentPaste,
                            option: "Orders",
                          navigation: ShoppingOrderScreen()),

                          Divider(),
                          singleOption(
                            iconData: MdiIcons.heartOutline,
                            option: "Favourite",
                            navigation: ShoppingFavoriteScreen()
                          ),
                          Divider(),
                          singleOption(
                            iconData: MdiIcons.creditCardOutline,
                            option: "Payment",
                              navigation: ShoppingAddCardScreen()),
                          Divider(),
                          singleOption(
                            iconData: MdiIcons.menu,
                            option: "Mega Menu",
                            navigation: ShoppingMegaMenuScreen()),
                          Divider(),
                          singleOption(
                            iconData: MdiIcons.shapeOutline,
                            option: "Category",),
                          Divider(),
                          singleOption(
                            iconData: MdiIcons.faceAgent,
                            option: "Help \& Support",),
                          Container(
                            margin: Spacing.top(24),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                MdiIcons.logoutVariant,
                                color: themeData.colorScheme.onPrimary,
                                size: 18,
                              ),
                              label: Text(
                                "LOGOUT",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    letterSpacing: 0.3,
                                    fontWeight: 600,
                                    color: themeData.colorScheme.onPrimary),
                              ),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(Spacing.xy(40, 16))
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }



  Widget singleOption({IconData iconData, String option, Widget navigation}) {
    return InkWell(
      onTap: () {
        if(navigation!=null){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => navigation));
        }
      },
      child: Container(
        padding: Spacing.y(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(
                iconData,
                size: 22,
                color: themeData.colorScheme.onBackground,
              ),
            ),
            Expanded(
              child: Container(
                margin: Spacing.left(16),
                child: Text(option,
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        fontWeight: 600)),
              ),
            ),
            Container(
              child: Icon(MdiIcons.chevronRight,
                  size: 22,
                  color: themeData.colorScheme.onBackground),
            ),
          ],
        ),
      ),
    );
  }
}
