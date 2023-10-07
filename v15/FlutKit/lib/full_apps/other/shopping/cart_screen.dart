import 'package:flutkit/full_apps/other/shopping/checkout_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen>
    with SingleTickerProviderStateMixin {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          body: ListView(
            padding: MySpacing.top(20),
            children: <Widget>[
              SingleCartItem(
                image: './assets/images/apps/shopping/product/product-1.jpg',
                price: 19.99,
                name: "Pumpkin\nCream",
                initialAmount: 2,
              ),
              MySpacing.height(20),
              SingleCartItem(
                image: './assets/images/apps/shopping/product/product-2.jpg',
                price: 27.89,
                name: "Carrom\nRoll",
                initialAmount: 1,
              ),
              MySpacing.height(20),
              SingleCartItem(
                image: './assets/images/apps/shopping/product/product-5.jpg',
                price: 39.79,
                name: "Other\nSeed",
                initialAmount: 3,
              ),
              Container(
                padding: MySpacing.nBottom(20),
                child: Divider(),
              ),
              Container(
                padding: MySpacing.fromLTRB(20, 20, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    MyText.bodyLarge("Discount", fontWeight: 600, muted: true),
                    MyText.bodyLarge("-\$9.99",
                        fontWeight: 600, letterSpacing: 0, muted: true)
                  ],
                ),
              ),
              Container(
                padding: MySpacing.fromLTRB(20, 20, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    MyText.titleMedium(
                      "Total",
                      fontWeight: 700,
                    ),
                    MyText.titleMedium(
                      "\$79.99",
                      fontWeight: 700,
                      letterSpacing: 0,
                    )
                  ],
                ),
              ),
              Container(
                margin: MySpacing.all(20),
                child: MyButton.block(
                  elevation: 0,
                  padding: MySpacing.y(20),
                  backgroundColor: theme.colorScheme.primary,
                  borderRadiusAll: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        LucideIcons.shoppingCart,
                        color: theme.colorScheme.onPrimary,
                        size: 18,
                      ),
                      MySpacing.width(20),
                      MyText.bodySmall("Checkout".toUpperCase(),
                          letterSpacing: 0.5,
                          fontWeight: 600,
                          color: theme.colorScheme.onPrimary)
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShoppingCheckoutScreen()));
                  },
                ),
              )
            ],
          )),
    );
  }
}

class SingleCartItem extends StatefulWidget {
  final String? image, name;
  final double? price;
  final int initialAmount;

  const SingleCartItem(
      {Key? key, this.image, this.name, this.price, this.initialAmount = 1})
      : super(key: key);

  @override
  _SingleCartItemState createState() => _SingleCartItemState();
}

class _SingleCartItemState extends State<SingleCartItem> {
  bool visible = true;

  late int amount;
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    amount = widget.initialAmount;
  }

  @override
  Widget build(BuildContext context) {
    return visible
        ? MyContainer(
            paddingAll: 0,
            borderRadiusAll: 4,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            margin: MySpacing.x(20),
            child: Dismissible(
              direction: DismissDirection.endToStart,
              background: Container(
                color: customTheme.card,
              ),
              secondaryBackground: Container(
                color: customTheme.card,
                alignment: AlignmentDirectional.centerEnd,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      margin: MySpacing.right(20),
                      padding: MySpacing.all(10),
                      decoration: BoxDecoration(
                          color: customTheme.colorError.withAlpha(36),
                          shape: BoxShape.circle),
                      child: Icon(
                        LucideIcons.delete,
                        size: 26,
                        color: customTheme.colorError,
                      ),
                    ),
                  ],
                ),
              ),
              onDismissed: (direction) {
                if (direction == DismissDirection.endToStart) {
                  setState(() {
                    //perform delete operation
                    setState(() {
                      visible = false;
                    });
                  });
                }
              },
              key: UniqueKey(),
              child: MyContainer(
                borderRadiusAll: 4,
                clipBehavior: Clip.antiAlias,
                padding: MySpacing.right(20),
                marginAll: 0,
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      child: Image.asset(
                        widget.image!,
                        height: 120,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 120,
                        margin: MySpacing.left(20),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                MyText.bodyLarge(widget.name!, fontWeight: 600),
                                MyText.bodyLarge("\$" "${widget.price}",
                                    fontWeight: 600,
                                    letterSpacing: -0.2,
                                    muted: true),
                              ],
                            )),
                            MyText.titleMedium("$amount", fontWeight: 600),
                            Container(
                              margin: MySpacing.left(20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  MyContainer.rounded(
                                    onTap: () {
                                      setState(() {
                                        amount++;
                                      });
                                    },
                                    color: customTheme.border,
                                    paddingAll: 8,
                                    child: Icon(
                                      LucideIcons.plus,
                                      size: 20,
                                      color: theme.colorScheme.onBackground,
                                    ),
                                  ),
                                  InkWell(
                                    child: MyContainer.rounded(
                                      onTap: () {
                                        setState(() {
                                          if (amount > 1) amount--;
                                        });
                                      },
                                      paddingAll: 8,
                                      color: customTheme.border,
                                      child: Icon(
                                        LucideIcons.minus,
                                        size: 20,
                                        color: theme.colorScheme.onBackground,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : Container();
  }
}
