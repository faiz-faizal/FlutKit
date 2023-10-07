import 'package:flutkit/full_apps/other/shopping/product_screen.dart';
import 'package:flutkit/full_apps/other/shopping/product_search_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/generator.dart';
import 'package:flutkit/helpers/widgets/my_card.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ShoppingSearchScreen extends StatefulWidget {
  @override
  _ShoppingSearchScreenState createState() => _ShoppingSearchScreenState();
}

class _ShoppingSearchScreenState extends State<ShoppingSearchScreen>
    with SingleTickerProviderStateMixin {
  double findAspectRatio(double width) {
    //Logic for aspect ratio of grid view
    return (width / 2 - 24) / ((width / 2 - 24) + 66);
  }

  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: ListView(
          physics: ClampingScrollPhysics(),
          padding: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
          children: <Widget>[
            Container(
              padding: MySpacing.nTop(16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: MyContainer(
                      // color: theme.scaffoldBackgroundColor,
                      borderRadiusAll: 4,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                              return ProductsSearchScreen();
                            },
                            fullscreenDialog: true));
                      },
                      paddingAll: 12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            LucideIcons.search,
                            color: theme.colorScheme.primary,
                            size: 20,
                          ),
                          Container(
                            margin: MySpacing.left(8),
                            child: MyText.titleSmall("Search",
                                fontWeight: 600, letterSpacing: 0),
                          )
                        ],
                      ),
                    ),
                  ),
                  MySpacing.width(12),
                  Expanded(
                    child: MyContainer(
                      borderRadiusAll: 4,
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext buildContext) {
                              return SortBottomSheet();
                            });
                      },
                      margin: MySpacing.x(4),
                      padding: MySpacing.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            LucideIcons.arrowUpDown,
                            color: theme.colorScheme.primary,
                            size: 20,
                          ),
                          MySpacing.width(8),
                          MyText.titleSmall("Sort",
                              fontWeight: 600, letterSpacing: 0)
                        ],
                      ),
                    ),
                  ),
                  MySpacing.width(12),
                  Expanded(
                    child: MyContainer(
                      borderRadiusAll: 4,
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext buildContext) {
                              return FilterBottomSheet();
                            });
                      },
                      padding: MySpacing.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            LucideIcons.slidersHorizontal,
                            color: theme.colorScheme.primary,
                            size: 22,
                          ),
                          MySpacing.width(8),
                          MyText.titleSmall("Filter",
                              fontWeight: 600, letterSpacing: 0)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GridView.count(
                padding: MySpacing.nTop(16),
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio:
                    findAspectRatio(MediaQuery.of(context).size.width),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: <Widget>[
                  _ProductListWidget(
                    name: "Yellow cake",
                    image:
                        './assets/images/apps/shopping/product/product-1.jpg',
                    shopName: 'Agus Bakery',
                    star: 4,
                    price: 39.99,
                    rootContext: context,
                  ),
                  _ProductListWidget(
                    name: "Cosmic bang",
                    image:
                        './assets/images/apps/shopping/product/product-7.jpg',
                    shopName: 'Den cosmics',
                    star: 4.5,
                    price: 49.59,
                    rootContext: context,
                  ),
                  _ProductListWidget(
                    name: "Sweet Gems",
                    image:
                        './assets/images/apps/shopping/product/product-5.jpg',
                    shopName: 'El Primo',
                    star: 3,
                    price: 29.59,
                    rootContext: context,
                  ),
                  _ProductListWidget(
                    name: "Lipsticks",
                    image:
                        './assets/images/apps/shopping/product/product-3.jpg',
                    shopName: 'Bee Lipstore',
                    star: 4,
                    price: 19.99,
                    rootContext: context,
                  ),
                  _ProductListWidget(
                    name: "Colorful sandal",
                    image:
                        './assets/images/apps/shopping/product/product-8.jpg',
                    shopName: 'Lee Shop',
                    star: 3.8,
                    price: 24.49,
                    rootContext: context,
                  ),
                  _ProductListWidget(
                    name: "Toffees",
                    image:
                        './assets/images/apps/shopping/product/product-2.jpg',
                    shopName: 'Toffee Bakery',
                    star: 5,
                    price: 89.99,
                    rootContext: context,
                  ),
                ]),
          ],
        ));
  }
}

