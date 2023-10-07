import 'package:flutkit/full_apps/other/grocery/checkout_screen.dart';
import 'package:flutkit/full_apps/other/grocery/coupon_screen.dart';
import 'package:flutkit/full_apps/other/grocery/models/cart.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/my_utils.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_dashed_divider.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class GroceryCartScreen extends StatefulWidget {
  final BuildContext rootContext;

  const GroceryCartScreen({Key? key, required this.rootContext})
      : super(key: key);

  @override
  _GroceryCartScreenState createState() => _GroceryCartScreenState();
}

class _GroceryCartScreenState extends State<GroceryCartScreen>
    with SingleTickerProviderStateMixin {
  late List<Cart> carts;
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  initState() {
    super.initState();
    carts = Cart.getList();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
          title: MyText.titleMedium("Cart", fontWeight: 600),
        ),
        body: ListView(
          padding: MySpacing.fromLTRB(24, 8, 24, 70),
          children: <Widget>[
            Column(
              children: buildCarts(),
            ),
            MySpacing.height(16),
            MyContainer(
              color: customTheme.card,
              padding: MySpacing.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Promo Code",
                        hintStyle: MyTextStyle.bodyMedium(),
                        labelStyle: MyTextStyle.bodyMedium(),
                        labelText: "Promo Code",
                        isDense: true,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        prefixIcon: Icon(
                          LucideIcons.ticket,
                          size: 22,
                          color: theme.colorScheme.onBackground.withAlpha(150),
                        ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: MySpacing.only(right: 16, top: 2),
                        focusColor: Colors.transparent,
                      ),
                      cursorColor: customTheme.groceryPrimary,
                      textCapitalization: TextCapitalization.sentences,
                      style: MyTextStyle.bodyMedium(),
                    ),
                  ),
                  MyButton.medium(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GroceryCouponScreen()));
                    },
                    backgroundColor: customTheme.groceryPrimary,
                    borderRadiusAll: 4,
                    padding: MySpacing.xy(32, 16),
                    elevation: 0,
                    child: MyText.labelMedium("Find",
                        letterSpacing: 0.5,
                        fontWeight: 600,
                        color: customTheme.groceryOnPrimary),
                  ),
                ],
              ),
            ),
            MySpacing.height(16),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.bodyMedium("Subtotal", fontWeight: 600),
                    MyText.bodyMedium("\$86.50",
                        letterSpacing: 0.25, fontWeight: 600),
                  ],
                ),
                MySpacing.height(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.bodyMedium("Delivery", fontWeight: 600),
                    MyText.bodyMedium("\$18.50",
                        letterSpacing: 0.25, fontWeight: 600),
                  ],
                ),
                MySpacing.height(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.bodyMedium("Tax & Fee", fontWeight: 600),
                    MyText.bodyMedium("\$9.99",
                        letterSpacing: 0.25, fontWeight: 600),
                  ],
                ),
                MySpacing.height(12),
                MyDashedDivider(
                  dashSpace: 6,
                  height: 1.2,
                  dashWidth: 8,
                  color: theme.colorScheme.onBackground,
                ),
                MySpacing.height(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.bodyLarge("Total", fontWeight: 700),
                    MyText.bodyLarge("\$99.50",
                        letterSpacing: 0.25, fontWeight: 700),
                  ],
                ),
              ],
            ),
            MySpacing.height(24),
            Center(
              child: MyButton.medium(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GroceryCheckoutScreen()));
                },
                backgroundColor: customTheme.groceryPrimary,
                borderRadiusAll: 4,
                padding: MySpacing.xy(32, 20),
                elevation: 0,
                child: MyText.labelMedium(
                  "CHECKOUT",
                  letterSpacing: 0.5,
                  fontWeight: 600,
                  color: customTheme.groceryOnPrimary,
                ),
              ),
            )
          ],
        ));
  }

  List<Widget> buildCarts() {
    List<Widget> list = [];

    for (int i = 0; i < carts.length; i++) {
      list.add(SingleCartWidget(context, carts[i]));
      if (i + 1 < carts.length) list.add(MySpacing.height(16));
    }

    return list;
  }
}

class SingleCartWidget extends StatefulWidget {
  final BuildContext rootContext;
  final Cart cart;

  const SingleCartWidget(this.rootContext, this.cart);

  @override
  _SingleCartWidgetState createState() => _SingleCartWidgetState();
}

class _SingleCartWidgetState extends State<SingleCartWidget> {
  late int quantity;
  late BuildContext rootContext;

  String? heroKey;
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    quantity = widget.cart.quantity;
    rootContext = widget.rootContext;
    heroKey = MyTextUtils.randomString(10);
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        color: customTheme.card,
      ),
      secondaryBackground: Container(
        decoration: BoxDecoration(
            color: customTheme.cardDark,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        padding: MySpacing.horizontal(20),
        alignment: AlignmentDirectional.centerEnd,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: MySpacing.right(8),
              padding: MySpacing.all(16),
              decoration: BoxDecoration(
                  color: CustomTheme.red.withAlpha(40), shape: BoxShape.circle),
              child: Icon(
                LucideIcons.trash,
                size: 22,
                color: CustomTheme.red,
              ),
            ),
          ],
        ),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          setState(() {
            //TODO: perform delete operation
          });
        }
      },
      child: MyContainer(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyContainer(
              color: customTheme.groceryPrimary.withAlpha(32),
              padding: MySpacing.all(8),
              child: Hero(
                tag: heroKey!,
                child: ClipRRect(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    widget.cart.image,
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
                  MyText.bodyLarge(widget.cart.name, fontWeight: 600),
                  MySpacing.height(8),
                  widget.cart.discountedPrice != widget.cart.price
                      ? Row(
                          children: [
                            MyText.bodySmall(
                                "\$${MyTextUtils.doubleToString(widget.cart.price)}",
                                decoration: TextDecoration.lineThrough,
                                fontWeight: 500),
                            // Space.width(8),
                            MySpacing.width(8),
                            MyText.bodyMedium(
                                "\$${MyTextUtils.doubleToString(widget.cart.discountedPrice)}",
                                color: theme.colorScheme.onBackground,
                                fontWeight: 700),
                          ],
                        )
                      : MyText.bodyMedium(
                          "\$${MyTextUtils.doubleToString(widget.cart.price)}",
                          color: theme.colorScheme.onBackground,
                          fontWeight: 700),
                  MySpacing.height(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MyContainer(
                        onTap: () {
                          setState(() {
                            if (quantity > 1) quantity--;
                          });
                        },
                        paddingAll: 8,
                        borderRadiusAll: 4,
                        color: customTheme.groceryPrimary.withAlpha(48),
                        child: Icon(
                          LucideIcons.minus,
                          size: 14,
                          color: customTheme.groceryPrimary,
                        ),
                      ),
                      MySpacing.width(12),
                      MyText.bodyLarge(quantity.toString(), fontWeight: 600),
                      MySpacing.width(12),
                      MyContainer(
                        padding: MySpacing.all(8),
                        borderRadiusAll: 4,
                        onTap: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        color: customTheme.groceryPrimary,
                        child: Icon(
                          LucideIcons.plus,
                          size: 14,
                          color: customTheme.groceryOnPrimary,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
