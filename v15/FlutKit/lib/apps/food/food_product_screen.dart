import 'package:flutkit/apps/food/food_cart_screen.dart';
import 'package:flutkit/apps/food/food_feedback_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FoodProductScreen extends StatefulWidget {
  @override
  _FoodProductScreenState createState() => _FoodProductScreenState();
}

class _FoodProductScreenState extends State<FoodProductScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  bool? isQuick = false;

  int selectedAddress = 0;

  int selectedSize = 0;
  bool toppingCheese = false,
      toppingTomato = true,
      toppingCorn = false,
      toppingChicken = false;

  int getPrice() {
    return 29 * (selectedSize + 1) +
        (toppingCheese ? 2 : 0) +
        (toppingTomato ? 3 : 0) +
        (toppingCorn ? 5 : 0) +
        (toppingChicken ? 10 : 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Image(
              image: AssetImage('./assets/images/apps/food/food-l3.jpg'),
              fit: BoxFit.fill,
            ),
            Positioned(
                top: 20,
                left: 20,
                child: SafeArea(
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        LucideIcons.chevronLeft,
                        color: Colors.black,
                      )),
                ))
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 20, top: 20),
          child: MyText.titleSmall(
            "Customisation",
            letterSpacing: 0.2,
            color: theme.colorScheme.onBackground,
            muted: true,
            fontWeight: 700,
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: 20, right: 20), child: Divider()),
        Container(
          margin: EdgeInsets.only(left: 20, top: 20),
          child: MyText.titleSmall("Select Size", fontWeight: 700),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: sizeSelector(),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, top: 20),
          child: MyText.titleSmall("Topping", fontWeight: 700),
        ),
        Container(
          margin: EdgeInsets.only(top: 8, left: 20, right: 20),
          child: toppingSelector(),
        ),
        Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Divider()),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 8),
          child: InkWell(
            onTap: () {
              setState(() {
                isQuick = isQuick;
              });
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Checkbox(
                  value: isQuick,
                  visualDensity: VisualDensity.compact,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  activeColor: theme.colorScheme.primary,
                  onChanged: (bool? value) {
                    setState(() {
                      isQuick = value;
                    });
                  },
                ),
                Container(
                  margin: EdgeInsets.only(left: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MyText.titleSmall("Quick Order",
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600,
                          height: 1),
                      MyText.bodySmall("Are you too hungry?",
                          letterSpacing: 0.2,
                          fontSize: 10,
                          fontWeight: 400,
                          color: theme.colorScheme.onBackground,
                          height: 1.35)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MyText.titleLarge("Total \$${getPrice()}",
                  fontWeight: 700, color: theme.colorScheme.onBackground),
              MyButton(
                onPressed: () {
                  !isQuick!
                      ? quickOrderSheet(context)
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FoodCartScreen()));
                },
                padding: MySpacing.xy(20, 16),
                elevation: 0,
                borderRadiusAll: 4,
                child: MyText.bodySmall(
                    !isQuick!
                        ? "Order now".toUpperCase()
                        : "Add to Cart".toUpperCase(),
                    letterSpacing: 0.2,
                    fontWeight: 600,
                    color: theme.colorScheme.onPrimary),
              ),
            ],
          ),
        )
      ],
    ));
  }

  Widget sizeSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              selectedSize = 0;
            });
          },
          child: Container(
            padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
            decoration: BoxDecoration(
              color: selectedSize == 0
                  ? theme.colorScheme.primary
                  : Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: theme.colorScheme.primary, width: 1),
            ),
            child: MyText.bodySmall("Small",
                color: selectedSize == 0
                    ? theme.colorScheme.onPrimary
                    : theme.colorScheme.onBackground,
                fontWeight: selectedSize == 0 ? 600 : 500,
                letterSpacing: 0.2),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              selectedSize = 1;
            });
          },
          child: Container(
            padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
            decoration: BoxDecoration(
              color: selectedSize == 1
                  ? theme.colorScheme.primary
                  : Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: theme.colorScheme.primary, width: 1),
            ),
            child: MyText.bodySmall("Medium",
                color: selectedSize == 1
                    ? theme.colorScheme.onPrimary
                    : theme.colorScheme.onBackground,
                fontWeight: selectedSize == 1 ? 600 : 500,
                letterSpacing: 0.2),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              selectedSize = 2;
            });
          },
          child: Container(
            padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
            decoration: BoxDecoration(
              color: selectedSize == 2
                  ? theme.colorScheme.primary
                  : Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(2)),
              border: Border.all(color: theme.colorScheme.primary, width: 1),
            ),
            child: MyText.bodySmall("Large",
                color: selectedSize == 2
                    ? theme.colorScheme.onPrimary
                    : theme.colorScheme.onBackground,
                fontWeight: selectedSize == 2 ? 600 : 500,
                letterSpacing: 0.2),
          ),
        ),
      ],
    );
  }

  Widget toppingSelector() {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              toppingCheese = toppingCheese;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MyText.bodyMedium("Cheese",
                  color: theme.colorScheme.onBackground, fontWeight: 600),
              Container(
                height: 36,
                width: 76,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  border:
                      Border.all(color: theme.colorScheme.primary, width: 1),
                  color: toppingCheese
                      ? theme.colorScheme.primary
                      : Colors.transparent,
                ),
                child: Center(
                  child: MyText.bodyMedium(toppingCheese ? "Added" : "Add \$2",
                      color: toppingCheese
                          ? theme.colorScheme.onPrimary
                          : theme.colorScheme.onBackground),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 8),
          child: InkWell(
            onTap: () {
              setState(() {
                toppingTomato = toppingTomato;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MyText.bodyMedium("Tomato",
                    color: theme.colorScheme.onBackground, fontWeight: 600),
                Container(
                  height: 36,
                  width: 76,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    border:
                        Border.all(color: theme.colorScheme.primary, width: 1),
                    color: toppingTomato
                        ? theme.colorScheme.primary
                        : Colors.transparent,
                  ),
                  child: Center(
                    child: MyText.bodyMedium(
                        toppingTomato ? "Added" : "Add \$3",
                        color: toppingTomato
                            ? theme.colorScheme.onPrimary
                            : theme.colorScheme.onBackground),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 8),
          child: InkWell(
            onTap: () {
              setState(() {
                toppingCorn = toppingCorn;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MyText.bodyMedium("Corn",
                    color: theme.colorScheme.onBackground, fontWeight: 600),
                Container(
                  height: 36,
                  width: 76,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    border:
                        Border.all(color: theme.colorScheme.primary, width: 1),
                    color: toppingCorn
                        ? theme.colorScheme.primary
                        : Colors.transparent,
                  ),
                  child: Center(
                    child: MyText.bodyMedium(toppingCorn ? "Added" : "Add \$5",
                        color: toppingCorn
                            ? theme.colorScheme.onPrimary
                            : theme.colorScheme.onBackground),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 8),
          child: InkWell(
            onTap: () {
              setState(() {
                toppingChicken = toppingChicken;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MyText.bodyMedium("Chicken",
                    color: theme.colorScheme.onBackground, fontWeight: 600),
                Container(
                  height: 36,
                  width: 76,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    border:
                        Border.all(color: theme.colorScheme.primary, width: 1),
                    color: toppingChicken
                        ? theme.colorScheme.primary
                        : Colors.transparent,
                  ),
                  child: Center(
                    child: MyText.bodyMedium(
                        toppingChicken ? "Added" : "Add \$10",
                        color: toppingChicken
                            ? theme.colorScheme.onPrimary
                            : theme.colorScheme.onBackground),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void quickOrderSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Container(
                decoration: BoxDecoration(
                    color: theme.colorScheme.background,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      MyText.titleSmall("Address",
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Row(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedAddress = 0;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: selectedAddress == 0
                                        ? theme.colorScheme.primary
                                        : Colors.transparent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    border: Border.all(
                                        color: theme.colorScheme.primary,
                                        width: 0.8)),
                                padding: EdgeInsets.only(
                                    left: 12, right: 12, top: 5, bottom: 5),
                                child: MyText.titleSmall("Home",
                                    color: selectedAddress == 0
                                        ? theme.colorScheme.onPrimary
                                        : theme.colorScheme.onBackground,
                                    fontWeight: 500),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedAddress = 1;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                    color: selectedAddress == 1
                                        ? theme.colorScheme.primary
                                        : Colors.transparent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    border: Border.all(
                                        color: theme.colorScheme.primary,
                                        width: 0.8)),
                                padding: EdgeInsets.only(
                                    left: 12, right: 12, top: 5, bottom: 5),
                                child: MyText.titleSmall("Office",
                                    color: selectedAddress == 1
                                        ? theme.colorScheme.onPrimary
                                        : theme.colorScheme.onBackground,
                                    fontWeight: 500),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedAddress = 2;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                    color: selectedAddress == 2
                                        ? theme.colorScheme.primary
                                        : Colors.transparent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    border: Border.all(
                                        color: theme.colorScheme.primary,
                                        width: 0.8)),
                                padding: EdgeInsets.only(
                                    left: 12, right: 12, top: 5, bottom: 5),
                                child: MyText.titleSmall("Other",
                                    color: selectedAddress == 2
                                        ? theme.colorScheme.onPrimary
                                        : theme.colorScheme.onBackground,
                                    fontWeight: 500),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                MyText.titleSmall("Food Wallet",
                                    color: theme.colorScheme.onBackground,
                                    fontWeight: 600),
                                MyText.bodySmall("Insufficient balance",
                                    fontSize: 12,
                                    color: theme.colorScheme.error,
                                    height: 1.1,
                                    fontWeight: 400)
                              ],
                            ),
                            TextButton(
                                onPressed: () {},
                                child: MyText.bodySmall(
                                    "Add Money".toUpperCase(),
                                    color: theme.colorScheme.primary,
                                    fontWeight: 600,
                                    letterSpacing: 0.2)),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            MyText.bodyMedium("Order amount : \$39.99",
                                color: theme.colorScheme.onBackground,
                                fontWeight: 600),
                            MyButton(
                                elevation: 0,
                                borderRadiusAll: 4,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              FoodFeedbackScreen()));
                                },
                                child: MyText.bodySmall("Place".toUpperCase(),
                                    letterSpacing: 0.2,
                                    fontWeight: 600,
                                    color: theme.colorScheme.onPrimary)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
