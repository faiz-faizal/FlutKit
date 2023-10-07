/*
* File : Shopping Order Status
* Version : 1.0.0
* */

import 'package:flutkit/helpers/localizations/language.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ShoppingOrderStatusScreen extends StatefulWidget {
  @override
  _ShoppingOrderStatusScreenState createState() =>
      _ShoppingOrderStatusScreenState();
}

class TextIconItem {
  String text;
  IconData iconData;

  TextIconItem(this.text, this.iconData);
}

class _ShoppingOrderStatusScreenState extends State<ShoppingOrderStatusScreen> {
  int _currentStep = 3;

  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  final List<TextIconItem> _textIconChoice = [
    TextIconItem("Receipt", LucideIcons.receipt),
    TextIconItem("Cancel", LucideIcons.x)
  ];

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      tag: 'shopping_order_status_screen',
      builder: (controller) {
        return Scaffold(
            body: ListView(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.all(0),
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 16),
              height: 200,
              child: PageView(
                pageSnapping: true,
                physics: ClampingScrollPhysics(),
                controller: PageController(
                  initialPage: 0,
                  viewportFraction: 0.80,
                ),
                onPageChanged: (int page) {
                  setState(() {});
                },
                children: <Widget>[
                  MyContainer.bordered(
                    margin: EdgeInsets.only(
                        bottom: 8,
                        right: Language.autoDirection(12, 0)!,
                        top: 8),
                    padding: EdgeInsets.only(left: 16),
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 8, top: 16, bottom: 16, right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  MyText.titleMedium("Order No: 381478",
                                      fontWeight: 600),
                                  MyText.bodySmall("Placed on april, 14,2020",
                                      fontWeight: 400),
                                ],
                              ),
                              PopupMenuButton(
                                itemBuilder: (BuildContext context) {
                                  return _textIconChoice
                                      .map((TextIconItem choice) {
                                    return PopupMenuItem(
                                      value: choice,
                                      child: Row(
                                        children: <Widget>[
                                          Icon(choice.iconData,
                                              size: 18,
                                              color: theme
                                                  .colorScheme.onBackground),
                                          Padding(
                                            padding: EdgeInsets.only(left: 8),
                                            child: MyText.bodyMedium(
                                              choice.text,
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }).toList();
                                },
                                icon: Icon(
                                  LucideIcons.moreVertical,
                                  color: theme.colorScheme.onBackground,
                                ),
                                color: theme.colorScheme.background,
                              )
                            ],
                          ),
                          MyText.titleSmall("Paid", fontWeight: 600),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MyText.titleSmall("Status : ", fontWeight: 500),
                              MyText.titleMedium("On the way", fontWeight: 600),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  MyContainer.bordered(
                    margin:
                        EdgeInsets.only(bottom: 8, right: 12, left: 12, top: 8),
                    padding: EdgeInsets.only(left: 16),
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 8, top: 16, bottom: 16, right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  MyText.titleMedium("Order No: 47856521",
                                      fontWeight: 600),
                                  MyText.bodySmall("Placed on feb, 14,2020",
                                      fontWeight: 400),
                                ],
                              ),
                              PopupMenuButton(
                                itemBuilder: (BuildContext context) {
                                  return _textIconChoice
                                      .map((TextIconItem choice) {
                                    return PopupMenuItem(
                                      value: choice,
                                      child: Row(
                                        children: <Widget>[
                                          Icon(choice.iconData,
                                              size: 18,
                                              color: theme
                                                  .colorScheme.onBackground),
                                          Padding(
                                            padding: EdgeInsets.only(left: 8),
                                            child: MyText.bodyMedium(
                                              choice.text,
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }).toList();
                                },
                                icon: Icon(
                                  LucideIcons.moreVertical,
                                  color: theme.colorScheme.onBackground,
                                ),
                                color: theme.colorScheme.background,
                              )
                            ],
                          ),
                          MyText.titleSmall("Cash on Delivery",
                              fontWeight: 600),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MyText.titleSmall("Status : ", fontWeight: 500),
                              MyText.titleMedium("Delivered", fontWeight: 600),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  MyContainer.bordered(
                    margin: EdgeInsets.only(
                        top: 8,
                        bottom: 8,
                        left: Language.autoDirection(0, 12)!),
                    child: Center(
                      child: MyText.titleMedium("VIEW ALL",
                          fontWeight: 600,
                          letterSpacing: 0.5,
                          color: theme.colorScheme.onBackground.withAlpha(200)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: MySpacing.nBottom(20),
              child: MyText.titleSmall("STATUS",
                  fontWeight: 700,
                  color: theme.colorScheme.onBackground.withAlpha(200)),
            ),
            Stepper(
              physics: ClampingScrollPhysics(),
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                return Container();
              },
              currentStep: _currentStep,
              onStepTapped: (pos) {
                setState(() {
                  _currentStep = pos;
                });
              },
              steps: <Step>[
                Step(
                  isActive: true,
                  state: StepState.complete,
                  title: MyText.bodyLarge('Order placed - 14 April',
                      fontWeight: 600),
                  content: MyText.titleSmall("Order was received by seller",
                      fontWeight: 500),
                ),
                Step(
                  isActive: true,
                  state: StepState.complete,
                  title: MyText.bodyLarge('Payment confirmed - 14 april',
                      fontWeight: 600),
                  content: SizedBox(
                    child: MyText.titleSmall("Pay via debit card",
                        fontWeight: 600),
                  ),
                ),
                Step(
                  isActive: true,
                  state: StepState.complete,
                  title: MyText.bodyLarge('Processing - 16 April',
                      fontWeight: 600),
                  content: SizedBox(
                    child: MyText.titleSmall(
                        "It may be take longer time than expected",
                        fontWeight: 500),
                  ),
                ),
                Step(
                  isActive: true,
                  state: StepState.indexed,
                  title: MyText.bodyLarge('On the way', fontWeight: 600),
                  content: SizedBox(
                    child: MyText.titleSmall(
                        "Jenifer picked your order, you can contact her anytime",
                        fontWeight: 500),
                  ),
                ),
                Step(
                  state: StepState.indexed,
                  title: MyText.bodyLarge('Deliver', fontWeight: 600),
                  content: SizedBox(
                    child: MyText.titleSmall(
                        "Today at 2:30 PM order has been deliver",
                        fontWeight: 500),
                  ),
                ),
              ],
            ),
          ],
        ));
      },
    );
  }
}
