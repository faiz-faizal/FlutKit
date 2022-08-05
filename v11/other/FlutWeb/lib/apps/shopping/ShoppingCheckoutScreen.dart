
import 'package:flutkit/apps/shopping/ShoppingDeliveryAddressScreen.dart';
import 'package:flutkit/style/MyCard.dart';
import 'package:flutkit/style/MyCol.dart';
import 'package:flutkit/style/MyRow.dart';
import 'package:flutkit/style/ScreenMedia.dart';
import 'package:flutkit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppNotifier.dart';
import '../../AppTheme.dart';

class ShoppingCheckoutScreen extends StatefulWidget {
  @override
  _ShoppingCheckoutScreenState createState() => _ShoppingCheckoutScreenState();
}

class _ShoppingCheckoutScreenState extends State<ShoppingCheckoutScreen> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;
  int themeType;

  int methodType = 0;

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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: customAppTheme.bgLayer1,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              MdiIcons.chevronLeft,
              color: themeData.colorScheme.onBackground,
            ),
          ),
          centerTitle: true,
          title: Text("Checkout",
              style: AppTheme.getTextStyle(
                  themeData.textTheme.subtitle1,
                  fontWeight: 600)),
        ),
        backgroundColor: customAppTheme.bgLayer1,
        body: ListView(
          padding: Spacing.fromLTRB(8,24,8,24),
          children: <Widget>[
            MyRow(
              wrapCrossAlignment: WrapCrossAlignment.start,
              defaultFlex: {
                ScreenMediaType.XS: 24,
                ScreenMediaType.MD: 12,
                ScreenMediaType.LG: 8,
              },
              children: [
                MyCol(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Address",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText1,
                            fontWeight: 600),
                      ),
                      Spacing.height(16),
                      MyCard(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShoppingDeliveryAddressScreen()));
                        },
                        paddingAll: 16,
                        borderRadiusAll: 4,

                        child: Row(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(4)),
                              child: Image.asset(
                                './assets/other/map-snap.png',
                                height:64,
                                width: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 64,
                                margin: Spacing.left(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "West Drive",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle1,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 600),
                                    ),
                                    Text(
                                      "14, 921 Section",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.caption,
                                          color: themeData
                                              .colorScheme.onBackground
                                              .withAlpha(150),
                                          fontWeight: 500),
                                    ),
                                    Container(
                                      margin:
                                      Spacing.top(4),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
                                        children: <Widget>[
                                          Icon(
                                            MdiIcons.informationOutline,
                                            color: themeData
                                                .colorScheme.onBackground
                                                .withAlpha(200),
                                            size: 10,
                                          ),
                                          Container(
                                            margin: Spacing.left(4),
                                            child: Text(
                                              "Tap to change",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.caption,
                                                  fontSize: 9,
                                                  fontWeight: 400,
                                                  color: themeData.colorScheme
                                                      .onBackground),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                MyCol(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Payment",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText1,
                            fontWeight: 600),
                      ),
                      Spacing.height(16),
                      MyCard(
                        paddingAll: 0,
                        borderRadiusAll: 8,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: customAppTheme.bgLayer2,
                        child: Column(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                setState(() {
                                  methodType = 0;
                                });
                              },
                              child: singlePayment(
                                  isSelected: methodType == 0,
                                  method: "Wallet / UPI"),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  methodType = 1;
                                });
                              },
                              child: singlePayment(
                                  isSelected: methodType == 1,
                                  method:
                                  "Net Banking"),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  methodType = 2;
                                });
                              },
                              child: singlePayment(
                                  isSelected: methodType == 2,
                                  method: "Credit / Debit"),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  methodType = 3;
                                });
                              },
                              child: singlePayment(
                                  isSelected: methodType == 3,
                                  method:
                                  "Cash on Delivery"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                MyCol(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Details",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText1,
                            fontWeight: 600),
                      ),
                      Spacing.height(16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "FLAT40",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    color:
                                    themeData.colorScheme.onBackground,
                                    fontWeight: 600,
                                    muted: true),
                              ),
                              Text("- 40% at max 100\$",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,fontSize: 12,
                                      color:
                                      themeData.colorScheme.onBackground,
                                      fontWeight: 400,letterSpacing: -0.2))
                            ],
                          ),
                          InkWell(
                            onTap: (){

                            },
                            child: Text(
                              "Change coupon",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText2,
                                  color: themeData.colorScheme.primary,
                                  fontWeight: 600),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: Spacing.top(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Coupon Discount",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText1,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 600),
                            ),
                            Text("-\$ 19.99",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    color: themeData.colorScheme.onBackground,
                                    muted: true,
                                    fontWeight: 600))
                          ],
                        ),
                      ),
                      Container(
                        margin: Spacing.top(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Total",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText1,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 600),
                            ),
                            Text("\$ 79.99",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    color: themeData.colorScheme.onBackground,
                                    muted: true,
                                    fontWeight: 600))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                MyCol(
                  flex: {

                  },
                  child: Container(
                    margin: Spacing.top(24),
                    child: Center(
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(Spacing.xy(60, 16))
                        ),
                        icon: Icon(
                          MdiIcons.chevronRight,
                          color: themeData.colorScheme.onPrimary,
                          size: 16,
                        ),
                        label:  Text(
                          "Proceed"
                              .toUpperCase(),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              letterSpacing: 0.4,
                              fontWeight: 600,
                              color: themeData.colorScheme.onPrimary),
                        ), onPressed: () {  },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }



  Widget singlePayment({String method, bool isSelected}) {
    return Container(
      decoration: BoxDecoration(
          color: isSelected
              ? themeData.colorScheme.primary
              : customAppTheme.bgLayer2,
          borderRadius: isSelected
              ? BorderRadius.all(Radius.circular(8))
              : BorderRadius.zero),
      padding: Spacing.xy(32,24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            method,
            style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                color: isSelected
                    ? themeData.colorScheme.onPrimary
                    : themeData.colorScheme.onBackground,
                fontWeight: 600,
                letterSpacing: 0.3),
          ),
          isSelected
              ? Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                color: themeData.colorScheme.onPrimary,
                borderRadius:
                BorderRadius.all(Radius.circular(16))),
            child: Icon(
              MdiIcons.check,
              color: themeData.colorScheme.primary,
              size: 16,
            ),
          )
              : Container(
            width:20,
            height: 20,
            decoration: BoxDecoration(
                border: Border.all(
                    color:
                    themeData.colorScheme.onBackground.withAlpha(60),
                    width: 1.6),
                borderRadius:
                BorderRadius.all(Radius.circular(16))),
          ),
        ],
      ),
    );
  }
}