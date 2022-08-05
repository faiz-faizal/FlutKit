
import '../../utils/Generator.dart';

import '../../utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppNotifier.dart';
import '../../AppTheme.dart';

class ShoppingProductScreen extends StatefulWidget {
  final String heroTag,image;

  const ShoppingProductScreen({Key key, this.heroTag = "heroTag", this.image='./assets/images/shopping/product/product-3.jpg'})
      : super(key: key);

  @override
  _ShoppingProductScreenState createState() => _ShoppingProductScreenState();
}

class _ShoppingProductScreenState extends State<ShoppingProductScreen>
    with SingleTickerProviderStateMixin {

  int themeType;
  ThemeData themeData;
  CustomAppTheme customAppTheme;


  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget child) {
        themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: SafeArea(
              child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: customAppTheme.bgLayer1 ,
                    elevation: 0,
                    leading: InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Icon(MdiIcons.chevronLeft),
                    ),
                    title: Text("Febreze AIR",
                        style: AppTheme.getTextStyle(
                            themeData.appBarTheme.textTheme.headline6,
                            fontWeight: 600)),
                    actions: <Widget>[
                      Container(
                          margin: EdgeInsets.only(right: 16),
                          child: Icon(MdiIcons.heartOutline, size: 22))
                    ],
                  ),
                  backgroundColor: customAppTheme.bgLayer1,
                  body: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 24),
                          child: Center(
                            child: Hero(
                              tag: widget.heroTag,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                child: Image.asset(
                                  widget.image,
                                  width: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 24),
                              child: Text(
                                "Rs. 1,500.00",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.headline6,
                                    fontWeight: 600,
                                    letterSpacing: 0),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 16),
                                child: Text(
                                  "Febreze AIR (blue edison)",
                                  style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    fontWeight: 500,
                                  ),
                                )),
                            Container(
                              margin: EdgeInsets.only(top: 16),
                              child: Generator.buildRatingStar(
                                  rating: 4.5, spacing: 4, size: 24),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 8),
                              padding: EdgeInsets.only(
                                  top: 4, bottom: 4, left: 12, right: 12),
                              decoration: BoxDecoration(
                                  color: Generator.starColor.withAlpha(32),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(16))),
                              child: Text("4.5 (27)",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      color: Generator.starColor)),
                            )
                          ],
                        ),
                        Spacing.height(32),
                        ElevatedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(Spacing.xy(30,16))
                          ),
                          onPressed: () {

                          },
                          child: Text(
                            "BUY NOW",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                fontWeight: 600,
                                color: themeData.colorScheme.onPrimary,
                                letterSpacing: 0.3),
                          ),
                        ),
                        Spacing.height(16),
                        TextButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(Spacing.xy(30,16))
                          ),
                          onPressed: () {

                          },
                          child: Text(
                            "ADD TO CART",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.caption,
                                fontWeight: 600,
                                color: themeData.colorScheme.primary,
                                letterSpacing: 0),
                          ),
                        ),
                      ],
                    ),
                  )),
            ));
      },
    );
  }
}
