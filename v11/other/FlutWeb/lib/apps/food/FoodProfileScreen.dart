import 'package:flutkit/style/MyCard.dart';
import 'package:flutkit/style/MyCol.dart';
import 'package:flutkit/style/MyContainer.dart';
import 'package:flutkit/style/MyRow.dart';
import 'package:flutkit/style/ScreenMedia.dart';
import 'package:flutkit/utils/Generator.dart';
import 'package:flutkit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppNotifier.dart';
import '../../AppTheme.dart';

class FoodProfileScreen extends StatefulWidget {

  final BuildContext rootContext;

  const FoodProfileScreen({Key key, @required this.rootContext}) : super(key: key);

  @override
  _FoodProfileScreenState createState() => _FoodProfileScreenState();
}

class _FoodProfileScreenState extends State<FoodProfileScreen> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget child) {
        int themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);

        return SafeArea(
          child: Scaffold(
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
                          MyCard.bordered(
                            shadow: MyShadow(elevation: 0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32)),
                                      child: Image(
                                        image: AssetImage(
                                            './assets/images/avatar-5.jpg'),
                                        width: 56,
                                        height: 56,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Spacing.width(16),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Malia Jackson",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText1,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              fontWeight: 600),
                                        ),
                                        Text(
                                          "Mal@son.com",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText2,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              fontWeight: 500),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Spacing.height(16),
                                MyContainer(
                                  padding:Spacing.xy(16, 8),
                                  borderRadiusAll: 4,
                                  color: themeData.colorScheme.primary,
                                  child: Row(
                                    children: <Widget>[
                                      Icon(MdiIcons.informationOutline,
                                          color: themeData.colorScheme.onPrimary,
                                          size: 18),
                                      Spacing.width(16),
                                      Text(
                                        "Gold member",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText2,
                                            color: Generator.goldColor,
                                            fontWeight: 600,
                                            letterSpacing: 0.2),
                                      ),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            "Upgrade",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.caption,
                                                color: themeData
                                                    .colorScheme.onPrimary,
                                                fontWeight: 600,
                                                letterSpacing: 0.2),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacing.height(16),
                          MyCard.bordered(
                            shadow: MyShadow(elevation: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Account balance",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText2,
                                          color: themeData
                                              .colorScheme.onBackground
                                              .withAlpha(220),
                                          letterSpacing: 0,
                                          fontWeight: 600),
                                    ),
                                    Text(
                                      "\$ 50.00",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          color: themeData.colorScheme.primary,
                                          letterSpacing: 0,
                                          fontWeight: 600),
                                    )
                                  ],
                                ),
                                ListTile(
                                  dense: true,
                                  contentPadding: Spacing.zero,
                                  title: Text(
                                    "Refer Friends",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,
                                        color: themeData
                                            .colorScheme.onBackground,
                                        fontWeight: 600),
                                  ),
                                  subtitle: Text(
                                    "Earn \$100",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.caption,
                                        color:
                                        themeData.colorScheme.primary,
                                        fontWeight: 600),
                                  ),
                                  trailing: Icon(
                                    MdiIcons.chevronRight,
                                    size:22,
                                    color: themeData.colorScheme.onBackground,
                                  ),
                                  visualDensity: VisualDensity.compact,

                                )
                              ],
                            ),
                          ),
                          Spacing.height(16),
                          MyCard.bordered(
                            shadow: MyShadow(elevation: 0),
                            padding: Spacing.fromLTRB(8, 16, 8, 16),
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  dense:true,
                                  leading: Icon(
                                    MdiIcons.walletOutline,
                                    size: 22,
                                    color: themeData.colorScheme.onBackground,
                                  ),
                                  title: Text(
                                    "Add money to wallet",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        color: themeData
                                            .colorScheme.onBackground,
                                        letterSpacing: 0,
                                        fontWeight: 600),
                                  ),
                                  trailing: Icon(
                                    MdiIcons.chevronRight,
                                    size: 22,
                                    color: themeData
                                        .colorScheme.onBackground,
                                  ),
                                ),
                                ListTile(
                                  dense:true,
                                  leading: Icon(
                                    MdiIcons.mapMarkerOutline,
                                    size: 22,
                                    color: themeData.colorScheme.onBackground,
                                  ),
                                  title: Text(
                                    "Address setting",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        color: themeData
                                            .colorScheme.onBackground,
                                        letterSpacing: 0,
                                        fontWeight: 600),
                                  ),
                                  trailing: Icon(
                                    MdiIcons.chevronRight,
                                    size: 22,
                                    color: themeData
                                        .colorScheme.onBackground,
                                  ),
                                ),
                                ListTile(
                                  dense:true,
                                  leading: Icon(
                                    MdiIcons.creditCardOutline,
                                    size: 22,
                                    color: themeData.colorScheme.onBackground,
                                  ),
                                  title: Text(
                                    "Payment setting",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        color: themeData
                                            .colorScheme.onBackground,
                                        letterSpacing: 0,
                                        fontWeight: 600),
                                  ),
                                  trailing: Icon(
                                    MdiIcons.chevronRight,
                                    size: 22,
                                    color: themeData
                                        .colorScheme.onBackground,
                                  ),
                                ),
                                ListTile(
                                  dense:true,
                                  leading: Icon(
                                    MdiIcons.faceAgent,
                                    size: 22,
                                    color: themeData.colorScheme.onBackground,
                                  ),
                                  title: Text(
                                    "Customer support",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        color: themeData
                                            .colorScheme.onBackground,
                                        letterSpacing: 0,
                                        fontWeight: 600),
                                  ),
                                  trailing: Icon(
                                    MdiIcons.chevronRight,
                                    size: 22,
                                    color: themeData
                                        .colorScheme.onBackground,
                                  ),
                                ),
                                ListTile(dense:true,
                                  leading: Icon(
                                    MdiIcons.security,
                                    size: 22,
                                    color: themeData.colorScheme.onBackground,
                                  ),
                                  title: Text(
                                    "Terms",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        color: themeData
                                            .colorScheme.onBackground,
                                        letterSpacing: 0,
                                        fontWeight: 600),
                                  ),
                                  trailing: Icon(
                                    MdiIcons.chevronRight,
                                    size: 22,
                                    color: themeData
                                        .colorScheme.onBackground,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacing.height(16),
                          Center(
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(Spacing.xy(32, 0))
                                ),
                                onPressed: () {
                                  Navigator.pop(widget.rootContext);
                                },
                                child: Text(
                                  "Logout"
                                      .toUpperCase(),
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      letterSpacing: 0.5,
                                      color: themeData.colorScheme.onPrimary,
                                      fontWeight: 600),
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
