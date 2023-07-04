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

class ShoppingOrderScreen extends StatefulWidget {
  @override
  _ShoppingOrderScreenState createState() => _ShoppingOrderScreenState();
}

class _ShoppingOrderScreenState extends State<ShoppingOrderScreen> {
  int themeType;
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget child) {
        themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(themeType),
            home: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return buildScreen(
                    ScreenMedia.getScreenMediaType(constraints.maxWidth));
              },
            ));
      },
    );
  }

  Widget buildScreen(ScreenMediaType screenMediaType) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: customAppTheme.bgLayer1,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              MdiIcons.chevronLeft,
              color: themeData.colorScheme.onBackground,
            ),
          ),
          title: Text(
            "Orders",
            style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                color: themeData.colorScheme.onBackground, fontWeight: 600),
          ),
        ),
        body: Container(
          color: customAppTheme.bgLayer1,
          child: ListView(
            padding: Spacing.xy(8, 0),
            children: <Widget>[
              MyRow(
                defaultFlex: {
                  ScreenMediaType.MD: 12,
                  ScreenMediaType.XL: 8,
                },
                children: [
                  MyCol(
                    child: singleOrderItem(
                        price: 49.49,
                        time: "12 April 2020, 1:45",
                        listItem: [
                          "./assets/images/shopping/product/product-1.jpg",
                          "./assets/images/shopping/product/product-2.jpg",
                          "./assets/images/shopping/product/product-3.jpg",
                          "./assets/images/shopping/product/product-4.jpg"
                        ],
                        number: 4568,
                        status: "In Progress"),
                  ),
                  MyCol(
                    child: singleOrderItem(
                        price: 54.99,
                        time: "14 Feb 2020, 12:04",
                        listItem: [
                          "./assets/images/shopping/product/product-5.jpg",
                          "./assets/images/shopping/product/product-3.jpg"
                        ],
                        number: 1478,
                        status: "Delivered"),
                  ),
                  MyCol(
                    child: singleOrderItem(
                        price: 69.99,
                        time: "16 Dec 2019, 8:48",
                        listItem: [
                          "./assets/images/shopping/product/product-9.jpg",
                          "./assets/images/shopping/product/product-7.jpg",
                          "./assets/images/shopping/product/product-10.jpg",
                        ],
                        number: 1123,
                        status: "Delivered"),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Widget singleOrderItem(
      {List<String> listItem,
      int number,
      String time,
      String status,
      double price}) {
    //Logic for row items

    List<MyCol> _itemWidget = [];

    for (int i = 0; i < listItem.length; i++) {
      if (i == 2 && listItem.length > 3) {
        _itemWidget.add(
          MyCol(
            child: Center(
                child: TextButton(
              onPressed: () {

              },
              child: Text(
                "+" + (listItem.length - 2).toString(),
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                    letterSpacing: 0.5,
                    color: themeData.colorScheme.primary,
                    fontWeight: 600),
              ),
            )),
          ),
        );
        break;
      } else {
        _itemWidget.add(
          MyCol(
            child: MyContainer(
              borderRadiusAll: 8,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              paddingAll: 0,
              child: Image.asset(
                listItem[i],
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      }
    }

    return MyCard(
      borderRadiusAll: 8,
      bordered: true,
      shadow: MyShadow(elevation: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Order $number",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle1,
                          fontWeight: 700,
                          letterSpacing: -0.2),
                    ),
                    Spacing.height(8),
                    Text(
                      "\$ $price",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2,
                          fontWeight: 600,
                          letterSpacing: 0),
                    ),
                  ],
                ),
              ),
              MyContainer(
                color: customAppTheme.bgLayer2,
                borderRadiusAll: 4,
                padding: Spacing.xy(8, 4),
                child: Text(
                  status.toUpperCase(),
                  style: AppTheme.getTextStyle(themeData.textTheme.caption,
                      fontSize: 12, fontWeight: 700, letterSpacing: 0.2),
                ),
              )
            ],
          ),
          Container(
              child: Text(time,
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                      fontWeight: 600,
                      letterSpacing: -0.2,
                      color:
                          themeData.colorScheme.onBackground.withAlpha(160)))),
          Spacing.height(16),
          MyRow(
            wrapCrossAlignment: WrapCrossAlignment.center,
            defaultFlex: {
              ScreenMediaType.XS: 8,
            },
            children: _itemWidget,
          ),
        ],
      ),
    );
  }
}