class FilterBottomSheet extends StatefulWidget {
  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  bool colorBlack = false,
      colorRed = true,
      colorOrange = false,
      colorTeal = true,
      colorPurple = false;

  bool sizeXS = false,
      sizeS = true,
      sizeM = false,
      sizeL = true,
      sizeXL = false;

  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: customTheme.card,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      padding: MySpacing.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: Center(
                      child: MyText.bodyLarge("Filter", fontWeight: 700))),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    padding: MySpacing.all(8),
                    decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.all(Radius.circular(22))),
                    child: Icon(
                      LucideIcons.check,
                      size: 20,
                      color: theme.colorScheme.onPrimary,
                    )),
              )
            ],
          ),
          MySpacing.height(8),
          MyText.titleSmall("Type", fontWeight: 600, letterSpacing: 0),
          _TypeChipWidget(),
          MySpacing.height(8),
          MyText.titleSmall("Color", fontWeight: 600, letterSpacing: 0),
          MySpacing.height(16),
          Row(
            children: <Widget>[
              InkWell(
                  onTap: () {
                    setState(() {
                      colorBlack = !colorBlack;
                    });
                  },
                  child: colorWidget(color: Colors.black, checked: colorBlack)),
              MySpacing.width(8),
              InkWell(
                onTap: () {
                  setState(() {
                    colorRed = !colorRed;
                  });
                },
                child: colorWidget(color: Colors.red, checked: colorRed),
              ),
              MySpacing.width(8),
              InkWell(
                onTap: () {
                  setState(() {
                    colorOrange = !colorOrange;
                  });
                },
                child: colorWidget(color: Colors.orange, checked: colorOrange),
              ),
              MySpacing.width(8),
              InkWell(
                onTap: () {
                  setState(() {
                    colorTeal = !colorTeal;
                  });
                },
                child: colorWidget(color: Colors.teal, checked: colorTeal),
              ),
              MySpacing.width(8),
              InkWell(
                onTap: () {
                  setState(() {
                    colorPurple = !colorPurple;
                  });
                },
                child: colorWidget(color: Colors.purple, checked: colorPurple),
              ),
            ],
          ),
          MySpacing.height(16),
          MyText.titleSmall("Size", fontWeight: 600, letterSpacing: 0),
          MySpacing.height(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    sizeXS = !sizeXS;
                  });
                },
                child: SingleSizeWidget(size: "XS", isSelected: sizeXS),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sizeS = !sizeS;
                  });
                },
                child: SingleSizeWidget(size: "S", isSelected: sizeS),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sizeM = !sizeM;
                  });
                },
                child: SingleSizeWidget(size: "M", isSelected: sizeM),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sizeL = !sizeL;
                  });
                },
                child: SingleSizeWidget(size: "L", isSelected: sizeL),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sizeXL = !sizeXL;
                  });
                },
                child: SingleSizeWidget(size: "XL", isSelected: sizeXL),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget colorWidget({Color? color, bool checked = true}) {
    return MyContainer.none(
      width: 36,
      height: 36,
      color: color,
      borderRadiusAll: 18,
      child: checked
          ? Center(
              child: Icon(
                LucideIcons.check,
                color: Colors.white,
                size: 20,
              ),
            )
          : Container(),
    );
  }
}

class SingleSizeWidget extends StatefulWidget {
  final String size;
  final bool isSelected;

  const SingleSizeWidget(
      {Key? key, required this.size, required this.isSelected})
      : super(key: key);

  @override
  _SingleSizeWidgetState createState() => _SingleSizeWidgetState();
}

class _SingleSizeWidgetState extends State<SingleSizeWidget> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return MyCard(
      width: 44,
      height: 44,
      paddingAll: 0,
      bordered: !widget.isSelected,
      border: Border.all(color: customTheme.border, width: 1.6),
      color: widget.isSelected
          ? themeData.colorScheme.primary
          : Colors.transparent,
      child: Center(
        child: MyText(widget.size.toString(),
            letterSpacing: -0.2,
            fontWeight: 700,
            color: widget.isSelected
                ? themeData.colorScheme.onPrimary
                : themeData.colorScheme.onBackground),
      ),
    );
  }
}

class _TypeChipWidget extends StatefulWidget {
  final List<String> typeList = ["Man", "Woman", "Shoes", "Sale"];

