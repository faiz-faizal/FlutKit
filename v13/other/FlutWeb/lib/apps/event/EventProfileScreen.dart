import 'package:flutkit/style/MyCol.dart';
import 'package:flutkit/style/MyContainer.dart';
import 'package:flutkit/style/MyRow.dart';
import 'package:flutkit/style/ScreenMedia.dart';
import 'package:flutkit/utils/Generator.dart';
import 'package:flutkit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppNotifier.dart';
import '../../AppTheme.dart';

class EventProfileScreen extends StatefulWidget {
  @override
  _EventProfileScreenState createState() => _EventProfileScreenState();
}

class _EventProfileScreenState extends State<EventProfileScreen> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  String desc;

  @override
  void initState() {
    super.initState();
    desc = Generator.getDummyText(8);
  }

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return SafeArea(
          child: Scaffold(
              body: Container(
                  color: customAppTheme.bgLayer1,
                  child: ListView(
                    padding: Spacing.xy(16, 24),
                    children: <Widget>[
                      MyRow(
                        wrapAlignment: WrapAlignment.center,
                        children: [
                          MyCol(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: MyContainer.rounded(
                                    child: Image(
                                      image: AssetImage(
                                          './assets/images/avatar-4.jpg'),
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                ),
                                Spacing.height(16),
                                Center(
                                  child: Text(
                                    "Martyn Rankin",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.headline6,
                                        fontWeight: 600),
                                  ),
                                ),
                                Spacing.height(24),
                                MyContainer.bordered(
                                  paddingAll: 24,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            "My balance".toUpperCase(),
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.caption,
                                                fontSize: 12,
                                                fontWeight: 600,
                                                xMuted: true),
                                          ),
                                          Text(
                                            "\$ 24",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.bodyText2,
                                                fontWeight: 600),
                                          ),
                                        ],
                                      ),
                                      ElevatedButton.icon(
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(themeData.colorScheme.primary.withAlpha(28)),
                                          shadowColor: MaterialStateProperty.all(themeData.colorScheme.primary.withAlpha(28)),
                                          foregroundColor: MaterialStateProperty.all(themeData.colorScheme.primary.withAlpha(28)),
                                          overlayColor: MaterialStateProperty.all(themeData.colorScheme.primary.withAlpha(28)),
                                          elevation: MaterialStateProperty.all(0),
                                        ),
                                        onPressed: () {},
                                        icon: Icon(
                                          MdiIcons.plus,
                                          color: themeData.colorScheme.primary,
                                          size: 20,
                                        ),
                                        label: Text(
                                          "Add Money",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText2,
                                              color:
                                                  themeData.colorScheme.primary,
                                              fontWeight: 600),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Spacing.height(16),
                                Text(
                                  "INVITE",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      fontSize: 11.5,
                                      fontWeight: 600,
                                      xMuted: true),
                                ),
                                Spacing.height(16),
                                Row(
                                  children: [
                                    MyContainer(
                                      color: themeData.colorScheme.primary.withAlpha(48),
                                      paddingAll: 8,
                                      child: Icon(
                                        MdiIcons.plus,
                                        size: 24,
                                        color: themeData
                                            .colorScheme.primary,
                                      ),
                                    ),
                                    Spacing.width(12),
                                    TextButton(onPressed: (){}, child: Text(
                                          "Add Friend",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText2,
                                              color:
                                                  themeData.colorScheme.primary,
                                              fontWeight: 600),
                                        ))

                                  ],
                                ),
                                Spacing.height(16),
                                singleInvite(
                                    image:
                                    './assets/images/avatar-2.jpg',
                                    name: "Walter Gale",
                                    status: "Joined"),
                                Spacing.height(16),
                                singleInvite(
                                    image:
                                    './assets/images/avatar-3.jpg',
                                    name: "Tala Deacon",
                                    status: "Joined"),
                                Spacing.height(16),
                                singleInvite(
                                    image:
                                    './assets/images/avatar-4.jpg',
                                    name: "Isa Cameron",
                                    status: "Invite")
                              ],
                            ),
                            flex: {
                              ScreenMediaType.SM: 20,
                              ScreenMediaType.MD: 16,
                              ScreenMediaType.LG: 12,
                              ScreenMediaType.XL: 8,
                            },
                          )
                        ],
                      ),
                    ],
                  ))),
        );
      },
    );
  }

  Widget singleInvite({String image, String name, String status}) {
    return Container(
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Image(
                image: AssetImage(image),
                width: 40,
                height: 40,
              )),
          Expanded(
            child: Container(
              margin: Spacing.left(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                  ),
                  Text(
                    status,
                    style: AppTheme.getTextStyle(themeData.textTheme.caption,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 500,
                        muted: true),
                  ),
                ],
              ),
            ),
          ),
          MyContainer(
            borderRadiusAll: 4,
            color: themeData.colorScheme.primary.withAlpha(40),
            padding: Spacing.xy(16, 8),
            child: Text(
              "+ \$9",
              style: AppTheme.getTextStyle(themeData.textTheme.caption,
                  color: themeData.colorScheme.primary,
                  letterSpacing: 0.3,
                  fontWeight: 700),
            ),
          )
        ],
      ),
    );
  }
}
