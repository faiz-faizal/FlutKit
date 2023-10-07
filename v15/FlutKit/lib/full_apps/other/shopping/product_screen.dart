import 'package:flutkit/full_apps/other/shopping/checkout_screen.dart';
import 'package:flutkit/full_apps/other/shopping/product_review_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/generator.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_progress_bar.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ShoppingProductScreen extends StatefulWidget {
  final String heroTag, image;

  const ShoppingProductScreen(
      {Key? key,
      this.heroTag = "heroTag",
      this.image = './assets/product/product-5.jpg'})
      : super(key: key);

  @override
  _ShoppingProductScreenState createState() => _ShoppingProductScreenState();
}

class _ShoppingProductScreenState extends State<ShoppingProductScreen>
    with SingleTickerProviderStateMixin {
  String descText = Generator.getDummyText(6);

  int selectedSize = 7;

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
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              LucideIcons.chevronLeft,
              size: 20,
              color: theme.colorScheme.onBackground,
            ),
          ),
          title: MyText.titleMedium("Febreze AIR", fontWeight: 600),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      child: Image.asset(
                        widget.image,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    MySpacing.height(20),
                    MyText.bodyLarge("Febreze AIR",
                        fontWeight: 600, letterSpacing: 0.2),
                    MySpacing.height(8),
                    MyText.bodySmall(descText,
                        fontWeight: 400, letterSpacing: 0),
                    MySpacing.height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        MyProgressBar(
                            width: 100,
                            height: 5,
                            activeColor: theme.colorScheme.primary,
                            inactiveColor:
                                theme.colorScheme.onBackground.withAlpha(100),
                            progress: 0.6),
                        MySpacing.width(20),
                        MyText.bodySmall("123 Items",
                            fontWeight: 500, height: 1),
                      ],
                    ),
                    Container(
                      margin: MySpacing.top(32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          MyContainer.bordered(
                            onTap: () {
                              _selectSizeSheet(context);
                            },
                            borderRadiusAll: 4,
                            width: 150,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  LucideIcons.scaling,
                                  color: theme.colorScheme.onBackground,
                                  size: 24,
                                ),
                                MySpacing.width(8),
                                MyText.bodyLarge(
                                  "Change",
                                  fontWeight: 600,
                                  letterSpacing: -0.2,
                                )
                              ],
                            ),
                          ),
                          MySpacing.width(20),
                          MyContainer.bordered(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ShoppingProductReviewScreen()));
                            },
                            borderRadiusAll: 4,
                            width: 150,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  LucideIcons.messageSquareDashed,
                                  color: theme.colorScheme.onBackground,
                                  size: 24,
                                ),
                                MySpacing.width(8),
                                MyText.titleSmall(
                                  "Review",
                                  fontWeight: 600,
                                  letterSpacing: -0.2,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            MyContainer.bordered(
              paddingAll: 24,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            MyText.bodyMedium(
                              "Color".toUpperCase(),
                              fontWeight: 600,
                              xMuted: true,
                            ),
                            MySpacing.height(8),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      shape: BoxShape.circle),
                                ),
                                MySpacing.width(4),
                                Icon(
                                  LucideIcons.chevronDown,
                                  size: 20,
                                  color: theme.colorScheme.onBackground
                                      .withAlpha(200),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            MyText.bodyMedium(
                              "QTY",
                              xMuted: true,
                              fontWeight: 600,
                            ),
                            MySpacing.height(8),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                MyText.titleMedium("2", fontWeight: 600),
                                MySpacing.width(4),
                                Icon(
                                  LucideIcons.chevronDown,
                                  size: 20,
                                  color: theme.colorScheme.onBackground
                                      .withAlpha(200),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  MySpacing.height(24),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: MyButton(
                          elevation: 0,
                          padding: MySpacing.y(20),
                          borderRadiusAll: 4,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                LucideIcons.packagePlus,
                                color: theme.colorScheme.onPrimary,
                                size: 20,
                              ),
                              MySpacing.width(4),
                              MyText.bodyLarge(
                                "\$39.99",
                                letterSpacing: 0.4,
                                color: theme.colorScheme.onPrimary,
                                fontWeight: 600,
                              )
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ShoppingCheckoutScreen()));
                          },
                        ),
                      ),
                      MySpacing.width(20),
                      MyContainer(
                        padding: MySpacing.xy(12, 12),
                        borderRadiusAll: 4,
                        color: theme.colorScheme.primary.withAlpha(40),
                        child: Icon(
                          LucideIcons.shoppingCart,
                          size: 24,
                          color: theme.colorScheme.primary,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }

  void _selectSizeSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return MyContainer(
                padding: MySpacing.xy(32, 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Center(
                                child: MyText.bodyLarge("Select a Sizes",
                                    fontWeight: 700))),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: MyContainer.rounded(
                              paddingAll: 8,
                              color: customTheme.card,
                              child: Icon(
                                LucideIcons.x,
                                size: 20,
                                color: theme.colorScheme.onBackground,
                              )),
                        )
                      ],
                    ),
                    MySpacing.height(32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = 4;
                            });
                          },
                          child: SingleSizeWidget(
                            size: 4,
                            isSelected: selectedSize == 4,
                          ),
                        ),
                        SingleSizeWidget(
                          size: 5,
                          isAvailable: false,
                          isSelected: selectedSize == 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = 6;
                            });
                          },
                          child: SingleSizeWidget(
                            size: 6,
                            isSelected: selectedSize == 6,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = 7;
                            });
                          },
                          child: SingleSizeWidget(
                            size: 7,
                            isSelected: selectedSize == 7,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = 8;
                            });
                          },
                          child: SingleSizeWidget(
                            size: 8,
                            isSelected: selectedSize == 8,
                          ),
                        ),
                      ],
                    ),
                    MySpacing.height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        SingleSizeWidget(
                          size: 9,
                          isAvailable: false,
                          isSelected: selectedSize == 9,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = 11;
                            });
                          },
                          child: SingleSizeWidget(
                            size: 11,
                            isSelected: selectedSize == 11,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = 12;
                            });
                          },
                          child: SingleSizeWidget(
                            size: 12,
                            isSelected: selectedSize == 12,
                          ),
                        ),
                        SingleSizeWidget(
                          size: 13,
                          isAvailable: false,
                          isSelected: selectedSize == 13,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = 14;
                            });
                          },
                          child: SingleSizeWidget(
                            size: 14,
                            isSelected: selectedSize == 14,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 64),
                      child: IntrinsicHeight(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width: 52,
                                    height: 52,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: theme.colorScheme.primary,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        LucideIcons.scaling,
                                        color: theme.colorScheme.onPrimary,
                                      ),
                                    ),
                                  ),
                                  MySpacing.height(8),
                                  MyText.bodyMedium("Size Guide",
                                      fontWeight: 600, letterSpacing: 0)
                                ],
                              ),
                            ),
                            VerticalDivider(
                              thickness: 0.8,
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width: 52,
                                    height: 52,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: theme.colorScheme.primary,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        LucideIcons.frown,
                                        color: theme.colorScheme.onPrimary,
                                        size: 28,
                                      ),
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(top: 8),
                                      child: MyText.bodyMedium("Can't Find?",
                                          fontWeight: 600, letterSpacing: 0))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}

class SingleSizeWidget extends StatefulWidget {
  final int size;
  final bool isAvailable, isSelected;

  const SingleSizeWidget(
      {Key? key,
      required this.size,
      this.isAvailable = true,
      this.isSelected = false})
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
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        border: Border.all(
            color: (widget.isAvailable && widget.isSelected)
                ? theme.colorScheme.primary
                : theme.colorScheme.background,
            width: 1.6),
        shape: BoxShape.circle,
        color: widget.isAvailable
            ? (widget.isSelected
                ? theme.colorScheme.primary
                : Colors.transparent)
            : customTheme.cardDark,
      ),
      child: Center(
        child: MyText.bodyLarge(widget.size.toString(),
            letterSpacing: -0.2,
            fontWeight: 600,
            color: (widget.isAvailable && widget.isSelected)
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.onBackground),
      ),
    );
  }
}