  @override
  _TypeChipWidgetState createState() => _TypeChipWidgetState();
}

class _TypeChipWidgetState extends State<_TypeChipWidget> {
  List<String> selectedChoices = ["Man"];
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  _buildChoiceList() {
    List<Widget> choices = [];
    for (var item in widget.typeList) {
      choices.add(Container(
        padding: MySpacing.all(8),
        child: ChoiceChip(
          backgroundColor: customTheme.card,
          materialTapTargetSize: MaterialTapTargetSize.padded,
          selectedColor: theme.colorScheme.primary,
          label: MyText.bodyMedium(item,
              color: selectedChoices.contains(item)
                  ? theme.colorScheme.onSecondary
                  : theme.colorScheme.onBackground,
              fontWeight: selectedChoices.contains(item) ? 700 : 600),
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
    }
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}

class SortBottomSheet extends StatefulWidget {
  @override
  _SortBottomSheetState createState() => _SortBottomSheetState();
}

class _SortBottomSheetState extends State<SortBottomSheet> {
  int _radioValue = 0;
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        padding: MySpacing.xy(24, 16),
        decoration: BoxDecoration(
            color: customTheme.card,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            MySpacing.height(8),
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
                        onChanged: (dynamic value) {
                          setState(() {
                            _radioValue = 0;
                          });
                        },
                        groupValue: _radioValue,
                        value: 0,
                        visualDensity: VisualDensity.compact,
                        activeColor: theme.colorScheme.primary,
                      ),
                      MyText.titleSmall("Price - ", fontWeight: 60),
                      MyText.titleSmall("High to Low"),
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
                        onChanged: (dynamic value) {
                          setState(() {
                            _radioValue = 1;
                          });
                        },
                        groupValue: _radioValue,
                        value: 1,
                        visualDensity: VisualDensity.compact,
                        activeColor: theme.colorScheme.primary,
                      ),
                      MyText.titleSmall("Price - ", fontWeight: 600),
                      MyText.titleSmall("Low to High"),
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
                        onChanged: (dynamic value) {
                          setState(() {
                            _radioValue = 2;
                          });
                        },
                        groupValue: _radioValue,
                        value: 2,
                        visualDensity: VisualDensity.compact,
                        activeColor: theme.colorScheme.primary,
                      ),
                      MyText.titleSmall("Name - ", fontWeight: 600),
                      MyText.titleSmall("A to Z"),
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
                        onChanged: (dynamic value) {
                          setState(() {
                            _radioValue = 3;
                          });
                        },
                        groupValue: _radioValue,
                        value: 3,
                        visualDensity: VisualDensity.compact,
                        activeColor: theme.colorScheme.primary,
                      ),
                      MyText.titleSmall("Name - ", fontWeight: 600),
                      MyText.titleSmall("Z to A"),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _ProductListWidget extends StatefulWidget {
  final String name, image, shopName;
  final double star;
  final double price;
  final BuildContext rootContext;

  const _ProductListWidget(
      {Key? key,
      required this.name,
      required this.image,
      required this.shopName,
      required this.star,
      required this.price,
      required this.rootContext})
      : super(key: key);

  @override
  __ProductListWidgetState createState() => __ProductListWidgetState();
}

class __ProductListWidgetState extends State<_ProductListWidget> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    String key = Generator.randomString(10);
    return MyContainer(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      padding: MySpacing.bottom(8),
      borderRadiusAll: 4,
      onTap: () {
        Navigator.push(
            widget.rootContext,
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
                child: Image.asset(
                  widget.image,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  right: 8,
                  top: 8,
                  child: Icon(
                    LucideIcons.heart,
                    color: theme.colorScheme.primary,
                    size: 20,
                  ))
            ],
          ),
          Container(
            padding: MySpacing.nBottom(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MyText.titleSmall(widget.name, fontWeight: 500),
                MySpacing.height(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    MyText("\$ ${widget.price}", fontWeight: 700),
                    MyContainer(
                      borderRadiusAll: 4,
                      color: theme.colorScheme.primary,
                      paddingAll: 6,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            LucideIcons.star,
                            color: theme.colorScheme.onPrimary,
                            size: 12,
                          ),
                          MySpacing.width(4),
                          MyText.labelSmall(widget.star.toString(),
                              color: theme.colorScheme.onPrimary,
                              fontWeight: 600),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
