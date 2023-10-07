import 'dart:math';

import 'package:flutkit/full_apps/other/grocery/models/product.dart';
import 'package:flutkit/full_apps/other/grocery/single_product_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/my_utils.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class GrocerySearchScreen extends StatefulWidget {
  final BuildContext rootContext;

  const GrocerySearchScreen({Key? key, required this.rootContext})
      : super(key: key);

  @override
  _GrocerySearchScreenState createState() => _GrocerySearchScreenState();
}

class _GrocerySearchScreenState extends State<GrocerySearchScreen>
    with SingleTickerProviderStateMixin {
  late List<Product> products;
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
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: ListView(
          padding: MySpacing.fromLTRB(24, 48, 24, 70),
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(
                        LucideIcons.search,
                        size: 18,
                        color: theme.colorScheme.onBackground.withAlpha(150),
                      ),
                      filled: true,
                      isDense: true,
                      fillColor: customTheme.card,
                      hintStyle: MyTextStyle.bodyMedium(),
                      labelStyle: MyTextStyle.bodyMedium(),
                      labelText: "Search",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      focusColor: Colors.transparent,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    textCapitalization: TextCapitalization.sentences,
                    style: MyTextStyle.bodyMedium(),
                    cursorColor: customTheme.groceryPrimary,
                  ),
                ),

                MySpacing.width(16),
                //Space.width(16),
                MyContainer(
                  paddingAll: 14,
                  color: customTheme.groceryPrimary.withAlpha(32),
                  child: Transform.rotate(
                    angle: pi / 2,
                    child: Icon(
                      LucideIcons.sliders,
                      color: customTheme.groceryPrimary,
                      size: 20,
                    ),
                  ),
                )
              ],
            ),
            MySpacing.height(24),
            MyText.bodyMedium("Search for Vegetables",
                letterSpacing: 0, fontWeight: 600),
            MySpacing.height(16),
            Column(
              children: buildProducts(),
            )
          ],
        ));
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
            widget.rootContext,
            PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 500),
                pageBuilder: (_, __, ___) =>
                    GrocerySingleProductScreen(product, heroKey)));
      },
      child: MyContainer(
        margin: MySpacing.bottom(16),
        color: customTheme.card,
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
