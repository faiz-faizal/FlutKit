import 'package:flutkit/apps/food/food_feedback_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FoodCheckoutScreen extends StatefulWidget {
  @override
  _FoodCheckoutScreenState createState() => _FoodCheckoutScreenState();
}

class _FoodCheckoutScreenState extends State<FoodCheckoutScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  int selectedAddress = 0;
  int? paymentMethod = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(LucideIcons.chevronLeft, size: 20),
          ),
          centerTitle: true,
          title: MyText.titleSmall("Checkout",
              color: theme.colorScheme.onBackground, fontWeight: 600),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 8),
              child: MyText.titleSmall("Saved Address",
                  color: theme.colorScheme.onBackground, fontWeight: 600),
            ),
            Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: savedAddressWidget()),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: MyText.titleSmall("Add Address",
                  color: theme.colorScheme.onBackground, fontWeight: 600),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    style: MyTextStyle.bodyLarge(
                        letterSpacing: 0.1,
                        color: theme.colorScheme.onBackground,
                        fontWeight: 500),
                    decoration: InputDecoration(
                      hintText: "Address",
                      hintStyle: MyTextStyle.titleSmall(
                          letterSpacing: 0.1,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                          borderSide: BorderSide(
                              color: theme.colorScheme.surface, width: 1.2)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                          borderSide: BorderSide(
                              color: theme.colorScheme.surface, width: 1.2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                          borderSide: BorderSide(
                              color: theme.colorScheme.surface, width: 1.2)),
                      prefixIcon: Icon(
                        LucideIcons.mapPin,
                        size: 22,
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.all(0),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      style: MyTextStyle.bodyLarge(
                          letterSpacing: 0.1,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500),
                      decoration: InputDecoration(
                        hintStyle: MyTextStyle.titleSmall(
                            letterSpacing: 0.1,
                            color: theme.colorScheme.onBackground,
                            fontWeight: 500),
                        hintText: "Delivery note",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide(
                                color: theme.colorScheme.surface, width: 1.2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide(
                                color: theme.colorScheme.surface, width: 1.2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide(
                                color: theme.colorScheme.surface, width: 1.2)),
                        prefixIcon: Icon(
                          LucideIcons.info,
                          size: 22,
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.all(0),
                      ),
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: MyText.titleSmall("Payment Method",
                  color: theme.colorScheme.onBackground, fontWeight: 600),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 8),
              child: paymentMethodWidget(),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 20),
              child: MyText.bodyMedium("Order amount : \$39.99",
                  color: theme.colorScheme.onBackground, fontWeight: 600),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Center(
                child: MyButton(
                  elevation: 0,
                  borderRadiusAll: 4,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FoodFeedbackScreen()));
                  },
                  padding: MySpacing.xy(16, 16),
                  child: MyText.bodySmall("Place Order".toUpperCase(),
                      fontWeight: 600, color: theme.colorScheme.onPrimary),
                ),
              ),
            ),
          ],
        ));
  }

  Widget savedAddressWidget() {
    return Row(
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
                borderRadius: BorderRadius.all(Radius.circular(4)),
                border:
                    Border.all(color: theme.colorScheme.primary, width: 0.8)),
            padding: EdgeInsets.only(left: 12, right: 12, top: 5, bottom: 5),
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
                borderRadius: BorderRadius.all(Radius.circular(4)),
                border:
                    Border.all(color: theme.colorScheme.primary, width: 0.8)),
            padding: EdgeInsets.only(left: 12, right: 12, top: 5, bottom: 5),
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
                borderRadius: BorderRadius.all(Radius.circular(4)),
                border:
                    Border.all(color: theme.colorScheme.primary, width: 0.8)),
            padding: EdgeInsets.only(left: 12, right: 12, top: 5, bottom: 5),
            child: MyText.titleSmall("Other",
                color: selectedAddress == 2
                    ? theme.colorScheme.onPrimary
                    : theme.colorScheme.onBackground,
                fontWeight: 500),
          ),
        ),
      ],
    );
  }

  Widget paymentMethodWidget() {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              paymentMethod = 0;
            });
          },
          child: Row(
            children: <Widget>[
              Radio(
                value: 0,
                groupValue: paymentMethod,
                onChanged: (int? value) {
                  setState(() {
                    paymentMethod = value;
                  });
                },
              ),
              MyText.titleSmall("G Pay",
                  color: theme.colorScheme.onBackground, fontWeight: 600)
            ],
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              paymentMethod = 1;
            });
          },
          child: Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: paymentMethod,
                onChanged: (int? value) {
                  setState(() {
                    paymentMethod = value;
                  });
                },
              ),
              MyText.titleSmall("Paypal",
                  color: theme.colorScheme.onBackground, fontWeight: 600)
            ],
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              paymentMethod = 2;
            });
          },
          child: Row(
            children: <Widget>[
              Radio(
                value: 2,
                groupValue: paymentMethod,
                onChanged: (int? value) {
                  setState(() {
                    paymentMethod = value;
                  });
                },
              ),
              MyText.titleSmall("Credit card",
                  color: theme.colorScheme.onBackground, fontWeight: 600)
            ],
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              paymentMethod = 3;
            });
          },
          child: Row(
            children: <Widget>[
              Radio(
                value: 3,
                groupValue: paymentMethod,
                onChanged: (int? value) {
                  setState(() {
                    paymentMethod = value;
                  });
                },
              ),
              MyText.titleSmall("Cash on Delivery",
                  color: theme.colorScheme.onBackground, fontWeight: 600)
            ],
          ),
        ),
      ],
    );
  }
}
