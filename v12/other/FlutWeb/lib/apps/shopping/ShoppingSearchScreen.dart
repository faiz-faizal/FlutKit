import 'package:flutkit/style/ScreenMedia.dart';
import 'package:flutkit/utils/Generator.dart';
import 'package:flutkit/utils/SizeConfig.dart';
import 'package:flutkit/style/MyCard.dart';
import 'package:flutkit/style/MyCol.dart';
import 'package:flutkit/style/MyRow.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppNotifier.dart';
import '../../AppTheme.dart';
import 'ShoppingProductScreen.dart';

class ShoppingSearchScreen extends StatefulWidget {
  @override
  _ShoppingSearchScreenState createState() => _ShoppingSearchScreenState();
}

class _ShoppingSearchScreenState extends State<ShoppingSearchScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        backgroundColor: customAppTheme.bgLayer1,
        endDrawer: _EndDrawer(
          scaffoldKey: _scaffoldKey,
        ),
        body: ListView(
          padding: Spacing.fromLTRB(16,24,16,24),
          children: <Widget>[
            Padding(
              padding: Spacing.x(8),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: MyCard(
                      paddingAll: 0,
                      child: TextFormField(
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.subtitle2,
                            letterSpacing: 0,
                            fontWeight: 500),
                        decoration: InputDecoration(
                            hintText: "Search",
                            hintStyle: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                letterSpacing: 0,
                                fontWeight: 500),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                borderSide: BorderSide.none),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: customAppTheme.bgLayer2,
                            hoverColor: customAppTheme.bgLayer2,
                            prefixIcon: Icon(
                              MdiIcons.magnify,
                              size: 20,
                              color: themeData.colorScheme.onBackground
                                  .withAlpha(200),
                            ),
                            contentPadding: Spacing.fromLTRB(30, 14, 30, 14)),
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                  ),
                  Spacing.width(16),
                  MyCard(
                    onTap: () {
                      _scaffoldKey.currentState.openEndDrawer();
                    },
                    borderRadiusAll: 8,
                    paddingAll: 12,
                    bordered: true,
                    child: Icon(
                      MdiIcons.tune,
                      color: themeData.colorScheme.primary,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),
            Spacing.height(16),
            Padding(
              padding: Spacing.x(8),
              child: Text("Result for \"Cosmetics\"",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                      fontWeight: 600)),
            ),
            Spacing.height(16),
            MyRow(
              defaultFlex: {
                ScreenMediaType.XS: 12,
                ScreenMediaType.SM: 8,
                ScreenMediaType.XL: 6,
                ScreenMediaType.XXL: 4
              },
              children: [
                MyCol(
                  child: _ProductListWidget(
                    name: "Yellow cake",
                    image: './assets/images/shopping/product/product-1.jpg',
                    shopName: 'Agus Bakery',
                    star: 4,
                    price: 15000,
                  ),
                ),
                MyCol(
                  child: _ProductListWidget(
                    name: "Cosmic bang",
                    image: './assets/images/shopping/product/product-7.jpg',
                    shopName: 'Den cosmics',
                    star: 4.5,
                    price: 12000,
                  ),
                ),
                MyCol(
                  child: _ProductListWidget(
                    name: "Sweet Gems",
                    image: './assets/images/shopping/product/product-5.jpg',
                    shopName: 'El Primo',
                    star: 3,
                    price: 14700,
                  ),
                ),
                MyCol(
                  child: _ProductListWidget(
                    name: "Lipsticks",
                    image: './assets/images/shopping/product/product-3.jpg',
                    shopName: 'Bee Lipstore',
                    star: 4,
                    price: 14785,
                  ),
                ),
                MyCol(
                  child: _ProductListWidget(
                    name: "Colorful sandal",
                    image: './assets/images/shopping/product/product-8.jpg',
                    shopName: 'Lee Shop',
                    star: 3.8,
                    price: 14780,
                  ),
                ),
                MyCol(
                  child: _ProductListWidget(
                    name: "Toffees",
                    image: './assets/images/shopping/product/product-2.jpg',
                    shopName: 'Toffee Bakery',
                    star: 5,
                    price: 12500,
                  ),
                ),
              ],
            ),
            Spacing.height(24),
            Padding(
              padding: Spacing.x(8),
              child: Text("Similar Products",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                      fontWeight: 600)),
            ),
            Spacing.height(16),
            MyRow(
              defaultFlex: {
                ScreenMediaType.XS: 12,
                ScreenMediaType.SM: 6,
                ScreenMediaType.LG: 4,
                ScreenMediaType.XXL: 3,
              },
              children: [
                MyCol(
                  child: _ProductListWidget(
                    name: "Yellow cake",
                    image: './assets/images/shopping/product/product-10.jpg',
                    shopName: 'Agus Bakery',
                    star: 4,
                    price: 15000,
                  ),
                ),
                MyCol(
                  child: _ProductListWidget(
                    name: "Yellow cake",
                    image: './assets/images/shopping/product/product-3.jpg',
                    shopName: 'Agus Bakery',
                    star: 4,
                    price: 15000,
                  ),
                ),
                MyCol(
                  child: _ProductListWidget(
                    name: "Yellow cake",
                    image: './assets/images/shopping/product/product-4.jpg',
                    shopName: 'Agus Bakery',
                    star: 4,
                    price: 15000,
                  ),
                ),
                MyCol(
                  child: _ProductListWidget(
                    name: "Yellow cake",
                    image: './assets/images/shopping/product/product-6.jpg',
                    shopName: 'Agus Bakery',
                    star: 4,
                    price: 15000,
                  ),
                ),
                MyCol(
                  child: _ProductListWidget(
                    name: "Yellow cake",
                    image: './assets/images/shopping/product/product-9.jpg',
                    shopName: 'Agus Bakery',
                    star: 4,
                    price: 15000,
                  ),
                ),
                MyCol(
                  child: _ProductListWidget(
                    name: "Yellow cake",
                    image: './assets/images/shopping/product/product-1.jpg',
                    shopName: 'Agus Bakery',
                    star: 4,
                    price: 15000,
                  ),
                ),
                MyCol(
                  child: _ProductListWidget(
                    name: "Cosmic bang",
                    image: './assets/images/shopping/product/product-7.jpg',
                    shopName: 'Den cosmics',
                    star: 4.5,
                    price: 12000,
                  ),
                ),
                MyCol(
                  child: _ProductListWidget(
                    name: "Sweet Gems",
                    image: './assets/images/shopping/product/product-5.jpg',
                    shopName: 'El Primo',
                    star: 3,
                    price: 14700,
                  ),
                ),
                MyCol(
                  child: _ProductListWidget(
                    name: "Lipsticks",
                    image: './assets/images/shopping/product/product-3.jpg',
                    shopName: 'Bee Lipstore',
                    star: 4,
                    price: 14785,
                  ),
                ),
                MyCol(
                  child: _ProductListWidget(
                    name: "Colorful sandal",
                    image: './assets/images/shopping/product/product-8.jpg',
                    shopName: 'Lee Shop',
                    star: 3.8,
                    price: 14780,
                  ),
                ),
                MyCol(
                  child: _ProductListWidget(
                    name: "Toffees",
                    image: './assets/images/shopping/product/product-2.jpg',
                    shopName: 'Toffee Bakery',
                    star: 5,
                    price: 12500,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

class _SortDrawerWidget extends StatefulWidget {
  @override
  __SortDrawerWidgetState createState() => __SortDrawerWidgetState();
}

class __SortDrawerWidgetState extends State<_SortDrawerWidget> {
  int _radioValue = 0;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                setState(() {
                  _radioValue = 0;
                });
              },
              child: Row(
                children: <Widget>[
                  Radio(
                    onChanged: (value) {
                      setState(() {
                        _radioValue = 0;
                      });
                    },
                    groupValue: _radioValue,
                    value: 0,
                    visualDensity: VisualDensity.compact,
                    activeColor: themeData.colorScheme.primary,
                  ),
                  Text("Price - ",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle2,
                          fontWeight: 600)),
                  Text("High to Low",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle2,
                          fontWeight: 500)),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _radioValue = 1;
                });
              },
              child: Row(
                children: <Widget>[
                  Radio(
                    onChanged: (value) {
                      setState(() {
                        _radioValue = 1;
                      });
                    },
                    groupValue: _radioValue,
                    value: 1,
                    visualDensity: VisualDensity.compact,
                    activeColor: themeData.colorScheme.primary,
                  ),
                  Text("Price - ",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle2,
                          fontWeight: 600)),
                  Text("Low to High",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle2,
                          fontWeight: 500)),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _radioValue = 2;
                });
              },
              child: Row(
                children: <Widget>[
                  Radio(
                    onChanged: (value) {
                      setState(() {
                        _radioValue = 2;
                      });
                    },
                    groupValue: _radioValue,
                    value: 2,
                    visualDensity: VisualDensity.compact,
                    activeColor: themeData.colorScheme.primary,
                  ),
                  Text("Name - ",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle2,
                          fontWeight: 600)),
                  Text("A to Z",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle2,
                          fontWeight: 500)),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _radioValue = 3;
                });
              },
              child: Row(
                children: <Widget>[
                  Radio(
                    onChanged: (value) {
                      setState(() {
                        _radioValue = 3;
                      });
                    },
                    groupValue: _radioValue,
                    value: 3,
                    visualDensity: VisualDensity.compact,
                    activeColor: themeData.colorScheme.primary,
                  ),
                  Text("Name - ",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle2,
                          fontWeight: 600)),
                  Text("Z to A",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle2,
                          fontWeight: 500)),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _ProductListWidget extends StatefulWidget {
  final String name, image, shopName;
  final double star;
  final int price;

  const _ProductListWidget(
      {Key key,
      @required this.name,
      @required this.image,
      @required this.shopName,
      @required this.star,
      @required this.price})
      : super(key: key);

  @override
  __ProductListWidgetState createState() => __ProductListWidgetState();
}

