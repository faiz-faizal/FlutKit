import 'package:flutkit/full_apps/other/shopping/address_screen.dart';
import 'package:flutkit/full_apps/other/shopping/coupon_screen.dart';
import 'package:flutkit/full_apps/other/shopping/order_place_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/my_shadow.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_card.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ShoppingCheckoutScreen extends StatefulWidget {
  @override
  _ShoppingCheckoutScreenState createState() => _ShoppingCheckoutScreenState();
}

class _ShoppingCheckoutScreenState extends State<ShoppingCheckoutScreen> {
  int _selectedOption = 1;
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
              color: theme.colorScheme.onBackground,
            ),
          ),
          centerTitle: true,
          title: MyText.titleMedium("Checkout", fontWeight: 600),
        ),
        body: ListView(
          padding: MySpacing.nTop(20),
          children: <Widget>[
            MyContainer.bordered(
              borderRadiusAll: 4,
              color: Colors.transparent,
              padding: MySpacing.fromLTRB(20, 32, 20, 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          LucideIcons.clock,
                          size: 22,
                          color: theme.colorScheme.primary,
                        ),
                        MySpacing.width(8),
                        MyText.bodySmall("2-3 Days",
                            fontWeight: 600, muted: true)
                      ],
                    ),
                  ),
                  MySpacing.height(32),
                  MyText.titleMedium("Toffee Bakery",
                      fontWeight: 600, letterSpacing: 0.3),
                  MySpacing.height(20),
                  MyContainer(
                    borderRadiusAll: 4,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShoppingAddressScreen()));
                    },
                    paddingAll: 20,
                    child: Row(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          child: Image.asset(
                            './assets/other/map-snap.png',
                            height: 64,
                            width: 86,
                            fit: BoxFit.cover,
                          ),
                        ),
                        MySpacing.width(20),
                        Expanded(
                          child: SizedBox(
                            height: 64,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                MyText.titleMedium("West Drive",
                                    fontWeight: 600),
                                MyText.bodySmall(
                                  "14, 921 Section",
                                  xMuted: true,
                                ),
                                MySpacing.height(4),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Icon(
                                      LucideIcons.info,
                                      color: theme.colorScheme.onBackground
                                          .withAlpha(200),
                                      size: 10,
                                    ),
                                    MySpacing.width(4),
                                    MyText.bodySmall(
                                      "Tap to change",
                                      fontSize: 9,
                                      fontWeight: 400,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            MySpacing.height(20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                MyText.bodyLarge("Order", fontWeight: 600),
                MyText.bodySmall(
                  " - 2 Item",
                  xMuted: true,
                ),
              ],
            ),
            MySpacing.height(20),
            MyContainer.bordered(
              borderRadiusAll: 4,
              color: Colors.transparent,
              paddingAll: 20,
              child: Column(
                children: <Widget>[
                  MyContainer.bordered(
                    borderRadiusAll: 4,
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: MyText.bodyLarge("Yellow Cake",
                              letterSpacing: 0, fontWeight: 600),
                        ),
                        MyText.titleSmall("\$12.99",
                            color: theme.colorScheme.primary, fontWeight: 600)
                      ],
                    ),
                  ),
                  MySpacing.height(8),
                  MyContainer.bordered(
                    borderRadiusAll: 4,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: MyText.bodyLarge("Colorful Sandal",
                              letterSpacing: 0, fontWeight: 600),
                        ),
                        MyText.titleSmall("\$29.99", fontWeight: 600)
                      ],
                    ),
                  ),
                  MySpacing.height(20),
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MyText.bodyMedium(
                                "FLAT40",
                                color: theme.colorScheme.onBackground,
                                fontWeight: 600,
                              ),
                              MyText.bodySmall("- 40% at max 100\$",
                                  fontSize: 12,
                                  fontWeight: 400,
                                  letterSpacing: -0.2)
                            ],
                          ),
                          MyButton.text(
                            padding: MySpacing.zero,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ShoppingCouponScreen()));
                            },
                            child: MyText.bodyMedium(
                              "Change coupon",
                              letterSpacing: 0,
                              fontWeight: 600,
                              color: theme.colorScheme.primary,
                            ),
                          )
                        ],
                      ),
                      MySpacing.height(8),
                      Container(
                        margin: MySpacing.top(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            MyText.bodyMedium("Charges",
                                muted: true, letterSpacing: 0, fontWeight: 600),
                            MyText.titleSmall("\$ 4.00",
                                letterSpacing: 0, muted: true, fontWeight: 600),
                          ],
                        ),
                      ),
                      MySpacing.height(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          MyText.bodyLarge("Total",
                              letterSpacing: 0, fontWeight: 700),
                          MyText.bodyLarge("\$ 43.99",
                              letterSpacing: 0, fontWeight: 700),
                        ],
                      ),
                      MySpacing.height(20),
                      Row(
                        children: <Widget>[
                          MyContainer(
                            paddingAll: 8,
                            borderRadiusAll: 4,
                            child: MyText.bodyMedium("VISA",
                                letterSpacing: 0.4, fontWeight: 900),
                          ),
                          MySpacing.width(8),
                          MyText.bodySmall(
                            "\u2022\u2022\u2022\u2022  7983",
                            muted: true,
                            letterSpacing: 0,
                            fontWeight: 600,
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: MyButton.text(
                                padding: MySpacing.zero,
                                onPressed: () {
                                  paymentMethod(context);
                                },
                                child: MyText.bodyMedium("Change",
                                    letterSpacing: 0,
                                    color: theme.colorScheme.primary,
                                    fontWeight: 600),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            MySpacing.height(24),
            MyButton(
              elevation: 0,
              padding: MySpacing.y(20),
              borderRadiusAll: 4,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShoppingOrderPlaceScreen()));
              },
              backgroundColor: theme.colorScheme.primary,
              child: MyText.bodySmall(
                "Place Order".toUpperCase(),
                letterSpacing: 0.6,
                fontWeight: 600,
                color: theme.colorScheme.onPrimary,
              ),
            )
          ],
        ));
  }

  void paymentMethod(context) {
    showModalBottomSheet(
        backgroundColor: customTheme.card,
        context: context,
        builder: (BuildContext buildContext) {
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Container(
                decoration: BoxDecoration(
                    color: customTheme.card,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                padding: MySpacing.xy(24, 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MyText.bodySmall(
                      "Select Option".toUpperCase(),
                      fontWeight: 600,
                      muted: true,
                    ),
                    MySpacing.height(20),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedOption = 0;
                              });
                            },
                            child: optionWidget(
                              iconData: LucideIcons.landmark,
                              text: "Bank",
                              isSelected: _selectedOption == 0,
                            ),
                          ),
                        ),
                        MySpacing.width(20),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedOption = 1;
                              });
                            },
                            child: optionWidget(
                              iconData: LucideIcons.creditCard,
                              text: "Card",
                              isSelected: _selectedOption == 1,
                            ),
                          ),
                        ),
                        MySpacing.width(20),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedOption = 2;
                              });
                            },
                            child: optionWidget(
                              iconData: LucideIcons.qrCode,
                              text: "QR",
                              isSelected: _selectedOption == 2,
                            ),
                          ),
                        ),
                        MySpacing.width(20),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedOption = 3;
                              });
                            },
                            child: optionWidget(
                              iconData: LucideIcons.banknote,
                              text: "COD",
                              isSelected: _selectedOption == 3,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          );
        });
  }

  Widget optionWidget(
      {IconData? iconData, required String text, required bool isSelected}) {
    return MyCard(
      shadow: MyShadow(darkShadow: true),
      color: isSelected ? theme.colorScheme.primary : Colors.transparent,
      paddingAll: 8,
      child: Column(
        children: <Widget>[
          Icon(
            iconData,
            color: isSelected
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.onBackground,
            size: 30,
          ),
          MySpacing.height(8),
          MyText.bodySmall(
            text,
            color: isSelected
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.onBackground,
          )
        ],
      ),
    );
  }
}
