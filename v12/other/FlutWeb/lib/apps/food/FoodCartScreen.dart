import 'package:flutkit/style/MyCol.dart';
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
import 'FoodCheckoutScreen.dart';
import 'FoodProductScreen.dart';

class FoodCartScreen extends StatefulWidget {
  @override
  _FoodCartScreenState createState() => _FoodCartScreenState();
}

class _FoodCartScreenState extends State<FoodCartScreen> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

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
                  size: 24,
                  color: themeData.appBarTheme.iconTheme.color),
            ),
            title: Text(
              "Cart",
              style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                  color: themeData.colorScheme.onBackground,
                  fontWeight: 600),
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

                          SingleCartItem(
                              image: './assets/food/food-7.jpg',
                              name: "Food dish",
                              price: 15.99,
                              qty: 4),
                          Spacing.height(16),
                          SingleCartItem(
                              image: './assets/food/food-8.jpg',
                              name: "Shepherd's Pie",
                              price: 19.79,
                              qty: 1),
                          Spacing.height(16),
                          SingleCartItem(
                              image: './assets/food/food-9.jpg',
                              name: "Bangers",
                              price: 39.79,
                              qty: 2),
                          Spacing.height(24),

                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Subtotal",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      color: themeData
                                          .colorScheme.onBackground,
                                      fontWeight: 600)),
                              Text("\$ 39.99",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      color: themeData
                                          .colorScheme.onBackground,
                                      fontWeight: 600)),
                            ],
                          ),
                          Spacing.height(8),

                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Charges \& Taxes",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      color: themeData
                                          .colorScheme.onBackground,
                                      fontWeight: 600)),
                              Text("\$ 9.00",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      color: themeData
                                          .colorScheme.onBackground,
                                      fontWeight: 600)),
                            ],
                          ),
                          Spacing.height(8),

                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Total",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle1,
                                      color: themeData
                                          .colorScheme.onBackground,
                                      fontWeight: 700)),
                              Text("\$ 49.99",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle1,
                                      color: themeData
                                          .colorScheme.onBackground,
                                      fontWeight: 700)),
                            ],
                          ),
                          Spacing.height(16),

                          Center(
                            child: ElevatedButton(

                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FoodCheckoutScreen()));
                              },
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(Spacing.xy(32, 0))
                              ),
                              child: Text(
                                "Checkout".toUpperCase(),
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    letterSpacing: 0.4,
                                    color: themeData.colorScheme.onPrimary,
                                    fontWeight: 600),
                              ),
                            ),
                          )
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


}

class SingleCartItem extends StatefulWidget {

  final String image,name;
  final double price;
  final int qty;

  const SingleCartItem({Key key, this.image, this.name, this.price, this.qty}) : super(key: key);

  @override
  _SingleCartItemState createState() => _SingleCartItemState();
}

class _SingleCartItemState extends State<SingleCartItem> {

  ThemeData themeData;
  int qty;

  @override
  void initState() {
    super.initState();
    qty = widget.qty;
  }



  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FoodProductScreen()));
            },
            child: Image(
              image: AssetImage(widget.image),
              height:100,
              width: 100,
            ),
          ),
        ),
        Spacing.width(16),
        Expanded(
          child: Container(
            height: 100,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.name,
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                      color: themeData.colorScheme.onBackground,
                      fontWeight: 600),
                ),
                Spacing.height(8),
                Text(
                  "\$ " + widget.price.toString(),
                  style: AppTheme.getTextStyle(
                      themeData.textTheme.bodyText1,
                      color: themeData.colorScheme.onBackground,
                      fontWeight: 600),
                ),
                Spacing.height(8),
                Text(
                  "customize",
                  style: AppTheme.getTextStyle(
                    themeData.textTheme.caption,
                    fontSize: 12,
                    color: themeData.colorScheme.primary,
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Text(
                qty.toString(),
                style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                    color: themeData.colorScheme.onBackground,
                    fontWeight: 600),
              ),
              Row(
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      if(qty>1)
                        setState(() {
                          qty--;
                        });
                    },
                    child: Container(
                      padding:Spacing.all(8),
                      decoration: BoxDecoration(
                        color: themeData.colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        MdiIcons.minus,
                        size: 18,
                        color: themeData.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                  Spacing.width(8),
                  InkWell(
                    onTap: (){
                      setState(() {
                        qty++;
                      });
                    },
                    child: Container(
                      padding: Spacing.all(6),
                      decoration: BoxDecoration(
                        color: themeData.colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        MdiIcons.plus,
                        size: 18,
                        color: themeData.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