class __ProductListWidgetState extends State<_ProductListWidget> {
  ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    String key = Generator.randomString(10);
    themeData = Theme.of(context);
    return MyCard(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ShoppingProductScreen(
                      heroTag: key,
                      image: widget.image,
                    )));
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(
                tag: key,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Image.asset(
                    widget.image,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  right: 8,
                  top: 8,
                  child: Icon(
                    MdiIcons.heartOutline,
                    color: themeData.colorScheme.onBackground.withAlpha(160),
                    size: 20,
                  ))
            ],
          ),
          Spacing.height(8),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(widget.name,
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        fontWeight: 700, letterSpacing: 0)),
                Spacing.height(4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Generator.buildRatingStar(
                        rating: widget.star,
                        size: 16,
                        activeColor: Color(0xffffd208),
                        inactiveColor: themeData.colorScheme.onBackground),
                    Spacing.width(4),
                    Text(widget.star.toString(),
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            fontWeight: 600)),
                  ],
                ),
                Spacing.height(4),
                Container(
                  child: Text(
                    "\$ " + widget.price.toString(),
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                        fontWeight: 700, letterSpacing: 0),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EndDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const _EndDrawer({Key key, @required this.scaffoldKey}) : super(key: key);

  @override
  __EndDrawerState createState() => __EndDrawerState();
}

