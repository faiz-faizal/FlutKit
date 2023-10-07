import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/generator.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ShoppingRatingScreen extends StatefulWidget {
  @override
  _ShoppingRatingScreenState createState() => _ShoppingRatingScreenState();
}

class _ShoppingRatingScreenState extends State<ShoppingRatingScreen> {
  int _currentStep = 4;
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    WidgetsBinding.instance.addPostFrameCallback((_) => _showDialog());
  }

  void _showDialog() {
    showDialog(
        context: context, builder: (BuildContext context) => RatingDialog());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      tag: 'shopping_rating_screen',
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(LucideIcons.chevronLeft),
              ),
              title: MyText.titleLarge("Rating", fontWeight: 600),
            ),
            backgroundColor: theme.colorScheme.background,
            body: ListView(
              children: <Widget>[
                Stepper(
                  controlsBuilder:
                      (BuildContext context, ControlsDetails details) {
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
                          color: theme.colorScheme.onBackground,
                          letterSpacing: 0.2),
                      content: SizedBox(
                        child: MyText.titleSmall("Order was received by seller",
                            color: theme.colorScheme.onBackground),
                      ),
                    ),
                    Step(
                      isActive: true,
                      state: StepState.complete,
                      title: MyText.bodyLarge('Payment confirmed - 14 april',
                          color: theme.colorScheme.onBackground,
                          letterSpacing: 0.2),
                      content: SizedBox(
                        child: MyText.titleSmall("Pay via debit card",
                            color: theme.colorScheme.onBackground),
                      ),
                    ),
                    Step(
                      isActive: true,
                      state: StepState.complete,
                      title: MyText.bodyLarge('Processing - 16 April',
                          color: theme.colorScheme.onBackground,
                          letterSpacing: 0.2),
                      content: SizedBox(
                        child: MyText.titleSmall(
                            "It may be take longer time than expected",
                            color: theme.colorScheme.onBackground),
                      ),
                    ),
                    Step(
                      isActive: true,
                      state: StepState.complete,
                      title: MyText.bodyLarge('Delivered - 2:30 PM, 18 April',
                          color: theme.colorScheme.onBackground,
                          letterSpacing: 0.2),
                      content: SizedBox(
                        child: MyText.titleSmall(
                            "Today at 2:30 PM order has been delivered",
                            color: theme.colorScheme.onBackground),
                      ),
                    ),
                    Step(
                        isActive: true,
                        state: StepState.indexed,
                        title: MyText.bodyLarge('Review & Rating',
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0.2,
                            fontWeight: 700),
                        content: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MyText("It's time to rate a product"),
                            ],
                          ),
                        )),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      onPressed: () {
                        _showDialog();
                      },
                      style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all(MySpacing.xy(16, 0))),
                      child: MyText.bodyLarge("Rate".toUpperCase(),
                          color: theme.colorScheme.onSecondary,
                          letterSpacing: 0.5,
                          wordSpacing: 0.5)),
                ),
              ],
            ));
      },
    );
  }
}

class RatingDialog extends StatefulWidget {
  @override
  _RatingDialogState createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int _selectRate = 5;
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
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: MySpacing.x(20),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  MyText.titleLarge("Enjoying product?",
                      fontWeight: 700, letterSpacing: 0),
                  Container(
                    margin: EdgeInsets.only(top: 24),
                    child: MyText.bodyMedium("How would you rate our service?",
                        fontWeight: 500, letterSpacing: 0.3),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 24),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(5, (index) {
                        return Padding(
                          padding: EdgeInsets.all(2),
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectRate = index + 1;
                                });
                              },
                              child: index < _selectRate
                                  ? Icon(Icons.star,
                                      size: 32, color: Generator.starColor)
                                  : Icon(Icons.star_border,
                                      size: 32, color: Generator.starColor)),
                        );
                      }),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 12),
                      child: MyText.bodySmall("Maybe next time",
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
