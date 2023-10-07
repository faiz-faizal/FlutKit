import 'package:flutkit/full_apps/other/grocery/checkout_screen.dart';
import 'package:flutkit/full_apps/other/grocery/models/product.dart';
import 'package:flutkit/full_apps/other/grocery/product_review_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/my_utils.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class GrocerySingleProductScreen extends StatefulWidget {
  final String heroKey;
  final Product product;

  const GrocerySingleProductScreen(this.product, this.heroKey);

  @override
  _GrocerySingleProductScreenState createState() =>
      _GrocerySingleProductScreenState();
}

class _GrocerySingleProductScreenState extends State<GrocerySingleProductScreen>
    with SingleTickerProviderStateMixin {
  late List<Product> products;
  int quantity = 1;
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    products = Product.getList();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: customTheme.groceryPrimary)),
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                LucideIcons.chevronLeft,
                color: customTheme.groceryPrimary,
                size: 20,
              ),
            ),
            actions: [
              Icon(
                LucideIcons.heart,
                color: customTheme.groceryPrimary,
                size: 20,
              ),
              MySpacing.width(16)
            ],
          ),
          body: Container(
            color: customTheme.groceryPrimary.withAlpha(68),
            child: ListView(
              children: <Widget>[
                Center(
                  child: Hero(
                    tag: widget.heroKey,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      child: Image.asset(
                        widget.product.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                MySpacing.height(24),
                MyContainer(
                  padding: MySpacing.all(24),
                  color: customTheme.card,
                  borderRadiusAll: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText.titleMedium(widget.product.name,
                                    fontWeight: 700),
                                MySpacing.height(8),
                                Row(
                                  children: [
                                    MyText.bodySmall(
                                      "\$3.99",
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                    MySpacing.width(8),
                                    // Space.width(8),
                                    MyText.bodyMedium(
                                      "\$2.32",
                                      fontWeight: 600,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          MyContainer(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          GroceryProductReviewScreen()));
                            },
                            padding: MySpacing.fromLTRB(8, 6, 8, 6),
                            color: customTheme.groceryPrimary.withAlpha(40),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                MyText.bodyMedium("(243 review)",
                                    color: customTheme.groceryPrimary,
                                    fontWeight: 500,
                                    letterSpacing: -0.2),
                                Icon(
                                  LucideIcons.chevronRight,
                                  size: 14,
                                  color: customTheme.groceryPrimary,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      MySpacing.height(4),
                      MyText.bodySmall(widget.product.description,
                          letterSpacing: 0.4, fontWeight: 500, muted: true),
                      MySpacing.height(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              MyContainer(
                                borderRadiusAll: 4,
                                onTap: () {
                                  setState(() {
                                    if (quantity > 1) quantity--;
                                  });
                                },
                                padding: MySpacing.all(8),
                                color: customTheme.groceryPrimary.withAlpha(48),
                                child: Icon(
                                  LucideIcons.minus,
                                  size: 14,
                                  color: customTheme.groceryPrimary,
                                ),
                              ),
                              MySpacing.width(12),
                              MyText.bodyLarge(quantity.toString(),
                                  fontWeight: 600),
                              MySpacing.width(12),
                              MyContainer(
                                borderRadiusAll: 4,
                                onTap: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                                padding: MySpacing.all(8),
                                color: customTheme.groceryPrimary,
                                child: Icon(
                                  LucideIcons.plus,
                                  size: 14,
                                  color: customTheme.groceryOnPrimary,
                                ),
                              ),
                            ],
                          ),
                          MySpacing.width(24),
                          Expanded(
                              child: MyButton(
                            borderRadiusAll: 4,
                            elevation: 0,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          GroceryCheckoutScreen()));
                            },
                            padding: MySpacing.y(16),
                            backgroundColor: customTheme.groceryPrimary,
                            child: MyText.bodyMedium("Buy Now",
                                fontWeight: 600,
                                color: customTheme.groceryOnPrimary),
                          ))
                        ],
                      ),
                      MySpacing.height(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText.titleMedium("Related", fontWeight: 600),
                          MyText.bodySmall("See All",
                              fontWeight: 600, xMuted: true, letterSpacing: 0),
                        ],
                      ),
                      MySpacing.height(16),
                      Column(
                        children: buildProducts(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  List<Widget> buildProducts() {
    List<Widget> list = [];
    for (Product product in products) {
      list.add(getSingleProduct(product));
    }
    return list;
  }

  Widget getSingleProduct(Product product) {
    String heroKey = MyTextUtils.randomString(10);

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 500),
                pageBuilder: (_, __, ___) =>
                    GrocerySingleProductScreen(product, heroKey)));
      },
      child: MyContainer(
        margin: MySpacing.bottom(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyContainer(
              color: customTheme.groceryPrimary.withAlpha(32),
              padding: MySpacing.all(8),
              child: Hero(
                tag: heroKey,
                child: ClipRRect(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset(
                    product.image,
                    width: 72,
                    height: 72,
                  ),
                ),
              ),
            ),
            MySpacing.width(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText.bodyMedium(product.name,
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                  MySpacing.height(8),
                  MyText.labelSmall(product.description,
                      color: theme.colorScheme.onBackground, muted: true),
                  MySpacing.height(8),
                  product.discountedPrice != product.price
                      ? Row(
                          children: [
                            MyText.bodySmall(
                                "\$${MyTextUtils.doubleToString(product.price)}",
                                decoration: TextDecoration.lineThrough,
                                fontWeight: 500),
                            // Space.width(8),
                            MySpacing.width(8),
                            MyText.bodyMedium(
                                "\$${MyTextUtils.doubleToString(product.discountedPrice)}",
                                color: theme.colorScheme.onBackground,
                                fontWeight: 700),
                          ],
                        )
                      : MyText.bodyMedium(
                          "\$${MyTextUtils.doubleToString(product.price)}",
                          color: theme.colorScheme.onBackground,
                          fontWeight: 700),
                ],
              ),
            ),
            // Space.width(8),
            Icon(
              LucideIcons.heart,
              color: customTheme.groceryPrimary,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
