import 'package:flutkit/style/MyCard.dart';
import 'package:flutkit/style/MyCol.dart';
import 'package:flutkit/style/MyContainer.dart';
import 'package:flutkit/style/MyRow.dart';
import 'package:flutkit/style/ScreenMedia.dart';
import 'package:flutkit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppNotifier.dart';
import '../../AppTheme.dart';
import 'FoodProductScreen.dart';

class FoodHomeScreen extends StatefulWidget {
  @override
  _FoodHomeScreenState createState() => _FoodHomeScreenState();
}

class _FoodHomeScreenState extends State<FoodHomeScreen> {
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
              body: Container(
                  color: customAppTheme.bgLayer1,
                  child: ListView(
                    padding: Spacing.xy(8, 16),
                    physics: ClampingScrollPhysics(),
                    children: <Widget>[
                      Container(
                        margin: Spacing.x(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Hey hungry",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle1,
                                  color: themeData.colorScheme.onBackground,
                                  letterSpacing: 0,
                                  fontWeight: 600),
                            ),
                            InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return NotificationDialog();
                                    });
                              },
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.bellOutline,
                                    color: themeData
                                        .colorScheme.onBackground
                                        .withAlpha(200),
                                  ),
                                  Positioned(
                                    right: -2,
                                    top: -2,
                                    child: Container(
                                      padding: EdgeInsets.all(0),
                                      height: 14,
                                      width: 14,
                                      decoration: BoxDecoration(
                                          color:
                                          themeData.colorScheme.primary,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(40))),
                                      child: Center(
                                        child: Text(
                                          "2",
                                          style: AppTheme.getTextStyle(
                                            themeData.textTheme.overline,
                                            color: themeData
                                                .colorScheme.onPrimary,
                                            fontSize: 9,
                                            fontWeight: 500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Spacing.height(16),
                      MyRow(
                        defaultFlex: {
                          ScreenMediaType.MD:12,
                          ScreenMediaType.XL:8,
                        },
                        children: [
                          MyCol(
                              child: MyContainer.bordered(
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => FoodProductScreen()));

                                },
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          MyContainer(

                                            color: customAppTheme.bgLayer1,
                                            paddingAll: 4,
                                            borderRadiusAll: 2,
                                            child: Text(
                                              "Special",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.caption,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  muted: true,
                                                  letterSpacing: 0.3,
                                                  fontWeight: 600),
                                            ),
                                          ),
                                          Spacing.height(16),
                                          Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            children: <Widget>[
                                              Text(
                                                "\$ ",
                                                style: AppTheme.getTextStyle(
                                                    themeData.textTheme.subtitle2,
                                                    color: themeData
                                                        .colorScheme.onBackground,
                                                    fontWeight: 700,
                                                    letterSpacing: 0),
                                              ),
                                              Text(
                                                "59",
                                                style: AppTheme.getTextStyle(
                                                    themeData.textTheme.caption,
                                                    fontSize: 12,
                                                    color: themeData
                                                        .colorScheme.onBackground,
                                                    fontWeight: 600,
                                                    muted: true,
                                                    letterSpacing: 0,
                                                    decoration: TextDecoration
                                                        .lineThrough),
                                              ),
                                              Text(
                                                " 39",
                                                style: AppTheme.getTextStyle(
                                                    themeData.textTheme.subtitle2,
                                                    color: themeData
                                                        .colorScheme.onBackground,
                                                    fontWeight: 700,
                                                    letterSpacing: 0),
                                              ),
                                            ],
                                          ),
                                          Spacing.height(16),
                                          Text(
                                            "Chinese Nood",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.subtitle2,
                                                color: themeData
                                                    .colorScheme.onBackground,
                                                fontWeight: 600,
                                                letterSpacing: 0),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        child: Image(
                                          image: AssetImage(
                                              './assets/food/food-9.jpg'),
                                          width: 100,
                                          height: 100,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          MyCol(
                              child: MyContainer.bordered(
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => FoodProductScreen()));

                                },
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          MyContainer(
                                            color: customAppTheme.bgLayer1,
                                            paddingAll: 4,
                                            borderRadiusAll: 2,
                                            child: Text(
                                              "Special",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.caption,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  muted: true,
                                                  letterSpacing: 0.3,
                                                  fontWeight: 600),
                                            ),
                                          ),
                                          Spacing.height(16),
                                          Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            children: <Widget>[
                                              Text(
                                                "\$ ",
                                                style: AppTheme.getTextStyle(
                                                    themeData.textTheme.subtitle2,
                                                    color: themeData
                                                        .colorScheme.onBackground,
                                                    fontWeight: 700,
                                                    letterSpacing: 0),
                                              ),
                                              Text(
                                                "59",
                                                style: AppTheme.getTextStyle(
                                                    themeData.textTheme.caption,
                                                    fontSize: 12,
                                                    color: themeData
                                                        .colorScheme.onBackground,
                                                    fontWeight: 600,
                                                    muted: true,
                                                    letterSpacing: 0,
                                                    decoration: TextDecoration
                                                        .lineThrough),
                                              ),
                                              Text(
                                                " 39",
                                                style: AppTheme.getTextStyle(
                                                    themeData.textTheme.subtitle2,
                                                    color: themeData
                                                        .colorScheme.onBackground,
                                                    fontWeight: 700,
                                                    letterSpacing: 0),
                                              ),
                                            ],
                                          ),
                                          Spacing.height(16),
                                          Text(
                                            "Chinese Nood",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.subtitle2,
                                                color: themeData
                                                    .colorScheme.onBackground,
                                                fontWeight: 600,
                                                letterSpacing: 0),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        child: Image(
                                          image: AssetImage(
                                              './assets/food/food-9.jpg'),
                                          width: 100,
                                          height: 100,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ],
                      ),
                      Spacing.height(16),
                      Container(
                        margin: Spacing.x(8),
                        child: Text(
                          "Category",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              fontWeight: 600),
                        ),
                      ),
                      Spacing.height(16),
                      Container(
                        margin: Spacing.x(8),

                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              singleCategory(
                                  image: './assets/food/food-5.jpg',
                                  title: "Chinese"),
                              Spacing.width(16),
                              singleCategory(
                                  image: './assets/food/food-6.jpg',
                                  title: "Italian"),
                              Spacing.width(16),
                              singleCategory(
                                  image: './assets/food/food-7.jpg',
                                  title: "American"),
                              Spacing.width(16),
                              singleCategory(
                                  image: './assets/food/food-8.jpg',
                                  title: "Punjabi"),
                            ],
                          ),
                        ),
                      ),
                      Spacing.height(24),
                      Container(
                        margin: Spacing.x(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Recommended",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText1,
                                  fontWeight: 600),
                            ),
                            Text(
                              "View all",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText2,
                                  color: themeData.colorScheme.primary,
                                  fontWeight: 500),
                            ),
                          ],
                        ),
                      ),
                      Spacing.height(16),
                      MyRow(
                        defaultFlex: {
                          ScreenMediaType.XS:12,
                          ScreenMediaType.MD:8,
                          ScreenMediaType.LG:6,
                          ScreenMediaType.XXL:4,
                        },
                        children: [
                          MyCol(
                              child: singleFood(
                                  image: './assets/food/food-1.jpg',
                                  name: 'Salad dish',
                                  price: 16.59)),
                          MyCol(
                              child: singleFood(
                                  image: './assets/food/food-2.jpg',
                                  name: 'Food dish',
                                  price: 29.99)),
                          MyCol(
                              child: singleFood(
                                  image: './assets/food/food-3.jpg',
                                  name: 'Pan Cake',
                                  price: 24.29)),
                          MyCol(
                              child: singleFood(
                                  image: './assets/food/food-7.jpg',
                                  name: 'Salad',
                                  price: 14.99)),
                          MyCol(
                              child: singleFood(
                                  image: './assets/food/food-8.jpg',
                                  name: 'Cake',
                                  price: 24.99)),
                          MyCol(
                              child: singleFood(
                                  image: './assets/food/food-9.jpg',
                                  name: 'Maggie',
                                  price: 14.99)),
                        ],
                      )
                    ],
                  ))),
        );
      },
    );
  }

  Widget singleFood({String image, String name, double price}) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FoodProductScreen()));
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
            Spacing.height(4),
            Container(
              child: Text(name,
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                      muted: true, fontWeight: 600)),
            ),
            Spacing.height(2),
            Text("\$" + price.toString(),
                style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                    fontWeight: 500, letterSpacing: 0))
          ],
        ),
      ),
    );
  }

  Widget singleCategory({String image, String title}) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FoodProductScreen()));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        child: Stack(
          children: <Widget>[
            Container(
              width: 140,
              height: 140,
              child: Image(
                image: AssetImage(image),
                width: 140,
                height: 140,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: 140,
              height: 140,
              color: Colors.black.withOpacity(0.5),
            ),
            Container(
              width: 140,
              height: 140,
              child: Center(
                child: Text(
                  title,
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                      fontWeight: 600, color: Colors.white, letterSpacing: 0.3),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NotificationDialog extends StatefulWidget {
  @override
  _NotificationDialogState createState() => _NotificationDialogState();
}

class _NotificationDialogState extends State<NotificationDialog> {
  ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Container(
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: themeData.backgroundColor,
        ),
        padding: Spacing.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      MdiIcons.chevronLeft,
                      size: 24,
                      color: themeData.colorScheme.onBackground,
                    ),
                  ),
                  Text("Notification",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      MdiIcons.notificationClearAll,
                      size: 24,
                      color: themeData.colorScheme.onBackground,
                    ),
                  ),
                ],
              ),
            ),
            Spacing.height(16),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Offers",
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600,
                        letterSpacing: 0),
                  ),
                  Spacing.width(8),
                  Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                        color: themeData.colorScheme.primary.withAlpha(40),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Center(
                        child: Text(
                          "2",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              fontSize: 10,
                              color: themeData.colorScheme.primary,
                              fontWeight: 600),
                        )),
                  )
                ],
              ),
            ),
            Spacing.height(24),
            singleNotification(
                iconData: MdiIcons.food,
                time: "Just Now ",
                text: "Your order placed successfully"),
            Spacing.height(16),

            singleNotification(
                iconData: MdiIcons.close,
                time: "1 Day ago",
                text: "Your last order cancel due to payment issue"),
            Spacing.height(16),
            singleNotification(
                iconData: MdiIcons.check,
                time: "3 Day ago",
                text: "Burger order successfully deliver"),
            Spacing.height(16),
            singleNotification(
                iconData: MdiIcons.emailOutline,
                time: "1 Month ago",
                text: "A new email from restaurant"),
            Spacing.height(16),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child:  Text(
                  "View all",
                  style: AppTheme.getTextStyle(
                      themeData.textTheme.bodyText2,
                      color: themeData.colorScheme.primary,
                      fontWeight: 500),
                ),
              ),
            )
          ],
        ),
      ),
    );

  }

  Widget singleNotification({IconData iconData, String text, String time}) {
    return MyCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: Spacing.all(12),
            child: Icon(
              iconData,
              color: themeData.colorScheme.onPrimary,
              size: 22,
            ),
            decoration: BoxDecoration(
                color: themeData.colorScheme.primary, shape: BoxShape.circle),
          ),
          Expanded(
            child: Container(margin: Spacing.x(16), child: Text(text)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                time,
                style: AppTheme.getTextStyle(themeData.textTheme.caption,
                    color: themeData.colorScheme.onBackground,
                    fontSize: 12,
                    muted: true,
                    fontWeight: 500,
                    letterSpacing: -0.2),
              ),
            ],
          )
        ],
      ),
    );
  }
}