class __EndDrawerState extends State<_EndDrawer> {
  ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Container(
      width: 300,
      padding: Spacing.all(16),
      color: themeData.backgroundColor,
      child: ListView(
        children: <Widget>[
          Center(
            child: Text(
              "FILTER",
              style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                  fontWeight: 700, color: themeData.colorScheme.primary),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Spacing.height(16),
              _CategoryDrawerWidget(),
              Spacing.height(16),
              Text(
                "Rating",
                style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                    fontWeight: 600, letterSpacing: 0),
              ),
              Spacing.height(8),
              _RatingDrawerWidget(),
              Spacing.height(16),
              Text(
                "Price Range",
                style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                    fontWeight: 600, letterSpacing: 0),
              ),
              _PriceRangeDrawerWidget(),
              Spacing.height(24),
              Text(
                "Sort",
                style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                    fontWeight: 600, letterSpacing: 0),
              ),
              Spacing.height(8),
              _SortDrawerWidget(),
              Spacing.height(24),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          Spacing.fromLTRB(36, 12, 36, 12))),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "APPLY",
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                        fontWeight: 600,
                        color: themeData.colorScheme.onPrimary,
                        letterSpacing: 0.3),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _CategoryDrawerWidget extends StatefulWidget {
  final List<String> reportList = [
    "Men",
    "Women",
    "Sale",
    "Food",
    "Other",
  ];

  @override
  _CategoryDrawerWidgetState createState() => _CategoryDrawerWidgetState();
}

