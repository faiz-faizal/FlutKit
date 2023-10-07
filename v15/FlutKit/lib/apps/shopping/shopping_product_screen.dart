import 'package:flutkit/full_apps/other/shopping/cart_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/generator.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_star_rating.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ShoppingProductScreen extends StatefulWidget {
  final String heroTag, image;

  const ShoppingProductScreen(
      {Key? key,
      this.heroTag = "heroTag",
      this.image = './assets/images/apps/shopping/product/product-3.jpg'})
      : super(key: key);

  @override
  _ShoppingProductScreenState createState() => _ShoppingProductScreenState();
}

class _ShoppingProductScreenState extends State<ShoppingProductScreen>
    with SingleTickerProviderStateMixin {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      tag: 'shopping_product_screen',
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(LucideIcons.chevronLeft),
              ),
              title: MyText.titleLarge("Febreze AIR", fontWeight: 600),
              actions: <Widget>[
                Container(
                    margin: EdgeInsets.only(right: 16),
                    child: Icon(LucideIcons.heart, size: 22))
              ],
            ),
            backgroundColor: theme.colorScheme.background,
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
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          child: Image.asset(
                            widget.image,
                            width: MediaQuery.of(context).size.width * 0.65,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 24),
                          child: MyText.titleLarge("Rs. 1,500.00",
                              fontWeight: 600, letterSpacing: 0),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 16),
                            child: MyText.bodyMedium(
                              "Febreze AIR (blue edison)",
                              fontWeight: 500,
                            )),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          child:
                              MyStarRating(rating: 4.5, spacing: 4, size: 24),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          padding: EdgeInsets.only(
                              top: 4, bottom: 4, left: 12, right: 12),
                          decoration: BoxDecoration(
                              color: Generator.starColor.withAlpha(32),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          child: MyText.bodyMedium("4.5 (27)",
                              color: Generator.starColor),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 24),
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          boxShadow: [
                            BoxShadow(
                              color: theme.colorScheme.primary.withAlpha(24),
                              blurRadius: 3,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  MySpacing.xy(16, 0))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ShoppingCartScreen()));
                          },
                          child: MyText.bodyMedium("BUY NOW",
                              fontWeight: 600,
                              color: theme.colorScheme.onPrimary,
                              letterSpacing: 0.3),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: MyButton(
                          elevation: 0,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ShoppingCartScreen()));
                          },
                          backgroundColor:
                              theme.colorScheme.primary.withAlpha(40),
                          child: MyText.bodyMedium("ADD TO CART",
                              fontWeight: 600,
                              color: theme.colorScheme.primary,
                              letterSpacing: 0.3),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
