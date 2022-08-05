import 'dart:ui';

import 'package:flutkit/apps/shopping/ShoppingCheckoutScreen.dart';
import 'package:flutkit/style/ScreenMedia.dart';
import 'package:flutkit/utils/SizeConfig.dart';
import 'package:flutkit/style/MyCard.dart';
import 'package:flutkit/style/MyCol.dart';
import 'package:flutkit/style/MyRow.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppNotifier.dart';
import '../../AppTheme.dart';

class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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

  Widget buildScreen(ScreenMediaType screenMediaType) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: customAppTheme.bgLayer1,
        body: ListView(
          padding: Spacing.fromLTRB(8,24,8,24),
          children: <Widget>[
            MyRow(
              defaultFlex: {
            ScreenMediaType.MD: 12,
            ScreenMediaType.LG: 10,
            ScreenMediaType.XL: 8,
            ScreenMediaType.XXL: 6,
            },
              wrapAlignment: WrapAlignment.center,
              children: [
                MyCol(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SingleCartItem(
                          themeType: themeType,
                          image:
                              './assets/images/shopping/product/product-1.jpg',
                          price: 19.99,
                          name: "Pumpkin\nCream",
                          initialAmount: 2,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24),
                          child: SingleCartItem(
                            themeType: themeType,
                            image:
                                './assets/images/shopping/product/product-2.jpg',
                            price: 27.89,
                            name: "Carrom\nRoll",
                            initialAmount: 1,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24),
                          child: SingleCartItem(
                            themeType: themeType,
                            image:
                                './assets/images/shopping/product/product-5.jpg',
                            price: 39.79,
                            name: "Other\nSeed",
                            initialAmount: 3,
                          ),
                        ),
                      ],
                    )),
                MyCol(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Sub Total",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText1,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 600,
                                  muted: true),
                            ),
                            Text("\$199.99",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    color:
                                        themeData.colorScheme.onBackground,
                                    fontWeight: 600,
                                    letterSpacing: 0,
                                    muted: true))
                          ],
                        ),
                        Spacing.height(8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Discount",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText1,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 600,
                                  muted: true),
                            ),
                            Text("-\$15.99",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    color:
                                        themeData.colorScheme.onBackground,
                                    fontWeight: 600,
                                    letterSpacing: 0,
                                    muted: true))
                          ],
                        ),
                        Spacing.height(8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Tax (GST)",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText1,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 600,
                                  muted: true),
                            ),
                            Text("\$19.00",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    color:
                                        themeData.colorScheme.onBackground,
                                    fontWeight: 600,
                                    letterSpacing: 0,
                                    muted: true))
                          ],
                        ),
                        Spacing.height(8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Total",
                              style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle1,
                                fontWeight: 700,
                                color: themeData.colorScheme.onBackground,
                              ),
                            ),
                            Text("\$202.00",
                                style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle1,
                                  fontWeight: 700,
                                  color: themeData.colorScheme.onBackground,
                                  letterSpacing: 0,
                                ))
                          ],
                        ),
                        Spacing.height(48),
                        ElevatedButton.icon(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(Spacing.fromLTRB(48, 16, 48, 16)),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShoppingCheckoutScreen()));
                          },
                          label: Text(
                            "Checkout".toUpperCase(),
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.caption,
                                letterSpacing: 0.5,
                                fontWeight: 600,
                                color: themeData
                                    .colorScheme.onPrimary),
                          ),
                          icon: Icon(
                            MdiIcons.cartArrowRight,
                            color: themeData.colorScheme.onPrimary,
                            size: 18,
                          ),

                        )
                      ],
                    )),
              ],
            ),
          ],
        ));
  }
}

class SingleCartItem extends StatefulWidget {
  final String image, name;
  final double price;
  final int themeType, initialAmount;

  const SingleCartItem(
      {Key key,
      this.image,
      this.name,
      this.price,
      this.themeType = 1,
      this.initialAmount = 1})
      : super(key: key);

  @override
  _SingleCartItemState createState() => _SingleCartItemState();
}

class _SingleCartItemState extends State<SingleCartItem> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;
  bool visible = true;

  int amount;

  @override
  void initState() {
    super.initState();
    amount = widget.initialAmount;
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    customAppTheme = AppTheme.getCustomAppTheme(widget.themeType);

    return MyCard(
      paddingAll: 0,
      borderRadiusAll: 16,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Dismissible(
        direction: DismissDirection.endToStart,
        background: Container(
          color: customAppTheme.bgLayer1,
        ),
        secondaryBackground: Container(
          color: customAppTheme.bgLayer1,
          padding: EdgeInsets.symmetric(horizontal: 0),
          alignment: AlignmentDirectional.centerEnd,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 16),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: customAppTheme.colorError.withAlpha(36),
                    shape: BoxShape.circle),
                child: Icon(
                  MdiIcons.deleteOutline,
                  size: 26,
                  color: customAppTheme.colorError,
                ),
              ),
            ],
          ),
        ),
        onDismissed: (direction) {
          if (direction == DismissDirection.endToStart) {
            setState(() {
              //perform delete operation
              setState(() {
                visible = false;
              });
            });
          }
        },
        key: UniqueKey(),
        child: Row(
          children: <Widget>[
            Image.asset(
              widget.image,
              width: 120,
              fit: BoxFit.fill,
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: Spacing.x(24),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.name,
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 600),
                        ),
                        Spacing.height(16),
                        Text(
                          "\$" + "${widget.price}",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 600,
                              letterSpacing: -0.2,
                              muted: true),
                        ),
                      ],
                    )),

                    Column(
                      children: <Widget>[
                        MyCard(
                          onTap: () {
                            setState(() {
                              amount++;
                            });
                          },
                          paddingAll: 6,
                          boxShape: BoxShape.circle,
                          color: customAppTheme.bgLayer2,
                          child: Icon(
                            MdiIcons.plus,
                            size: 16,
                            color: themeData.colorScheme.onBackground,
                          ),
                        ),
                        Spacing.height(8),
                        Text(
                          "$amount",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.headline6,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 600),
                        ),
                        Spacing.height(8),
                        MyCard(
                          onTap: () {
                            setState(() {
                              if (amount > 1) amount--;
                            });
                          },
                          paddingAll: 6,
                          boxShape: BoxShape.circle,
                          color: customAppTheme.bgLayer2,
                          child: Icon(
                            MdiIcons.minus,
                            size: 16,
                            color: themeData.colorScheme.onBackground,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
