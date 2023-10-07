/*
* File : Shopping Cart
* Version : 1.0.0
* */

import 'package:flutkit/apps/shopping/shopping_delivery_address_screen.dart';
import 'package:flutkit/apps/shopping/shopping_order_status_screen.dart';
import 'package:flutkit/helpers/extensions/widgets_extension.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _currentIndex = 0;
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    _tabController = TabController(length: 2, vsync: this);
    _tabController!.animation!.addListener(() {
      final aniValue = _tabController!.animation!.value;
      if (aniValue - _currentIndex > 0.5) {
        setState(() {
          _currentIndex = _currentIndex + 1;
        });
      } else if (aniValue - _currentIndex < -0.5) {
        setState(() {
          _currentIndex = _currentIndex - 1;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      tag: 'shopping_cart_screen',
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(
              elevation: 2,
              leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(LucideIcons.chevronLeft).autoDirection(),
              ),
              title: MyText.titleMedium("Cart", fontWeight: 600),
              centerTitle: true,
              bottom: TabBar(
                controller: _tabController,
                tabs: [
                  Tab(
                      child: MyText.titleMedium("Active",
                          color: _currentIndex == 0
                              ? theme.colorScheme.primary
                              : theme.colorScheme.onBackground,
                          fontWeight: 600)),
                  Tab(
                      child: MyText.titleMedium("Past Order",
                          color: _currentIndex == 1
                              ? theme.colorScheme.primary
                              : theme.colorScheme.onBackground,
                          fontWeight: 600)),
                ],
                labelColor: theme.colorScheme.primary,
                indicatorColor: theme.colorScheme.primary,
                unselectedLabelColor: theme.colorScheme.onBackground,
              ),
            ),
            body: TabBarView(
              controller: _tabController,
              children: <Widget>[
                _CartScreen(),
                ShoppingOrderStatusScreen(),
              ],
            ));
      },
    );
  }
}

class _CartScreen extends StatefulWidget {
  @override
  __CartScreenState createState() => __CartScreenState();
}

class __CartScreenState extends State<_CartScreen> {
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 16, left: 16, right: 16),
                child: _CartItemWidget(
                    name: "Cup Cake",
                    image:
                        './assets/images/apps/shopping/product/product-1.jpg',
                    price: 159,
                    count: 2),
              ),
              Container(
                margin: EdgeInsets.only(top: 16, left: 16, right: 16),
                child: _CartItemWidget(
                    name: "Woo Sandal",
                    image:
                        './assets/images/apps/shopping/product/product-8.jpg',
                    price: 299,
                    count: 1),
              ),
              Container(
                margin: EdgeInsets.only(top: 16, left: 16, right: 16),
                child: _CartItemWidget(
                    name: "High-Low ",
                    image:
                        './assets/images/apps/shopping/product/product-7.jpg',
                    price: 459,
                    count: 3),
              ),
              _CardBillWidget(),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Center(
                  child: MyButton(
                      elevation: 0,
                      borderRadiusAll: 4,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ShoppingDeliveryAddressScreen()));
                      },
                      child: MyText.bodyMedium("CHECKOUT",
                          fontWeight: 600,
                          color: theme.colorScheme.onPrimary,
                          letterSpacing: 0.5)),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}

class _CardBillWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: MySpacing.all(20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MyText.titleMedium(
                "Subtotal",
                fontWeight: 600,
              ),
              MyText.titleMedium(
                "\$  299.99",
                fontWeight: 600,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MyText.titleMedium(
                  "Shipping cost",
                  fontWeight: 600,
                ),
                MyText.titleMedium(
                  "\$  49.59",
                  fontWeight: 600,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MyText.titleMedium(
                  "Taxes",
                  fontWeight: 600,
                ),
                MyText.titleMedium(
                  "\$  29.99",
                  fontWeight: 600,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MyText.titleMedium("Total", fontWeight: 700),
                MyText.titleMedium("\$  399.89", fontWeight: 800),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CartItemWidget extends StatefulWidget {
  final String name, image;
  final int price, count;

  const _CartItemWidget(
      {Key? key,
      required this.name,
      required this.image,
      required this.price,
      required this.count})
      : super(key: key);

  @override
  __CartItemWidgetState createState() => __CartItemWidgetState();
}

class __CartItemWidgetState extends State<_CartItemWidget> {
  late ThemeData theme;

  late int _count;

  @override
  void initState() {
    super.initState();
    _count = widget.count;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: Image.asset(
              widget.image,
              height: 90.0,
              fit: BoxFit.fill,
            ),
          ),
          MySpacing.width(20),
          Expanded(
            child: SizedBox(
              height: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyText.bodyLarge(widget.name,
                      fontWeight: 600, letterSpacing: 0),
                  MyText.titleSmall("\$ ${widget.price}",
                      fontWeight: 700, letterSpacing: 0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        boxShadow: [
                          BoxShadow(
                            color: theme.colorScheme.primary.withAlpha(28),
                            blurRadius: 3,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              if (_count > 1) {
                                setState(() {
                                  _count--;
                                });
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  right: 10, left: 10, top: 8, bottom: 8),
                              child: Icon(
                                LucideIcons.minus,
                                color: theme.colorScheme.onPrimary,
                                size: 20,
                              ),
                            ),
                          ),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 250),
                            transitionBuilder:
                                (Widget child, Animation<double> animation) {
                              return ScaleTransition(
                                  scale: animation, child: child);
                            },
                            child: MyText.titleSmall(
                              '$_count',
                              fontWeight: 700,
                              color: theme.colorScheme.onPrimary,
                              key: ValueKey<int?>(_count),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _count++;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  right: 10, left: 10, top: 8, bottom: 8),
                              child: Icon(LucideIcons.plus,
                                  color: theme.colorScheme.onPrimary, size: 20),
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
        ],
      ),
    );
  }
}
