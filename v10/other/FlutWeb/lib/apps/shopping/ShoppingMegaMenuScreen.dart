import 'package:flutkit/style/MyCol.dart';
import 'package:flutkit/style/MyRow.dart';
import 'package:flutkit/style/ScreenMedia.dart';
import 'package:flutkit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppNotifier.dart';
import '../../AppTheme.dart';

class ShoppingMegaMenuScreen extends StatefulWidget {
  @override
  _ShoppingMegaMenuScreenState createState() => _ShoppingMegaMenuScreenState();
}

class _ShoppingMegaMenuScreenState extends State<ShoppingMegaMenuScreen> {
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
            "Mega Menu",
            style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                color: themeData.colorScheme.onBackground, fontWeight: 600),
          ),
        ),
        body: Container(
          color: customAppTheme.bgLayer1,
          child: ListView(
            padding: Spacing.fromLTRB(8,0,8, 16),
            children: <Widget>[
              MyRow(
                defaultFlex: {
                  ScreenMediaType.XS: 12,
                  ScreenMediaType.MD: 8,
                  ScreenMediaType.LG: 6,
                  ScreenMediaType.XL: 4,
                  ScreenMediaType.XXXL: 3,
                },
                children: <MyCol> [
                  MyCol(
                    child: singleItem(
                        image: './assets/images/shopping/vector/tshirt.png',
                        title: "Top wear",
                        listItem: [
                          "Formal shirts",
                          "Casual t-shirts",
                          "Suits \& Blazers"
                        ]),
                  ),
                  MyCol(
                    child: singleItem(
                        image: './assets/images/shopping/vector/dress.png',
                        title: "Dress",
                        listItem: [
                          "Balloon Dress",
                          "Cocktail Dress",
                          "Denim Dress"
                        ]),
                  ),
                  MyCol(
                    child: singleItem(
                        image: './assets/images/shopping/vector/shoes.png',
                        title: "Shoes",
                        listItem: [
                          "Sports Shoes",
                          "Casual Shoes",
                          "Formal Shoes"
                        ]),
                  ),
                  MyCol(
                    child: singleItem(
                        image: './assets/images/shopping/vector/laptop.png',
                        title: "Laptop",
                        listItem: ["Ultrabook", "Chromebook", "Macbook"]),
                  ),
                  MyCol(
                    child: singleItem(
                        image: './assets/images/shopping/vector/headphone.png',
                        title: "Headphone",
                        listItem: ["On Ear", "Over Ear", "Earbuds"]),
                  ),
                  MyCol(
                    child: singleItem(
                        image: './assets/images/shopping/vector/mobile.png',
                        title: "Mobile",
                        listItem: [
                          "Xiaomi",
                          "Samsung",
                          "Apple",
                        ]),
                  ),
                  MyCol(
                    child: singleItem(
                        image: './assets/images/shopping/vector/watch.png',
                        title: "Watches",
                        listItem: ["Titan", "Fast Track", "Fossil"]),
                  ),
                ],
              ),
            ],
          ),
        ));
  }




  Widget buildListItem(List<String> listItem) {
    List<Widget> list = [];

    for (int i = 0; i < listItem.length; i++) {
      list.add(Container(
        margin: Spacing.bottom(2),
        child: Text(
          listItem[i],
          style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
              color: themeData.colorScheme.onBackground,
              fontWeight: 500,
              letterSpacing: 0.2),
        ),
      ));
    }

    list.add(Container(
      margin: Spacing.bottom(2),
      child: Text(
        "More ...",
        style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
            color: themeData.colorScheme.primary,
            fontWeight: 500,
            letterSpacing: 0.2),
      ),
    ));

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: list,
    );
  }

  Widget singleItem({String image, String title, List<String> listItem}) {
    return Container(
      padding: Spacing.all(16),
      decoration: BoxDecoration(
          color: customAppTheme.bgLayer1,
         border: Border.all(color: customAppTheme.border2,width: 1),
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Image(
                image: AssetImage(image),
                height:24,
                width: 24,
                color: themeData.colorScheme.primary,
              ),
              Container(
                margin: Spacing.left(8),
                child: Text(
                  title,
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                      color: themeData.colorScheme.primary,
                      fontWeight: 600,
                      letterSpacing: 0.2),
                ),
              )
            ],
          ),
          Container(
              margin: Spacing.fromLTRB(32,8,0,0),
              child: buildListItem(listItem))
        ],
      ),
    );
  }
}
