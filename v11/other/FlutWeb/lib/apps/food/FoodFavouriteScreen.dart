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
import 'FoodProductScreen.dart';

class FoodFavouriteScreen extends StatefulWidget {
  @override
  _FoodFavouriteScreenState createState() => _FoodFavouriteScreenState();
}

class _FoodFavouriteScreenState extends State<FoodFavouriteScreen> {
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
              elevation: 0,
              backgroundColor: customAppTheme.bgLayer1,
              title: Text(
                "Favorite",
                style: AppTheme.getTextStyle(
                    themeData.textTheme.headline6,
                    color: themeData.colorScheme.onBackground,
                    letterSpacing: 0,
                    fontWeight: 600),
              ),
              centerTitle: true,
            ),
            body: Container(
                color: customAppTheme.bgLayer1,
                child: ListView(
                  padding: Spacing.fromLTRB(8,0,8,16),
                  physics: ClampingScrollPhysics(),
                  children: <Widget>[
                    MyRow(
                      defaultFlex: {
                        ScreenMediaType.XS : 12,
                        ScreenMediaType.SM : 8,
                        ScreenMediaType.MD : 6,
                        ScreenMediaType.XL : 4,
                        ScreenMediaType.XXXXL : 3,
                      },
                      children: [
                        MyCol(child: singleFood(
                            image: './assets/food/dessert-3.jpg',
                            name: 'Dessert',
                            price: 14.99) ),
                        MyCol(child:  singleFood(
                            image: './assets/food/beverage-3.jpg',
                            name: 'Beverage',
                            price: 14.99)),
                        MyCol(child: singleFood(
                            image: './assets/food/food-1.jpg',
                            name: 'Salad dish',
                            price: 16.59)),
                        MyCol(
                          child: singleFood(
                              image: './assets/food/food-2.jpg',
                              name: 'Food dish',
                              price: 29.99),
                        ),
                        MyCol(child: singleFood(
                            image: './assets/food/food-9.jpg',
                            name: 'Pasta',
                            price: 14.99)),
                        MyCol(child: singleFood(
                            image: './assets/food/burger-2.jpg',
                            name: 'Burger',
                            price: 14.99),),
                        MyCol(
                          child: singleFood(
                              image: './assets/food/food-3.jpg',
                              name: 'Pan Cake',
                              price: 24.29),
                        ),
                        MyCol(
                          child: singleFood(
                              image: './assets/food/food-7.jpg',
                              name: 'Salad',
                              price: 14.99),
                        )
                      ],
                    ),
                  ],
                )));
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
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Spacing.height(8),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(name,
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              fontWeight: 600)),
                      Text("\$" + price.toString(),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              fontWeight: 500,
                              letterSpacing: 0))
                    ],
                  ),
                ),
                Icon(
                  MdiIcons.heartOutline,
                  color: themeData.colorScheme.primary,
                  size: 22,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
