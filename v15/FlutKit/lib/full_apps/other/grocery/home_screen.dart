import 'package:flutkit/full_apps/other/grocery/category_screen.dart';
import 'package:flutkit/full_apps/other/grocery/models/category.dart';
import 'package:flutkit/full_apps/other/grocery/models/product.dart';
import 'package:flutkit/full_apps/other/grocery/notification_dialog.dart';
import 'package:flutkit/full_apps/other/grocery/single_product_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/my_utils.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class GroceryHomeScreen extends StatefulWidget {
  final BuildContext rootContext;

  const GroceryHomeScreen({Key? key, required this.rootContext})
      : super(key: key);

  @override
  _GroceryHomeScreenState createState() => _GroceryHomeScreenState();
}

class _GroceryHomeScreenState extends State<GroceryHomeScreen>
    with SingleTickerProviderStateMixin {
  late List<Category> categories;
  late List<Product> products;
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    categories = Category.getList();
    products = Product.getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: ListView(
          padding: MySpacing.fromLTRB(0, 48, 0, 70),
          children: <Widget>[
            Padding(
              padding: MySpacing.horizontal(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText.titleLarge("Hi, Den!",
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return NotificationDialog();
                          },
                          fullscreenDialog: true));
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: <Widget>[
                        Icon(
                          LucideIcons.bell,
                          size: 22,
                          color: theme.colorScheme.onBackground.withAlpha(200),
                        ),
                        Positioned(
                          right: -2,
                          top: -2,
                          child: Container(
                            padding: MySpacing.zero,
                            height: 14,
                            width: 14,
                            decoration: BoxDecoration(
                                color: customTheme.groceryPrimary,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                            child: Center(
                              child: MyText.labelSmall(
                                "2",
                                color: customTheme.groceryOnPrimary,
                                fontSize: 9,
                                fontWeight: 500,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            MySpacing.height(8),
            Padding(
              padding: MySpacing.horizontal(24),
              child: MyText.bodyMedium("What would you buy today?",
                  color: theme.colorScheme.onBackground,
                  fontWeight: 500,
                  xMuted: true),
            ),
            MySpacing.height(24),
            getBannerWidget(),
            MySpacing.height(24),
            Padding(
              padding: MySpacing.horizontal(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText.titleMedium("Categories",
                      letterSpacing: 0,
                      color: theme.colorScheme.onBackground,
                      fontWeight: 600),
                  MyText.bodySmall("See All",
                      color: theme.colorScheme.onBackground,
                      fontWeight: 600,
                      xMuted: true,
                      letterSpacing: 0),
                ],
              ),
            ),
            MySpacing.height(16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: buildCategories(),
              ),
            ),
            MySpacing.height(24),
            Padding(
              padding: MySpacing.horizontal(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText.titleMedium("Best Selling",
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                  MyText.bodySmall("See All",
                      color: theme.colorScheme.onBackground,
                      fontWeight: 600,
                      xMuted: true,
                      letterSpacing: 0),
                ],
              ),
            ),
            MySpacing.height(16),
            Padding(
              padding: MySpacing.horizontal(24),
              child: Column(
                children: buildProducts(),
              ),
            )
          ],
        ));
  }

  Widget getBannerWidget() {
    return MyContainer(
      color: customTheme.groceryPrimary.withAlpha(28),
      padding: MySpacing.all(24),
      margin: MySpacing.horizontal(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.bodyLarge("Enjoy the special offer\nup to 60%",
              color: customTheme.groceryPrimary,
              fontWeight: 600,
              letterSpacing: 0),
          MySpacing.height(8),
          MyText.bodySmall("at 15 - 25 March 2021",
              color: theme.colorScheme.onBackground.withAlpha(100),
              fontWeight: 500,
              letterSpacing: -0.2),
        ],
      ),
    );
  }

  List<Widget> buildCategories() {
    List<Widget> list = [];
    list.add(MySpacing.width(24));
    for (int i = 0; i < categories.length; i++) {
      list.add(getSingleCategory(categories[i]));
      list.add(MySpacing.width(16));
    }
    return list;
  }

  Widget getSingleCategory(Category category) {
    String heroTag = MyTextUtils.randomString(10);

    return Hero(
      tag: heroTag,
      child: MyContainer(
        width: 80,
        onTap: () {
          Navigator.push(
              widget.rootContext,
              PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 500),
                  pageBuilder: (_, __, ___) =>
                      GroceryCategoryScreen(context, category, heroTag)));
        },
        padding: MySpacing.all(16),
        color: category.color,
        child: Column(
          children: [
            Image.asset(
              category.image,
              width: 28,
              height: 28,
            ),
            MySpacing.height(4),
            MyText.labelSmall(
              category.title,
              color: theme.colorScheme.onBackground,
            )
          ],
        ),
      ),
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
