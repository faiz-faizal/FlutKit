import 'package:flutkit/full_apps/other/grocery/models/category.dart';
import 'package:flutkit/full_apps/other/grocery/models/product.dart';
import 'package:flutkit/full_apps/other/grocery/single_product_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/my_utils.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class GroceryCategoryScreen extends StatefulWidget {
  final BuildContext rootContext;
  final Category category;
  final String heroTag;

  const GroceryCategoryScreen(this.rootContext, this.category, this.heroTag);

  @override
  _GroceryCategoryScreenState createState() => _GroceryCategoryScreenState();
}

class _GroceryCategoryScreenState extends State<GroceryCategoryScreen>
    with SingleTickerProviderStateMixin {
  late List<Product> products;

  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  initState() {
    super.initState();
    products = Product.getList();

    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
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
                Navigator.pop(context);
              },
              child: Icon(
                LucideIcons.chevronLeft,
                color: theme.colorScheme.onBackground,
              ),
            ),
          ),
          body: ListView(
            padding: MySpacing.fromLTRB(24, 0, 24, 0),
            children: <Widget>[
              Column(
                children: [
                  Hero(
                    tag: widget.heroTag,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: widget.category.color,
                      ),
                      padding: MySpacing.all(20),
                      child: Image.asset(
                        widget.category.image,
                        width: 52,
                        height: 52,
                      ),
                    ),
                  ),
                  MySpacing.height(16),
                  MyText.titleMedium(
                    widget.category.title,
                    color: theme.colorScheme.onBackground,
                    fontWeight: 600,
                  )
                ],
              ),
              MySpacing.height(24),
              Column(
                children: buildProducts(),
              )
            ],
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
            widget.rootContext,
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
