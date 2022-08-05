import 'package:flutkit/style/MyCol.dart';
import 'package:flutkit/style/MyContainer.dart';
import 'package:flutkit/style/MyRow.dart';
import 'package:flutkit/style/ScreenMedia.dart';
import 'package:flutkit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppNotifier.dart';
import '../../AppTheme.dart';
import 'FoodFeedbackScreen.dart';

class FoodCheckoutScreen extends StatefulWidget {
  @override
  _FoodCheckoutScreenState createState() => _FoodCheckoutScreenState();
}

class _FoodCheckoutScreenState extends State<FoodCheckoutScreen> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  int selectedAddress = 0;
  int paymentMethod = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget child) {
        int themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);

        return Scaffold(
          appBar: AppBar(
            backgroundColor: customAppTheme.bgLayer1,
            elevation: 0,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(MdiIcons.chevronLeft,
                  size: 24, color: themeData.appBarTheme.iconTheme.color),
            ),
            title: Text(
              "Checkout",
              style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                  color: themeData.colorScheme.onBackground, fontWeight: 600),
            ),
          ),
          backgroundColor: customAppTheme.bgLayer1,
          body: ListView(
            padding: Spacing.zero,
            children: [
              MyRow(
                wrapAlignment: WrapAlignment.center,
                spacing: 0,
                children: [
                  MyCol(
                    flex: {
                      ScreenMediaType.MD: 12,
                      ScreenMediaType.XL: 8,
                    },
                    child: Container(
                      margin: Spacing.x(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Saved Address",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 600),
                          ),
                          Spacing.height(8),
                          savedAddressWidget(),
                          Spacing.height(16),
                          Text(
                            "Add Address",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 600),
                          ),
                          Spacing.height(8),
                          TextFormField(
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                letterSpacing: 0.1,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 500),
                            decoration: InputDecoration(
                              hintText: "Address",
                              hintStyle: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  letterSpacing: 0.1,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 500),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  borderSide: BorderSide(
                                      color: themeData.colorScheme.surface,
                                      width: 1.2)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  borderSide: BorderSide(
                                      color: themeData.colorScheme.surface,
                                      width: 1.2)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  borderSide: BorderSide(
                                      color: themeData.colorScheme.surface,
                                      width: 1.2)),
                              prefixIcon: Icon(
                                MdiIcons.mapMarkerOutline,
                                size: 22,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(0),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            textCapitalization: TextCapitalization.sentences,
                          ),
                          Spacing.height(8),
                          TextFormField(
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                letterSpacing: 0.1,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 500),
                            decoration: InputDecoration(
                              hintStyle: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  letterSpacing: 0.1,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 500),
                              hintText: "Delivery note",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  borderSide: BorderSide(
                                      color: themeData.colorScheme.surface,
                                      width: 1.2)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  borderSide: BorderSide(
                                      color: themeData.colorScheme.surface,
                                      width: 1.2)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  borderSide: BorderSide(
                                      color: themeData.colorScheme.surface,
                                      width: 1.2)),
                              prefixIcon: Icon(
                                MdiIcons.informationOutline,
                                size: 22,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(0),
                            ),
                            textCapitalization: TextCapitalization.sentences,
                          ),
                          Spacing.height(16),
                          Text(
                            "Payment Method",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 600),
                          ),
                          Spacing.height(8),
                          paymentMethodWidget(),
                          Spacing.height(16),
                          Text(
                            "Order amount : \$39.99",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 600),
                          ),
                          Spacing.height(16),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                boxShadow: [
                                  BoxShadow(
                                    color: themeData.colorScheme.primary
                                        .withAlpha(20),
                                    blurRadius: 3,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        Spacing.xy(32, 0))),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              FoodFeedbackScreen()));
                                },
                                child: Text(
                                  "Place Order".toUpperCase(),
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      fontWeight: 600,
                                      color: themeData.colorScheme.onPrimary),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget savedAddressWidget() {
    return Container(
      child: Row(
        children: <Widget>[
          MyContainer(
            onTap: () {
              setState(() {
                selectedAddress = 0;
              });
            },
            color: selectedAddress == 0
                ? themeData.colorScheme.primary
                : Colors.transparent,
            borderRadiusAll: 4,
            border: Border.all(color: themeData.colorScheme.primary),
            bordered: selectedAddress != 0,
            padding: Spacing.xy(12, 6),
            child: Text(
              "Home",
              style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                  color: selectedAddress == 0
                      ? themeData.colorScheme.onPrimary
                      : themeData.colorScheme.onBackground,
                  fontWeight: 500),
            ),
          ),
          Spacing.width(16),
          MyContainer(
            onTap: () {
              setState(() {
                selectedAddress = 1;
              });
            },
            color: selectedAddress == 1
                ? themeData.colorScheme.primary
                : Colors.transparent,
            borderRadiusAll: 4,
            border: Border.all(color: themeData.colorScheme.primary),
            bordered: selectedAddress != 1,
            padding: Spacing.xy(12, 6),
            child: Text(
              "Office",
              style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                  color: selectedAddress == 1
                      ? themeData.colorScheme.onPrimary
                      : themeData.colorScheme.onBackground,
                  fontWeight: 500),
            ),
          ),
          Spacing.width(16),
          MyContainer(
            onTap: () {
              setState(() {
                selectedAddress = 2;
              });
            },
            color: selectedAddress == 2
                ? themeData.colorScheme.primary
                : Colors.transparent,
            borderRadiusAll: 4,
            border: Border.all(color: themeData.colorScheme.primary),
            bordered: selectedAddress != 2,
            padding: Spacing.xy(12, 6),
            child: Text(
              "Other",
              style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                  color: selectedAddress == 2
                      ? themeData.colorScheme.onPrimary
                      : themeData.colorScheme.onBackground,
                  fontWeight: 500),
            ),
          ),
        ],
      ),
    );
  }

  Widget paymentMethodWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                paymentMethod = 0;
              });
            },
            child: Row(
              children: <Widget>[
                Radio(
                  value: 0,
                  groupValue: paymentMethod,
                  onChanged: (int value) {
                    setState(() {
                      paymentMethod = value;
                    });
                  },
                ),
                Text(
                  "G Pay",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                      color: themeData.colorScheme.onBackground,
                      fontWeight: 600),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                paymentMethod = 1;
              });
            },
            child: Row(
              children: <Widget>[
                Radio(
                  value: 1,
                  groupValue: paymentMethod,
                  onChanged: (int value) {
                    setState(() {
                      paymentMethod = value;
                    });
                  },
                ),
                Text(
                  "Paypal",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                      color: themeData.colorScheme.onBackground,
                      fontWeight: 600),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                paymentMethod = 2;
              });
            },
            child: Row(
              children: <Widget>[
                Radio(
                  value: 2,
                  groupValue: paymentMethod,
                  onChanged: (int value) {
                    setState(() {
                      paymentMethod = value;
                    });
                  },
                ),
                Text(
                  "Credit card",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                      color: themeData.colorScheme.onBackground,
                      fontWeight: 600),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                paymentMethod = 3;
              });
            },
            child: Row(
              children: <Widget>[
                Radio(
                  value: 3,
                  groupValue: paymentMethod,
                  onChanged: (int value) {
                    setState(() {
                      paymentMethod = value;
                    });
                  },
                ),
                Text(
                  "Cash on Delivery",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                      color: themeData.colorScheme.onBackground,
                      fontWeight: 600),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
