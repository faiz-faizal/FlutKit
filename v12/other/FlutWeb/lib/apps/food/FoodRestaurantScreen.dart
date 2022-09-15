import 'package:flutkit/style/MyCol.dart';
import 'package:flutkit/style/MyContainer.dart';
import 'package:flutkit/style/MyRow.dart';
import 'package:flutkit/style/ScreenMedia.dart';
import 'package:flutkit/utils/Generator.dart';
import 'package:flutkit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppNotifier.dart';
import '../../AppTheme.dart';
import 'FoodMenuScreen.dart';

class FoodRestaurantScreen extends StatefulWidget {
  @override
  _FoodRestaurantScreenState createState() => _FoodRestaurantScreenState();
}

class _FoodRestaurantScreenState extends State<FoodRestaurantScreen> {
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
                          Container(
                              child: Stack(
                                children: <Widget>[
                                  Image(
                                    image: AssetImage('./assets/food/restaurant.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  Positioned(
                                      top: 16,
                                      left: 16,
                                      child: SafeArea(
                                        child: InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Icon(
                                              MdiIcons.chevronLeft,
                                              color: Colors.white,
                                            )),
                                      ))
                                ],
                              )),
                          Spacing.height(16),
                          Container(
                            padding: Spacing.x(16),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "The Disaster Café",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.subtitle1,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  fontWeight: 600),
                                            ),
                                            Text(
                                              "London bridge",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.caption,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  fontWeight: 400),
                                            ),
                                            Spacing.height(4),
                                            Generator.buildRatingStar(
                                                rating: 4.5,
                                                size: 18,
                                                spacing: 0,
                                                inactiveColor: themeData
                                                    .colorScheme.onBackground,
                                                inactiveStarFilled: false)
                                          ],
                                        )),
                                    Row(
                                      children: <Widget>[
                                        IconButton(
                                          onPressed: () {},
                                          color: themeData.colorScheme.primary,
                                          icon: Icon(
                                            MdiIcons.phoneOutline,
                                            size: 22,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          color: themeData.colorScheme.primary,
                                          icon: Icon(
                                            MdiIcons.mapMarkerOutline,
                                            size: 22,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Spacing.height(16),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Delivery",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText2,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              fontWeight: 600),
                                        ),
                                        Text(
                                          "Free",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText1,
                                              color: customAppTheme.colorSuccess,
                                              fontWeight: 500),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Time",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText2,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              fontWeight: 600),
                                        ),
                                        Text(
                                          "9 AM - 7 PM",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText2,
                                              color: customAppTheme.colorInfo,
                                              fontWeight: 600),
                                        ),
                                      ],
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FoodMenuScreen()));
                                        },
                                        child: Text("MENU",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.bodyText2,
                                                fontWeight: 600,
                                                color: themeData
                                                    .colorScheme.primary))),
                                  ],
                                ),
                                Spacing.height(16),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Reviews",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText1,
                                          color:
                                          themeData.colorScheme.onBackground,
                                          fontWeight: 600),
                                    ),
                                    Text(
                                      "View All",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.caption,
                                          color: themeData.colorScheme.primary,
                                          fontWeight: 500),
                                    ),
                                  ],
                                ),
                                Spacing.height(8),
                                singleReview(
                                    rating: 4.5,
                                    image: './assets/images/avatar-2.jpg',
                                    time: "27 Jul 2020"),
                                Divider(),
                                singleReview(
                                    rating: 3.8,
                                    image: './assets/images/avatar-3.jpg',
                                    time: "25 Jul 2020"),
                                Divider(),
                                singleReview(
                                    rating: 5,
                                    image: './assets/images/avatar-4.jpg',
                                    time: "21 Jul 2020"),
                                Spacing.height(16),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FoodMenuScreen()));
                                  },
                                  child: Text("Order Now".toUpperCase(),
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.caption,
                                          letterSpacing: 0.4,
                                          fontWeight: 600,
                                          color:
                                          themeData.colorScheme.onPrimary)),
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                          Spacing.xy(16, 0))),
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
          ),
        );
      },
    );
  }

  Widget singleReview({String image, double rating, String time}) {
    return Row(
      children: <Widget>[
        MyContainer.rounded(
          padding:Spacing.xy(0, 8),
          child: Image(
            image: AssetImage(image),
            height: 52,
            width: 52,
          ),
        ),
        Spacing.width(16),
        Expanded(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Generator.buildRatingStar(
                      rating: rating,
                      size: 18,
                      inactiveColor: themeData.colorScheme.onBackground),
                  Spacing.width(8),
                  Text(
                    time,
                    style: AppTheme.getTextStyle(themeData.textTheme.caption,
                        fontWeight: 600, muted: true),
                  )
                ],
              ),
              Spacing.height(4),
              Text(
                Generator.getDummyText(12),
                style: AppTheme.getTextStyle(themeData.textTheme.caption,
                    letterSpacing: 0,
                    color: themeData.colorScheme.onBackground,
                    fontWeight: 500),
              )
            ],
          ),
        )
      ],
    );
  }
}
