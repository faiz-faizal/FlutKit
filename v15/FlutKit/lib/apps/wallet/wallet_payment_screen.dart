import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class WalletPaymentScreen extends StatefulWidget {
  @override
  _WalletPaymentScreenState createState() => _WalletPaymentScreenState();
}

class _WalletPaymentScreenState extends State<WalletPaymentScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  int _selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              LucideIcons.chevronLeft,
            ),
          ),
          title: MyText.titleMedium("Payment", fontWeight: 600),
        ),
        body: ListView(
          padding: MySpacing.nTop(20),
          children: <Widget>[
            MyText.bodySmall("RECENT PAYEE",
                fontWeight: 600,
                color: theme.colorScheme.onBackground.withAlpha(220)),
            MySpacing.height(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: MyContainer(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: <Widget>[
                        MyContainer(
                          padding: MySpacing.nTop(4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image(
                                image: AssetImage(
                                    './assets/images/profile/avatar_1.jpg')),
                          ),
                        ),
                        MySpacing.height(4),
                        MyText.titleSmall("Carlos", fontWeight: 600),
                        MySpacing.height(4),
                        MyText.labelSmall("1874596",
                            color:
                                theme.colorScheme.onBackground.withAlpha(200),
                            letterSpacing: 0),
                      ],
                    ),
                  ),
                ),
                MySpacing.width(20),
                Expanded(
                  child: MyContainer(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: <Widget>[
                        MyContainer(
                          padding: MySpacing.nTop(4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image(
                                image: AssetImage(
                                    './assets/images/profile/avatar_2.jpg')),
                          ),
                        ),
                        MySpacing.height(4),
                        MyText.titleSmall("Caprice", fontWeight: 600),
                        MySpacing.height(4),
                        MyText.labelSmall("2589631",
                            color:
                                theme.colorScheme.onBackground.withAlpha(200),
                            letterSpacing: 0),
                      ],
                    ),
                  ),
                ),
                MySpacing.width(20),
                Expanded(
                    child: MyContainer.none(
                  color: Colors.transparent,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      MyContainer(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            MyContainer(
                              padding: MySpacing.nTop(4),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image(
                                    image: AssetImage(
                                        './assets/images/profile/avatar_3.jpg')),
                              ),
                            ),
                            MySpacing.height(4),
                            MyText.titleSmall("Jenson", fontWeight: 700),
                            MySpacing.height(4),
                            MyText.labelSmall("1598746",
                                color: theme.colorScheme.onBackground
                                    .withAlpha(200),
                                letterSpacing: 0),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: MyContainer(
                          color: theme.colorScheme.primary.withAlpha(200),
                        ),
                      ),
                      MyText.bodyLarge("+5",
                          fontWeight: 700, color: theme.colorScheme.onPrimary)
                    ],
                  ),
                )),
              ],
            ),
            MySpacing.height(20),
            MyText.bodySmall("SELECT OPTION",
                fontWeight: 700,
                color: theme.colorScheme.onBackground.withAlpha(220)),
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
                    child: OptionWidget(
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
                    child: OptionWidget(
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
                    child: OptionWidget(
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
                    child: OptionWidget(
                      iconData: LucideIcons.mapPin,
                      text: "Near By",
                      isSelected: _selectedOption == 3,
                    ),
                  ),
                ),
              ],
            ),
            MySpacing.height(20),
            MyContainer(
              padding: EdgeInsets.all(12),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Icon(
                        LucideIcons.user,
                        color: theme.colorScheme.onPrimary,
                        size: 22,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 16),
                      child: TextFormField(
                        style: MyTextStyle.bodyLarge(
                            letterSpacing: 0.1,
                            color: theme.colorScheme.onBackground,
                            fontWeight: 500),
                        decoration: InputDecoration(
                          hintText: "Name",
                          hintStyle: MyTextStyle.titleSmall(
                              letterSpacing: 0.1,
                              color: theme.colorScheme.onBackground,
                              fontWeight: 500),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              borderSide: BorderSide.none),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              borderSide: BorderSide.none),
                          isDense: true,
                          fillColor: customTheme.card,
                          contentPadding: EdgeInsets.all(0),
                        ),
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                  )
                ],
              ),
            ),
            MyContainer(
              margin: EdgeInsets.only(top: 16),
              padding: EdgeInsets.all(12),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Icon(
                        LucideIcons.dollarSign,
                        color: theme.colorScheme.onPrimary,
                        size: 22,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 16),
                      child: TextFormField(
                        style: MyTextStyle.bodyLarge(
                            letterSpacing: 0.1,
                            color: theme.colorScheme.onBackground,
                            fontWeight: 500),
                        decoration: InputDecoration(
                          hintText: "Amount",
                          hintStyle: MyTextStyle.titleSmall(
                              letterSpacing: 0.1,
                              color: theme.colorScheme.onBackground,
                              fontWeight: 500),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              borderSide: BorderSide.none),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              borderSide: BorderSide.none),
                          isDense: true,
                          contentPadding: EdgeInsets.all(0),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  )
                ],
              ),
            ),
            MySpacing.height(20),
            MyButton.block(
              onPressed: () {},
              elevation: 0,
              borderRadiusAll: 4,
              padding: MySpacing.y(20),
              child: MyText.bodyMedium("Press & Hold to Transfer Money",
                  fontWeight: 600,
                  color: theme.colorScheme.onPrimary,
                  letterSpacing: 0.3),
            ),
          ],
        ));
  }
}

class OptionWidget extends StatelessWidget {
  final IconData iconData;
  final String text;
  final bool isSelected;

  OptionWidget(
      {Key? key,
      required this.iconData,
      required this.text,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return MyContainer(
      bordered: !isSelected,
      color:
          isSelected ? theme.colorScheme.primary : theme.colorScheme.background,
      borderRadiusAll: 4,
      padding: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Icon(
            iconData,
            color: isSelected
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.onBackground,
            size: 30,
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: MyText.bodySmall(
              text,
              fontWeight: 600,
              color: isSelected
                  ? theme.colorScheme.onPrimary
                  : theme.colorScheme.onBackground,
            ),
          )
        ],
      ),
    );
  }
}

class _TransactionWidget extends StatefulWidget {
  final bool isSend;
  final String name, date;
  final int amount;

  _TransactionWidget(
      {Key? key,
      required this.name,
      required this.date,
      required this.amount,
      required this.isSend})
      : super(key: key);

  @override
  _TransactionWidgetState createState() => _TransactionWidgetState();
}

class _TransactionWidgetState extends State<_TransactionWidget> {
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(top: 4, bottom: 4),
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MyText.titleMedium(widget.name,
                        fontWeight: 600, letterSpacing: 0),
                    MyText.bodySmall(widget.date, fontWeight: 500),
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                MyText.titleMedium(
                  widget.isSend ? "- " : "+ ",
                ),
                MyText.titleMedium("\$ ${widget.amount}", fontWeight: 600),
              ],
            )
          ],
        ),
      ),
    );
  }
}
