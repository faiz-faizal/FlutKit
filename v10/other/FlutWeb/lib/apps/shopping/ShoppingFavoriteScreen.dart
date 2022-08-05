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

class ShoppingFavoriteScreen extends StatefulWidget {

  @override
  _ShoppingFavoriteScreenState createState() =>
      _ShoppingFavoriteScreenState();
}

class _ShoppingFavoriteScreenState extends State<ShoppingFavoriteScreen>
    with SingleTickerProviderStateMixin {
  //ThemeData
  ThemeData themeData;
  CustomAppTheme customAppTheme;
  int themeType;

  ScrollController _scrollController;
  AnimationController _hideFabAnimController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _hideFabAnimController = AnimationController(
      vsync: this,
      duration: Duration(microseconds: 200),
      value: 1,
    );

    _scrollController.addListener(() {
      switch (_scrollController.position.userScrollDirection) {
        case ScrollDirection.forward:
          _hideFabAnimController.forward();
          break;
        case ScrollDirection.reverse:
          _hideFabAnimController.reverse();
          break;
        case ScrollDirection.idle:
          break;
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _hideFabAnimController.dispose();
    super.dispose();
  }

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
        backgroundColor: customAppTheme.bgLayer1,
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
            "Favorites",
            style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                color: themeData.colorScheme.onBackground, fontWeight: 600),
          ),
        ),
        floatingActionButton: FadeTransition(
          opacity: _hideFabAnimController,
          child: ScaleTransition(
            scale: _hideFabAnimController,
            child: Theme(
              data: themeData.copyWith(
                  highlightColor: themeData.colorScheme.primaryVariant),
              child: FloatingActionButton.extended(
                label: Text(
                  "Create List",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                      color: themeData.colorScheme.onPrimary,
                      fontWeight: 600,
                      letterSpacing: 0.8),
                ),
                onPressed: () {},
                icon: Icon(
                  MdiIcons.plus,
                  color: themeData.colorScheme.onPrimary,
                ),
                backgroundColor: themeData.colorScheme.primary,
                splashColor: Colors.white.withAlpha(100),
              ),
            ),
          ),
        ),
        body: ListView(
          controller: _scrollController,
          padding: Spacing.fromLTRB(8, 0,8,16),
          children: <Widget>[
            MyRow(
              defaultFlex: {
                ScreenMediaType.MD: 12,
                ScreenMediaType.LG: 8,
                ScreenMediaType.XXXL: 6,
              },
              children: <MyCol>[
                MyCol(
                  child: MyContainer(
                    paddingAll: 16,
                    borderRadiusAll: 4,
                    bordered: true,
                    color: customAppTheme.bgLayer2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "List 1",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.headline6,
                                  fontWeight: 700,
                                  letterSpacing: -0.2,
                                  muted: true),
                            ),
                            TextButton(onPressed: (){}, child: Text(
                              "Remove",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.caption,
                                  fontSize: 12,
                                  color: themeData.colorScheme.primary,
                                  fontWeight: 500,
                                  letterSpacing: 0),
                            ))

                          ],
                        ),
                        Spacing.height(8),
                        Column(
                          children: [
                            singleProduct(
                                name: "Cup Cake",
                                price: 35.79,
                                image:
                                    './assets/images/shopping/product/product-1.jpg'),
                            singleProduct(
                                name: "Roll",
                                price: 45.89,
                                image:
                                    './assets/images/shopping/product/product-2.jpg'),
                            singleProduct(
                                name: "Biscuit",
                                price: 14.29,
                                image:
                                    './assets/images/shopping/product/product-3.jpg')
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                MyCol(
                  child: MyContainer(
                    paddingAll: 16,
                    borderRadiusAll: 4,
                    bordered: true,
                    color: customAppTheme.bgLayer2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "List 2",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.headline6,
                                  fontWeight: 700,
                                  letterSpacing: -0.2,
                                  muted: true),
                            ),
                            TextButton(onPressed: (){}, child: Text(
                              "Remove",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.caption,
                                  fontSize: 12,
                                  color: themeData.colorScheme.primary,
                                  fontWeight: 500,
                                  letterSpacing: 0),
                            ))
                          ],
                        ),
                        Spacing.height(8),
                        Column(
                          children: [
                            singleProduct(
                                name: "Unsought",
                                price: 17.89,
                                image:
                                    './assets/images/shopping/product/product-5.jpg'),
                            singleProduct(
                                name: "Roll",
                                price: 25.89,
                                image:
                                    './assets/images/shopping/product/product-8.jpg'),
                            singleProduct(
                                name: "Biscuit",
                                price: 89.29,
                                image:
                                    './assets/images/shopping/product/product-7.jpg'),
                            singleProduct(
                                name: "Toy Car",
                                price: 89.29,
                                image:
                                    './assets/images/shopping/product/product-9.jpg'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                MyCol(
                  child: MyContainer(
                    paddingAll: 16,
                    borderRadiusAll: 4,
                    bordered: true,
                    color: customAppTheme.bgLayer2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "List 3",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.headline6,
                                  fontWeight: 700,
                                  letterSpacing: -0.2,
                                  muted: true),
                            ),
                            TextButton(onPressed: (){}, child: Text(
                              "Remove",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.caption,
                                  fontSize: 12,
                                  color: themeData.colorScheme.primary,
                                  fontWeight: 500,
                                  letterSpacing: 0),
                            ))
                          ],
                        ),
                        Spacing.height(8),
                        Column(
                          children: [
                            singleProduct(
                                name: "Unsought",
                                price: 17.89,
                                image:
                                    './assets/images/shopping/product/product-10.jpg'),
                            singleProduct(
                                name: "Roll",
                                price: 25.89,
                                image:
                                    './assets/images/shopping/product/product-11.jpg')
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                MyCol(
                  child: MyContainer(
                    paddingAll: 16,
                    borderRadiusAll: 4,
                    bordered: true,
                    color: customAppTheme.bgLayer2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "List 4",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.headline6,
                                  fontWeight: 700,
                                  letterSpacing: -0.2,
                                  muted: true),
                            ),
                            TextButton(onPressed: (){}, child: Text(
                              "Remove",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.caption,
                                  fontSize: 12,
                                  color: themeData.colorScheme.primary,
                                  fontWeight: 500,
                                  letterSpacing: 0),
                            ))

                          ],
                        ),
                        Spacing.height(8),
                        Column(
                          children: [
                            singleProduct(
                                name: "Roll",
                                price: 25.89,
                                image:
                                './assets/images/shopping/product/product-8.jpg'), singleProduct(
                                name: "Roll",
                                price: 45.89,
                                image:
                                './assets/images/shopping/product/product-2.jpg'),
                            singleProduct(
                                name: "Biscuit",
                                price: 89.29,
                                image:
                                './assets/images/shopping/product/product-7.jpg'),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget singleProduct({String image, String name, double price}) {
    List<String> _textIconChoice = ["Remove", "Other"];

    return Container(

      margin: Spacing.y(8),
      child: Row(
        children: <Widget>[
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Image.asset(
                image,
                height: 52,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Spacing.width(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                      letterSpacing: -0.3, fontWeight: 600),
                ),
                Spacing.height(4),
                Text("\$$price",
                    style: AppTheme.getTextStyle(
                        themeData.textTheme.bodyText2,
                        letterSpacing: -0.3,
                        muted: true,
                        fontWeight: 600)),
              ],
            ),
          ),
          Container(
            child: PopupMenuButton(

              padding: EdgeInsets.all(0),
              itemBuilder: (BuildContext context) {
                return _textIconChoice.map((String choice) {
                  return PopupMenuItem(
                    value: choice,
                    child: Text(choice,
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.button,
                            fontWeight: 500)),
                  );
                }).toList();
              },
              icon: Icon(MdiIcons.dotsVertical,
                  color: themeData.colorScheme.onBackground),
              color: customAppTheme.bgLayer1,
            ),
          )
        ],
      ),
    );
  }
}
