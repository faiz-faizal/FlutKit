import 'package:flutkit/style/MyCol.dart';
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
import 'FoodProductScreen.dart';

class FoodMenuScreen extends StatefulWidget {
  @override
  _FoodMenuScreenState createState() => _FoodMenuScreenState();
}

class _FoodMenuScreenState extends State<FoodMenuScreen> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  List<bool> _dataExpansionPanel = [false, false, true, false, false];



  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget child) {
        int themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);

        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: customAppTheme.bgLayer1,
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
                "Menu",
                style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                    color: themeData.colorScheme.onBackground,
                    fontWeight: 600),
              ),
            ),
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
                      child: ExpansionPanelList(
                        expandedHeaderPadding: EdgeInsets.all(0),
                        expansionCallback: (int index, bool isExpanded) {
                          setState(() {
                            _dataExpansionPanel[index] = !isExpanded;
                          });
                        },
                        animationDuration: Duration(milliseconds: 500),
                        children: <ExpansionPanel>[
                          ExpansionPanel(
                              canTapOnHeader: true,
                              headerBuilder:
                                  (BuildContext context, bool isExpanded) {
                                return ListTile(
                                  title: Text("Pizza",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          color: isExpanded
                                              ? themeData.colorScheme.primary
                                              : themeData
                                              .colorScheme.onBackground,
                                          fontWeight:
                                          isExpanded ? 700 : 600)),
                                );
                              },
                              body: Container(
                                padding: Spacing.fromLTRB(16, 0, 16, 16),
                                child: Column(
                                  children: <Widget>[
                                    singleMenuItem(
                                        image: './assets/food/food-1.jpg',
                                        name: 'Peperoni pizza',
                                        price: 25.99,
                                        rate: 4.5),
                                    Spacing.height(16),
                                    singleMenuItem(
                                        image: './assets/food/food-2.jpg',
                                        name: 'Meat Pizza',
                                        price: 21.99,
                                        rate: 3.5),
                                    Spacing.height(16),
                                    singleMenuItem(
                                        image: './assets/food/food-3.jpg',
                                        name: 'Margherita',
                                        price: 24.79,
                                        rate: 4),
                                    Spacing.height(16),
                                    singleMenuItem(
                                        image: './assets/food/food-4.jpg',
                                        name: 'Hawaiian Pizza',
                                        price: 29.80,
                                        rate: 5),
                                  ],
                                ),
                              ),
                              isExpanded: _dataExpansionPanel[0]),
                          ExpansionPanel(
                              canTapOnHeader: true,
                              headerBuilder:
                                  (BuildContext context, bool isExpanded) {
                                return ListTile(
                                  title: Text("Pasta",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          color: isExpanded
                                              ? themeData.colorScheme.primary
                                              : themeData
                                              .colorScheme.onBackground,
                                          fontWeight:
                                          isExpanded ? 700 : 600)),
                                );
                              },
                              body: Container(
                                padding: Spacing.fromLTRB(16, 0, 16, 16),
                                child: Column(
                                  children: <Widget>[
                                    singleMenuItem(
                                        image: './assets/food/pasta-1.jpg',
                                        name: 'Peperoni pizza',
                                        price: 25.99,
                                        rate: 4.5),
                                  ],
                                ),
                              ),
                              isExpanded: _dataExpansionPanel[1]),
                          ExpansionPanel(
                              canTapOnHeader: true,
                              headerBuilder:
                                  (BuildContext context, bool isExpanded) {
                                return ListTile(
                                  title: Text("Burger",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          color: isExpanded
                                              ? themeData.colorScheme.primary
                                              : themeData
                                              .colorScheme.onBackground,
                                          fontWeight:
                                          isExpanded ? 700 : 600)),
                                );
                              },
                              body: Container(
                                padding: Spacing.fromLTRB(16, 0, 16, 16),
                                child: Column(
                                  children: <Widget>[
                                    singleMenuItem(
                                        image: './assets/food/burger-1.jpg',
                                        name: 'Peperoni pizza',
                                        price: 25.99,
                                        rate: 4.5),
                                    Spacing.height(16),
                                    singleMenuItem(
                                        image: './assets/food/burger-2.jpg',
                                        name: 'Meat Pizza',
                                        price: 21.99,
                                        rate: 3.5),
                                    Spacing.height(16),
                                    singleMenuItem(
                                        image: './assets/food/burger-3.jpg',
                                        name: 'Margherita',
                                        price: 24.79,
                                        rate: 4),
                                  ],
                                ),
                              ),
                              isExpanded: _dataExpansionPanel[2]),
                          ExpansionPanel(
                              canTapOnHeader: true,
                              headerBuilder:
                                  (BuildContext context, bool isExpanded) {
                                return ListTile(
                                  title: Text("Beverage",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          color: isExpanded
                                              ? themeData.colorScheme.primary
                                              : themeData
                                              .colorScheme.onBackground,
                                          fontWeight:
                                          isExpanded ? 700 : 600)),
                                );
                              },
                              body: Container(
                                padding: Spacing.fromLTRB(16, 0, 16, 16),
                                child: Column(
                                  children: <Widget>[
                                    singleMenuItem(
                                        image: './assets/food/beverage-1.jpg',
                                        name: 'Peperoni pizza',
                                        price: 25.99,
                                        rate: 4.5),
                                    Spacing.height(16),
                                    singleMenuItem(
                                        image: './assets/food/beverage-2.jpg',
                                        name: 'Meat Pizza',
                                        price: 21.99,
                                        rate: 3.5),
                                    Spacing.height(16),
                                    singleMenuItem(
                                        image: './assets/food/beverage-3.jpg',
                                        name: 'Margherita',
                                        price: 24.79,
                                        rate: 4),
                                  ],
                                ),
                              ),
                              isExpanded: _dataExpansionPanel[3]),
                          ExpansionPanel(
                              canTapOnHeader: true,
                              headerBuilder:
                                  (BuildContext context, bool isExpanded) {
                                return ListTile(
                                  title: Text("Dessert",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText1,
                                          color: isExpanded
                                              ? themeData.colorScheme.primary
                                              : themeData
                                              .colorScheme.onBackground,
                                          fontWeight:
                                          isExpanded ? 700 : 600)),
                                );
                              },
                              body: Container(
                                padding: Spacing.fromLTRB(16, 0, 16, 16),
                                child: Column(
                                  children: <Widget>[
                                    singleMenuItem(
                                        image: './assets/food/dessert-1.jpg',
                                        name: 'Peperoni pizza',
                                        price: 25.99,
                                        rate: 4.5),
                                    Spacing.height(16),
                                    singleMenuItem(
                                        image: './assets/food/dessert-2.jpg',
                                        name: 'Meat Pizza',
                                        price: 21.99,
                                        rate: 3.5),
                                    Spacing.height(16),
                                    singleMenuItem(
                                        image: './assets/food/dessert-3.jpg',
                                        name: 'Margherita',
                                        price: 24.79,
                                        rate: 4),
                                    Spacing.height(16),
                                    singleMenuItem(
                                        image: './assets/food/dessert-4.jpg',
                                        name: 'Hawaiian Pizza',
                                        price: 29.80,
                                        rate: 5),
                                  ],
                                ),
                              ),
                              isExpanded: _dataExpansionPanel[4]),
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

  Widget singleMenuItem(
      {String image, String name, double rate, double price}) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FoodProductScreen()));
      },
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: Image(
              image: AssetImage(image),
              height: 64,
              width: 64,
            ),
          ),
          Spacing.width(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  name,
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                      color: themeData.colorScheme.onBackground,
                      letterSpacing: 0,
                      fontWeight: 600),
                ),
                Spacing.height(2),
                Generator.buildRatingStar(
                    rating: rate,
                    inactiveColor: themeData.colorScheme.onBackground,
                    size: 14),
                Spacing.height(2),
                Text(
                  "\$" + price.toString(),
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                      color: themeData.colorScheme.onBackground,
                      fontWeight: 600),
                )
              ],
            ),
          ),
          TextButton(
              onPressed: () {},
              child: Text("Add",
                  style: AppTheme.getTextStyle(themeData.textTheme.caption,
                      color: themeData.colorScheme.primary)))
        ],
      ),
    );
  }
}
