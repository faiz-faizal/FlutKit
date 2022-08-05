/*
* File : Shopping Home
* Version : 1.0.0
* */

import 'package:flutkit/apps/shopping/ShoppingProductScreen.dart';
import 'package:flutkit/style/MyContainer.dart';
import 'package:flutkit/style/Properties.dart';
import 'package:flutkit/style/ScreenMedia.dart';
import 'package:flutkit/utils/Generator.dart';
import 'package:flutkit/utils/SizeConfig.dart';
import 'package:flutkit/style/MyCard.dart';
import 'package:flutkit/style/MyCol.dart';
import 'package:flutkit/style/MyRow.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppNotifier.dart';
import '../../AppTheme.dart';

class ShoppingHomeScreen extends StatefulWidget {
  @override
  _ShoppingHomeScreenState createState() => _ShoppingHomeScreenState();
}

class _ShoppingHomeScreenState extends State<ShoppingHomeScreen>
    with SingleTickerProviderStateMixin {
  CustomAppTheme customAppTheme;
  ThemeData themeData;

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget child) {
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

  Widget buildScreen(ScreenMediaType screenMediaType) {
    return Scaffold(
        backgroundColor: customAppTheme.bgLayer1,
        body: ListView(
          padding: Spacing.fromLTRB(16, 24, 16, 24),
          children: <Widget>[
            Padding(
              padding: Spacing.x(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Welcome",
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
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
                          color:
                              themeData.colorScheme.onBackground.withAlpha(200),
                        ),
                        Positioned(
                          right: -2,
                          top: -2,
                          child: Container(
                            height: 14,
                            width: 14,
                            decoration: BoxDecoration(
                                color: themeData.colorScheme.primary,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                            child: Center(
                              child: Text(
                                "2",
                                style: AppTheme.getTextStyle(
                                  themeData.textTheme.overline,
                                  color: themeData.colorScheme.onPrimary,
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
                ScreenMediaType.MD: 12,
                ScreenMediaType.LG: 8,
              },
              wrapAlignment: WrapAlignment.start,
              children: [
                MyCol(
                  child: singleTrendingWidget(
                      image: './assets/images/shopping/product/product-8.jpg',
                      name: "Colorful Sandal",
                      price: "49.99"),
                ),
                MyCol(

                    child: singleTrendingWidget(
                        image: './assets/images/shopping/product/product-7.jpg',
                        name: "Colorful Sandal",
                        price: "49.99")),
                MyCol(
                    display: {
                      ScreenMediaType.XS : DisplayType.None,
                      ScreenMediaType.LG: DisplayType.Block
                    },
                    child: singleTrendingWidget(
                        image: './assets/images/shopping/product/product-5.jpg',
                        name: "Colorful Sandal",
                        price: "49.99")),
              ],
            ),
            Spacing.height(24),
            Padding(
              padding: Spacing.x(8),
              child: Text("Popular Deals",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                      fontWeight: 600, letterSpacing: 0)),
            ),
            Spacing.height(16),
            Padding(

              padding: Spacing.x(8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    singleItemWidget(
                        image: './assets/images/shopping/product/product-10.jpg',
                        name: "Pop corn",
                        rate: 45.99),
                    Spacing.width(16),
                    singleItemWidget(
                        image: './assets/images/shopping/product/product-7.jpg',
                        name: "Cosmic bang",
                        rate: 78.99),
                    Spacing.width(16),
                    singleItemWidget(
                        image: './assets/images/shopping/product/product-5.jpg',
                        name: "Sweet Gems",
                        rate: 35.99),
                    Spacing.width(16),
                    singleItemWidget(
                        image: './assets/images/shopping/product/product-2.jpg',
                        name: "Toffees",
                        rate: 28.49),
                    Spacing.width(16),
                    singleItemWidget(
                        image: './assets/images/shopping/product/product-3.jpg',
                        name: "Candies",
                        rate: 15.99),
                    Spacing.width(16),
                    singleItemWidget(
                        image: './assets/images/shopping/product/product-9.jpg',
                        name: "Candies",
                        rate: 15.99),
                    Spacing.width(16),
                    singleItemWidget(
                        image: './assets/images/shopping/product/product-8.jpg',
                        name: "Candies",
                        rate: 15.99),
                    Spacing.width(16),
                    singleItemWidget(
                        image: './assets/images/shopping/product/product-6.jpg',
                        name: "Candies",
                        rate: 15.99),
                    Spacing.width(16),
                    singleItemWidget(
                        image: './assets/images/shopping/product/product-4.jpg',
                        name: "Candies",
                        rate: 15.99),
                    Spacing.width(16),
                    singleItemWidget(
                        image: './assets/images/shopping/product/product-1.jpg',
                        name: "Candies",
                        rate: 15.99),
                  ],
                ),
              ),
            ),
            Spacing.height(24),
            Padding(
              padding: Spacing.x(8),
              child: Text("For You",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                      fontWeight: 600, letterSpacing: 0)),
            ),
            Spacing.height(16),
            MyRow(
              defaultFlex: {
                ScreenMediaType.MD:12,
                ScreenMediaType.XL: 8,
                ScreenMediaType.XXL: 6,
              },
              children: [
                MyCol(
                  child: singleForYouWidget(
                    name: "Sweet Gems",
                    image: './assets/images/shopping/product/product-5.jpg',
                    shopName: 'El Primo',
                    star: 4.5,
                    price: 1470,
                  ),
                ),
                MyCol(
                  child: singleForYouWidget(
                    name: "Lipsticks",
                    image: './assets/images/shopping/product/product-4.jpg',
                    shopName: 'Bee Lipstore',
                    star: 3.8,
                    price: 1486,
                  ),
                ),
                MyCol(
                  child: singleForYouWidget(
                    name: "Candies",
                    image: './assets/images/shopping/product/product-2.jpg',
                    shopName: 'Bee Lipstore',
                    star: 4,
                    price: 1456,
                  ),
                ),
                MyCol(
                  child: singleForYouWidget(
                    name: "Lipstick",
                    image: './assets/images/shopping/product/product-6.jpg',
                    shopName: 'Lips',
                    star: 4,
                    price: 1456,
                  ),
                ),
                MyCol(
                  child: singleForYouWidget(
                    name: "Fry Spray",
                    image: './assets/images/shopping/product/product-7.jpg',
                    shopName: 'My Spray',
                    star: 4,
                    price: 1456,
                  ),
                ),
                MyCol(
                  child: singleForYouWidget(
                    name: "Sandle",
                    image: './assets/images/shopping/product/product-8.jpg',
                    shopName: 'Sandiee',
                    star: 4,
                    price: 1456,
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget singleItemWidget({String image, String name, double rate}) {
    String key = Generator.randomString(10);
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ShoppingProductScreen(
                      heroTag: key,
                      image: image,
                    )));
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: key,
              child: MyContainer.none(
                borderRadiusAll: 4,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset(
                  image,
                  height: 140,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              margin: Spacing.top(8),
              child: Text(name,
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                      color: themeData.colorScheme.onBackground,
                      letterSpacing: 0,
                      muted: true,
                      fontWeight: 600)),
            ),
            Text("\$ " + rate.toString(),
                style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                    color: themeData.colorScheme.onBackground,
                    letterSpacing: 0,
                    fontWeight: 500)),
          ],
        ),
      ),
    );
  }

  Widget singleForYouWidget(
      {String name, String image, String shopName, double star, int price}) {
    String key = Generator.randomString(10);
    return MyCard(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ShoppingProductScreen(
                  heroTag: key,
                  image: image,
                )));
      },
      borderRadiusAll: 8,
      child: Row(
        children: <Widget>[
          Hero(
            tag: key,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Image.asset(
                image,
                height: 90,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Spacing.width(16),
          Expanded(
            child: Container(
              height: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(name,
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle1,
                              fontWeight: 600,
                              letterSpacing: 0)),
                      Icon(
                        MdiIcons.heart,
                        color: themeData.colorScheme.onBackground.withAlpha(75),
                        size: 22,
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Generator.buildRatingStar(
                          rating: star,
                          size: 16,
                          inactiveColor: themeData.colorScheme.onBackground),
                      Spacing.width(4),
                      Text(star.toString(),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              fontWeight: 600)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            MdiIcons.storeOutline,
                            color: themeData.colorScheme.onBackground
                                .withAlpha(200),
                            size: 20,
                          ),
                          Spacing.width(4),
                          Text(
                            shopName,
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                color: themeData.colorScheme.onBackground
                                    .withAlpha(200),
                                fontWeight: 500),
                          )
                        ],
                      ),
                      Text(
                        "\$ " + price.toString(),
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            fontWeight: 700),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget singleTrendingWidget({String image, String name, String price}) {
    String key = Generator.randomString(10);
    return MyCard(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ShoppingProductScreen(
                  heroTag: key,
                  image: image,
                )));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: Spacing.all(8),
                  decoration: BoxDecoration(
                      color: customAppTheme.bgLayer2,
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Text(
                    "Trending",
                    style: AppTheme.getTextStyle(themeData.textTheme.caption,
                        color: themeData.colorScheme.onBackground,
                        muted: true,
                        letterSpacing: 0.3,
                        fontWeight: 600),
                  ),
                ),
                Text(
                  name,
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                      color: themeData.colorScheme.onBackground,
                      fontWeight: 600,
                      letterSpacing: 0),
                ),
                Text(
                  "\$ " + price,
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                      color: themeData.colorScheme.onBackground,
                      fontWeight: 600,
                      letterSpacing: 0),
                )
              ],
            ),
          ),
          MyContainer.none(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            borderRadiusAll: 8,
            child: Image(
              image: AssetImage(image),
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
        ],
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
                image: './assets/images/shopping/product/product-8.jpg',
                text: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "50% OFF ",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            color: themeData.colorScheme.primary,
                            fontWeight: 600,
                            letterSpacing: 0.2)),
                    TextSpan(
                        text: "in ultraboost all puma ltd shoes",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 500,
                            letterSpacing: 0.2))
                  ]),
                ),
                time: "9:35 AM"),
            Spacing.height(24),
            singleNotification(
                image: './assets/images/shopping/product/product-2.jpg',
                text: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "30% OFF ",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            color: themeData.colorScheme.primary,
                            fontWeight: 600,
                            letterSpacing: 0.2)),
                    TextSpan(
                        text: "in all cake till 31 july",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 500,
                            letterSpacing: 0.2))
                  ]),
                ),
                time: "9:35 AM"),
            Spacing.height(24),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Orders",
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600,
                        letterSpacing: 0),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                        color: themeData.colorScheme.primary.withAlpha(40),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Center(
                        child: Text(
                      "8",
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
                image: './assets/images/shopping/product/product-1.jpg',
                text: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "Your cake order has been delivered at Himalaya",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 500,
                            letterSpacing: 0))
                  ]),
                ),
                time: "Just Now"),
            Spacing.height(24),
            singleNotification(
                image: './assets/images/shopping/product/product-3.jpg',
                text: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "last order has been cancelled by seller",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 500,
                            letterSpacing: 0.2))
                  ]),
                ),
                time: "14 July"),
            Spacing.height(24),
            Center(
              child: TextButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        Spacing.fromLTRB(16, 4, 16, 4))),
                onPressed: () {},
                child: Text(
                  "View All",
                  style: AppTheme.getTextStyle(themeData.textTheme.caption,
                      color: themeData.colorScheme.primary,
                      fontWeight: 600,
                      letterSpacing: 0.2),
                ),
              ),
            ),
            Spacing.height(24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Security",
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
                    "1",
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        fontSize: 10,
                        color: themeData.colorScheme.primary,
                        fontWeight: 600),
                  )),
                )
              ],
            ),
            Spacing.height(24),
            singleNotification(
                image: './assets/images/avatar-1.jpg',
                text: RichText(
                  text: TextSpan(
                      text: "Your account password has been changed",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2,
                          color: themeData.colorScheme.onBackground,
                          fontWeight: 500,
                          letterSpacing: 0.2)),
                ),
                time: "2 days ago"),
          ],
        ),
      ),
    );
  }

  Widget singleNotification({String image, RichText text, String time}) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
            ),
          ),
          Spacing.width(16),
          Expanded(
            child: text,
          ),
          Spacing.width(16),
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
