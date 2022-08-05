import 'dart:math';
import 'package:flutkit/style/MyCol.dart';
import 'package:flutkit/style/MyRow.dart';
import 'package:flutkit/style/ScreenMedia.dart';
import 'package:flutkit/utils/CardMonthInputFormatter.dart';
import 'package:flutkit/utils/CardNumberInputFormatter.dart';
import 'package:flutkit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../AppNotifier.dart';
import '../../AppTheme.dart';

class ShoppingAddCardScreen extends StatefulWidget {
  @override
  _ShoppingAddCardScreenState createState() => _ShoppingAddCardScreenState();
}

class _ShoppingAddCardScreenState extends State<ShoppingAddCardScreen>
    with SingleTickerProviderStateMixin {

  //ThemeData
  ThemeData themeData;
  int themeType;
  CustomAppTheme customAppTheme;

  AnimationController _controller;
  bool isFront = true;

  //Credit card
  String creditCardNumber = "4040 4040 4040 4040";
  String creditCardDate = "MM/YY";
  String creditCardName = "Holder Name";
  String creditCardCVV = "739";
  Color creditCardColor = const Color(0xff334382);
  TextEditingController cardNumberTextEditingController,
      cardDateTextEditingController,
      cardNameTextEditingController,
      cardCVVTextEditingController;

  //Focus node
  FocusNode creditNumberFocusNode,
      creditDateFocusNode,
      creditNameFocusNode,
      creditCVVFocusNode;




  flip({bool goFront = false, bool goBack = false}) async {
    if (goFront && isFront) {
      return;
    }
    if (goBack && !isFront) {
      return;
    }
    await _controller.reverse();
    setState(() {
      isFront = !isFront;
    });
    await _controller.forward();
  }

  initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 400), value: 1);

    cardNumberTextEditingController = TextEditingController();
    cardDateTextEditingController = TextEditingController();
    cardNameTextEditingController = TextEditingController();
    cardCVVTextEditingController = TextEditingController();

    creditNumberFocusNode = FocusNode();
    creditDateFocusNode = FocusNode();
    creditNameFocusNode = FocusNode();
    creditCVVFocusNode = FocusNode();

    cardNumberTextEditingController.addListener(() {
      setState(() {
        if(cardNumberTextEditingController.text.isNotEmpty) {
          creditCardNumber = cardNumberTextEditingController.text;
        }
        else
          creditCardNumber = "4040 4040 4040 4040";
      });
    });

    cardDateTextEditingController.addListener(() {
      setState(() {
        if(cardDateTextEditingController.text.isNotEmpty)
          creditCardDate = cardDateTextEditingController.text;
        else
          creditCardDate = "MM/YY";
      });
    });

    cardNameTextEditingController.addListener(() {
      setState(() {
        if(cardNameTextEditingController.text.isNotEmpty)
          creditCardName = cardNameTextEditingController.text;
        else
          creditCardName ="Holder Name";
      });
    });

    cardCVVTextEditingController.addListener(() {
      setState(() {
        if(cardCVVTextEditingController.text.isNotEmpty)
          creditCardCVV = cardCVVTextEditingController.text;
        else
          creditCardCVV = "739";
      });
    });

    creditNumberFocusNode.addListener(() {
      flip(goFront: true);
    });
    creditDateFocusNode.addListener(() {
      flip(goFront: true);
    });
    creditNameFocusNode.addListener(() {
      flip(goFront: true);
    });

    creditCVVFocusNode.addListener(() {
      flip(goBack: true);
    });
  }

  dispose() {
    super.dispose();
    cardNumberTextEditingController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget child) {
        themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(themeType),
            home: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return buildScreen(
                    ScreenMedia.getScreenMediaType(constraints.maxWidth));
              },
            ));
      },
    );
  }

  Widget buildScreen(ScreenMediaType screenMediaType) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: customAppTheme.bgLayer1,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(MdiIcons.chevronLeft),
          ),
          title: Text("Add Card",
              style: AppTheme.getTextStyle(
                  themeData.textTheme.headline6,
                  fontWeight: 600)),
          actions: <Widget>[
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(MdiIcons.check)),
            Spacing.width(16)
          ],
        ),
        body: Container(
          color: customAppTheme.bgLayer1,
          child: ListView(
            padding: Spacing.xy(8, 0),
            children: <Widget>[
              MyRow(
                wrapAlignment: WrapAlignment.center,
                defaultFlex: {
                  ScreenMediaType.MD: 12,
                  ScreenMediaType.XL: 10,
                  ScreenMediaType.XXL: 7,
                  ScreenMediaType.XXXXL: 6,
                },
                children: [
                  MyCol(
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Transform(
                          transform: Matrix4.rotationY(
                              (1 - _controller.value) * pi / 2),
                          alignment: Alignment.center,
                          child: Container(
                            height: 240,
                            child: isFront
                                ? Container(
                              height: 240,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.7,
                                    color:
                                    themeData.colorScheme.surface),
                                color: creditCardColor,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(8)),
                                boxShadow: [
                                  BoxShadow(
                                    color: themeData
                                        .cardTheme.shadowColor
                                        .withAlpha(28),
                                    blurRadius: 3,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                              ),
                              padding: Spacing.all(24),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      padding: Spacing.xy(8,4),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.all(
                                              Radius.circular(4))),
                                      child: Text(
                                        "VISA",
                                        style: AppTheme.getTextStyle(
                                            themeData
                                                .textTheme.headline6,
                                            fontWeight: 700,
                                            color: creditCardColor),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(creditCardNumber,
                                        style: AppTheme.getTextStyle(
                                            themeData
                                                .textTheme.subtitle1,
                                            fontWeight: 600,
                                            letterSpacing: 0.5,
                                            wordSpacing: 1,
                                            color: Colors.white)),
                                  ),
                                  Container(
                                    child: Text(creditCardDate,
                                        style: AppTheme.getTextStyle(
                                            themeData
                                                .textTheme.subtitle1,
                                            fontWeight: 600,
                                            letterSpacing: 0.5,
                                            wordSpacing: 1,
                                            color: Colors.white)),
                                  ),
                                  Container(
                                    child: Text(creditCardName,
                                        style: AppTheme.getTextStyle(
                                            themeData
                                                .textTheme.subtitle1,
                                            fontWeight: 500,
                                            letterSpacing: 0.3,
                                            wordSpacing: 1,
                                            color: Colors.white)),
                                  ),
                                ],
                              ),
                            )
                                : Container(
                              height: 240,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.7,
                                    color:
                                    themeData.colorScheme.surface),
                                color: creditCardColor,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(8)),
                                boxShadow: [
                                  BoxShadow(
                                    color: themeData
                                        .cardTheme.shadowColor
                                        .withAlpha(28),
                                    blurRadius: 3,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: Container(
                                padding: Spacing.y(24),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      height: 36,
                                      color: Colors.black,
                                    ),
                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              height: 36,
                                              color: Color(0xffbdc2d8),
                                            ),
                                          ),
                                          Container(
                                            height: 28,
                                            width: 56,
                                            color: Colors.white,
                                            alignment:
                                            Alignment.centerLeft,
                                            child: Center(
                                              child: Text(
                                                creditCardCVV,
                                                style:
                                                AppTheme.getTextStyle(
                                                    themeData
                                                        .textTheme
                                                        .subtitle1,
                                                    color:
                                                    Colors.black,
                                                    fontWeight: 600,
                                                    letterSpacing:
                                                    0.5),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: Spacing.right(24),
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        padding: Spacing.xy(8,4),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.all(
                                                Radius.circular(4))),
                                        child: Text(
                                          "VISA",
                                          style: AppTheme.getTextStyle(
                                              themeData
                                                  .textTheme.bodyText1,
                                              fontWeight: 700,
                                              color: creditCardColor),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  MyCol(
                    child: Column(
                      children: <Widget>[
                        Spacing.height(4),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Card Number",
                            hintText: "Card Number",
                            border: themeData.inputDecorationTheme.border,
                            enabledBorder:
                            themeData.inputDecorationTheme.border,
                            focusedBorder: themeData
                                .inputDecorationTheme.focusedBorder,
                            prefixIcon: Icon(MdiIcons.numeric),
                          ),
                          controller: cardNumberTextEditingController,
                          keyboardType: TextInputType.number,
                          textCapitalization: TextCapitalization.sentences,
                          focusNode: creditNumberFocusNode,
                          inputFormatters: [
                            //WhitelistingTextInputFormatter(RegExp(r"[\d]")),
                            LengthLimitingTextInputFormatter(19),
                            CardNumberInputFormatter()
                          ],
                        ),
                        Container(
                          margin: Spacing.top(24),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Expired date",
                              hintText: "Expired date",
                              border: themeData.inputDecorationTheme.border,
                              enabledBorder:
                              themeData.inputDecorationTheme.border,
                              focusedBorder: themeData
                                  .inputDecorationTheme.focusedBorder,
                              prefixIcon:
                              Icon(MdiIcons.calendarRangeOutline),
                            ),
                            controller: cardDateTextEditingController,
                            keyboardType: TextInputType.number,
                            textCapitalization:
                            TextCapitalization.sentences,
                            focusNode: creditDateFocusNode,
                            inputFormatters: [
                              CardMonthInputFormatter(),
                              LengthLimitingTextInputFormatter(5)
                            ],
                          ),
                        ),
                        Container(
                          margin: Spacing.top(24),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Card holder",
                              hintText: "Card holder",
                              border: themeData.inputDecorationTheme.border,
                              enabledBorder:
                              themeData.inputDecorationTheme.border,
                              focusedBorder: themeData
                                  .inputDecorationTheme.focusedBorder,
                              prefixIcon: Icon(MdiIcons.accountOutline),
                            ),
                            controller: cardNameTextEditingController,
                            textCapitalization:
                            TextCapitalization.sentences,
                            focusNode: creditNameFocusNode,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(24),
                            ],
                          ),
                        ),
                        Container(
                          margin: Spacing.top(24),
                          child: InkWell(
                            onTap: () {
                              flip(goBack: true);
                            },
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: "CVV",
                                hintText: "CVV",
                                border:
                                themeData.inputDecorationTheme.border,
                                enabledBorder:
                                themeData.inputDecorationTheme.border,
                                focusedBorder: themeData
                                    .inputDecorationTheme.focusedBorder,
                                prefixIcon:
                                Icon(MdiIcons.creditCardOutline),
                              ),
                              focusNode: creditCVVFocusNode,
                              controller: cardCVVTextEditingController,
                              keyboardType: TextInputType.number,
                              textCapitalization:
                              TextCapitalization.sentences,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(3),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

}