class _CategoryDrawerWidgetState extends State<_CategoryDrawerWidget> {
  List<String> selectedChoices = ["Women", "Food"];

  ThemeData themeData;

  _buildChoiceList() {
    List<Widget> choices = [];
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: Spacing.all(4),
        child: ChoiceChip(
          backgroundColor: themeData.colorScheme.background,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          selectedColor: themeData.colorScheme.primary,
          label: Text(item,
              style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                  color: selectedChoices.contains(item)
                      ? themeData.colorScheme.onSecondary
                      : themeData.colorScheme.onBackground,
                  fontWeight: selectedChoices.contains(item) ? 700 : 500)),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}

class _RatingDrawerWidget extends StatefulWidget {
  @override
  _RatingDrawerWidgetState createState() => _RatingDrawerWidgetState();
}

class _RatingDrawerWidgetState extends State<_RatingDrawerWidget> {
  List<bool> _star = [false, true, true, true, true];

  ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    List<Widget> widgets = [];
    for(int index=_star.length-1;index>=0;index--){
      widgets.add(InkWell(
        onTap: () {
          setState(() {
            _star[index] = !_star[index];
          });
        },
        child: Row(
          children: <Widget>[
            Checkbox(
              visualDensity: VisualDensity.compact,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: _star[index],
              activeColor: themeData.colorScheme.primary,
              onChanged: (bool value) {
                setState(() {
                  _star[index] = value;
                });
              },
            ),
            Container(
                child: Generator.buildRatingStar(
                    rating: (index + 1).toDouble(),
                    inactiveColor: themeData.colorScheme.onBackground))
          ],
        ),
      ));
    }


    themeData = Theme.of(context);
    return Column(children: widgets,);
  }
}

class _PriceRangeDrawerWidget extends StatefulWidget {
  @override
  _PriceRangeDrawerWidgetState createState() => _PriceRangeDrawerWidgetState();
}

class _PriceRangeDrawerWidgetState extends State<_PriceRangeDrawerWidget> {
  double _starValue = 10;
  double _endValue = 80;
  double _multiFactor = 1500;
  ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Column(
      children: <Widget>[
        SliderTheme(
          data: SliderThemeData(
            trackHeight: 3,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6.0),
          ),
          child: RangeSlider(
            values: RangeValues(_starValue, _endValue),
            min: 0.0,
            max: 100.0,
            onChanged: (values) {
              setState(() {
                _starValue = values.start.roundToDouble();
                _endValue = values.end.roundToDouble();
              });
            },
          ),
        ),
        Text(
          (_starValue * _multiFactor).floor().toString() +
              " - " +
              (_endValue * _multiFactor).floor().toString(),
          style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
              fontWeight: 500),
        )
      ],
    );
  }
}
