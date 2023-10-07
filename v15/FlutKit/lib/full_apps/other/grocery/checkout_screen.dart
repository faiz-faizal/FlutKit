import 'package:flutkit/full_apps/other/grocery/order_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class GroceryCheckoutScreen extends StatefulWidget {
  @override
  _GroceryCheckoutScreenState createState() => _GroceryCheckoutScreenState();
}

class _GroceryCheckoutScreenState extends State<GroceryCheckoutScreen>
    with SingleTickerProviderStateMixin {
  int? selectedAddress = 0;
  int? selectedPayment = 0;

  final List<String> _simpleChoice = [
    "Add new",
    "Find me",
    "Contact",
    "Setting"
  ];
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  initState() {
    super.initState();
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
            centerTitle: true,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                LucideIcons.chevronLeft,
                color: theme.colorScheme.onBackground,
                size: 20,
              ),
            ),
            title: MyText.titleMedium(
              "Checkout",
              fontWeight: 600,
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  padding: MySpacing.fromLTRB(24, 8, 24, 24),
                  children: <Widget>[
                    MyText.bodyMedium("Shipping To",
                        fontWeight: 600, letterSpacing: 0),
                    MySpacing.height(16),
                    getSingleAddress(
                        index: 0,
                        title: "Home",
                        address: "1258  Bel Meadow Drive, Los Angeles, CA"),
                    getSingleAddress(
                        index: 1,
                        title: "Office",
                        address: "608  Shadowmar Drive, ALTON, LA"),
                    MySpacing.height(24),
                    MyText.bodyMedium("Payment Method",
                        fontWeight: 600, letterSpacing: 0),
                    MySpacing.height(24),
                    getSinglePayment(
                        index: 0,
                        method: "Master Card",
                        image: 'assets/brand/master-card.png'),
                    getSinglePayment(
                        index: 1,
                        method: "Visa Card",
                        image: 'assets/brand/visa-card.png'),
                    // Space.height(16),
                    getSinglePayment(
                        index: 2,
                        method: "Paypal",
                        image: 'assets/brand/paypal.png'),
                  ],
                ),
              ),
              Container(
                padding: MySpacing.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText.bodyMedium("Total", fontWeight: 700),
                        MyText.bodyMedium("\$99.50",
                            letterSpacing: 0.25, fontWeight: 700),
                      ],
                    ),
                    MySpacing.height(24),
                    MyButton.block(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GroceryOrderScreen()));
                      },
                      backgroundColor: customTheme.groceryPrimary,
                      borderRadiusAll: 4,
                      padding: MySpacing.y(12),
                      elevation: 0,
                      child: MyText.bodyMedium(
                        "PROCEED TO PAY",
                        color: customTheme.groceryOnPrimary,
                        letterSpacing: 0.5,
                        fontWeight: 600,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget getSingleAddress(
      {int? index, required String title, required String address}) {
    bool isSelected = index == selectedAddress;

    return MyContainer(
      onTap: () {
        setState(() {
          selectedAddress = index;
        });
      },
      margin: MySpacing.bottom(16),
      padding: MySpacing.all(16),
      bordered: !isSelected,
      border: Border.all(color: customTheme.border),
      color: isSelected ? customTheme.card : theme.scaffoldBackgroundColor,
      borderRadiusAll: 8,
      child: Row(
        children: [
          isSelected
              ? Container(
                  padding: MySpacing.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: customTheme.groceryPrimary.withAlpha(40)),
                  child: Icon(
                    LucideIcons.mapPin,
                    color: customTheme.groceryPrimary,
                    size: 14,
                  ),
                )
              : Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: customTheme.groceryPrimary)),
                ),
          MySpacing.width(isSelected ? 16 : 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.bodyMedium(title, fontWeight: 600),
                MySpacing.height(4),
                MyText.bodySmall(address, fontWeight: 500, muted: true),
              ],
            ),
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return _simpleChoice.map((String choice) {
                return PopupMenuItem(
                  value: choice,
                  child: MyText.bodyMedium(choice),
                );
              }).toList();
            },
            color: customTheme.card,
            child: Icon(
              LucideIcons.moreVertical,
              color: theme.colorScheme.onBackground,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget getSinglePayment(
      {int? index, required String image, required String method}) {
    bool isSelected = index == selectedPayment;

    return MyContainer(
      onTap: () {
        setState(() {
          selectedPayment = index;
        });
      },
      margin: MySpacing.bottom(16),
      padding: MySpacing.all(16),
      bordered: !isSelected,
      border: Border.all(color: customTheme.border),
      color: isSelected ? customTheme.card : theme.scaffoldBackgroundColor,
      borderRadiusAll: 8,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 48,
            height: 36,
            child: Image.asset(
              image,
            ),
          ),
          MySpacing.width(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.bodyMedium(method, fontWeight: 600),
                MySpacing.height(8),
                MyText.labelSmall(
                    "8765  \u2022\u2022\u2022\u2022  \u2022\u2022\u2022\u2022  7983",
                    muted: true,
                    letterSpacing: 0)
              ],
            ),
          ),
          // isSelected ? Space.width(16) : Space.width(20),
          isSelected
              ? Container(
                  padding: MySpacing.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: customTheme.groceryPrimary.withAlpha(40)),
                  child: Icon(
                    LucideIcons.creditCard,
                    color: customTheme.groceryPrimary,
                    size: 14,
                  ),
                )
              : Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: customTheme.groceryPrimary)),
                ),
        ],
      ),
    );
  }
}
