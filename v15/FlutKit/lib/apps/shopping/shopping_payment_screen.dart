import 'package:flutkit/apps/shopping/shopping_rating_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ShoppingPaymentScreen extends StatefulWidget {
  @override
  _ShoppingPaymentScreenState createState() => _ShoppingPaymentScreenState();
}

class _ShoppingPaymentScreenState extends State<ShoppingPaymentScreen> {
  final int _numPages = 3;
  int _currentPage = 0;

  int _selectedMethod = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInToLinear,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: 8,
      decoration: BoxDecoration(
        color: isActive
            ? theme.colorScheme.primary
            : theme.colorScheme.onBackground.withAlpha(120),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    );
  }

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
    return GetBuilder(
      tag: 'shopping_payment_screen',
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  LucideIcons.chevronLeft,
                  size: 20,
                ),
              ),
              title: MyText.titleMedium("Payment", fontWeight: 600),
            ),
            backgroundColor: theme.colorScheme.background,
            body: ListView(
              padding: EdgeInsets.all(0),
              children: <Widget>[
                SizedBox(
                  height: 200,
                  child: PageView(
                    pageSnapping: true,
                    physics: ClampingScrollPhysics(),
                    controller: PageController(
                        initialPage: 0,
                        viewportFraction: 0.85,
                        keepPage: false),
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 20, right: 8),
                        child: MyContainer(
                          color: theme.colorScheme.primary.withAlpha(28),
                          borderRadiusAll: 4,
                          padding: MySpacing.x(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              MyText.headlineSmall("Visa",
                                  fontWeight: 800,
                                  color: theme.colorScheme.primary),
                              MyText.titleMedium("3481 4866 4789 9954",
                                  fontWeight: 600,
                                  color: theme.colorScheme.primary),
                              Row(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      MyText.bodyMedium("Card holder",
                                          color: theme.colorScheme.primary,
                                          fontWeight: 500),
                                      MyText.bodyLarge("Natalia dyer",
                                          color: theme.colorScheme.primary,
                                          fontWeight: 600),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        MyText.bodyMedium("Expire date",
                                            color: theme.colorScheme.primary,
                                            fontWeight: 500),
                                        MyText.bodyLarge("08/26",
                                            color: theme.colorScheme.primary,
                                            fontWeight: 600),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 8, bottom: 20, left: 8, right: 8),
                        child: MyContainer(
                          color: theme.colorScheme.primary.withAlpha(28),
                          borderRadiusAll: 4,
                          padding: MySpacing.x(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              MyText.headlineSmall("Mastercard",
                                  fontWeight: 800,
                                  color: theme.colorScheme.primary),
                              MyText.titleMedium("4879 5846 5478 2363",
                                  fontWeight: 600,
                                  color: theme.colorScheme.primary),
                              Row(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      MyText.bodyMedium("Card holder",
                                          color: theme.colorScheme.primary,
                                          fontWeight: 500),
                                      MyText.bodyLarge("Liana Fitzgeraldl",
                                          color: theme.colorScheme.primary,
                                          fontWeight: 600),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        MyText.bodyMedium("Expire date",
                                            color: theme.colorScheme.primary,
                                            fontWeight: 500),
                                        MyText.bodyLarge("04/25",
                                            color: theme.colorScheme.primary,
                                            fontWeight: 600),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 20, left: 8),
                        child: MyContainer(
                          color: theme.colorScheme.primary,
                          borderRadiusAll: 4,
                          padding: MySpacing.left(20),
                          child: Center(
                            child: MyText.titleMedium("ADD CARD",
                                fontWeight: 700,
                                letterSpacing: 0.5,
                                color: theme.colorScheme.onPrimary),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(16),
                          child: MyText.titleSmall("METHODS",
                              fontWeight: 600,
                              color: theme.colorScheme.onBackground
                                  .withAlpha(220))),
                      Divider(
                        color: theme.dividerColor,
                        thickness: 0.3,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 16, right: 16, top: 8, bottom: 8),
                        child: Row(
                          children: <Widget>[
                            Image(
                              image: AssetImage('./assets/brand/google.png'),
                              width: 30,
                              height: 30,
                            ),
                            MySpacing.width(20),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: MyText.titleMedium("G pay",
                                    fontWeight: 600),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: theme.dividerColor,
                        thickness: 0.3,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 16, right: 16, top: 8, bottom: 8),
                        child: Row(
                          children: <Widget>[
                            Image(
                                image: AssetImage('./assets/brand/paypal.png'),
                                width: 30,
                                height: 30),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: MyText.titleMedium("Paypal",
                                    fontWeight: 600),
                              ),
                            ),
                            Icon(
                              LucideIcons.check,
                              color: theme.colorScheme.onBackground,
                            )
                          ],
                        ),
                      ),
                      Divider(
                        color: theme.dividerColor,
                        thickness: 0.3,
                      ),
                      Container(
                          padding: EdgeInsets.all(20),
                          child: MyText.titleSmall("OTHER",
                              fontWeight: 600,
                              color: theme.colorScheme.onBackground
                                  .withAlpha(220))),
                      Container(
                        margin: MySpacing.x(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedMethod = 0;
                                });
                              },
                              child: OptionWidget(
                                iconData: LucideIcons.history,
                                text: "On EMI",
                                isSelected: _selectedMethod == 0,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedMethod = 1;
                                });
                              },
                              child: OptionWidget(
                                iconData: LucideIcons.landmark,
                                text: "Bank",
                                isSelected: _selectedMethod == 1,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedMethod = 2;
                                });
                              },
                              child: OptionWidget(
                                iconData: LucideIcons.banknote,
                                text: "COD",
                                isSelected: _selectedMethod == 2,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                MySpacing.height(20),
                Center(
                  child: MyButton(
                    elevation: 0,
                    borderRadiusAll: 4,
                    padding: MySpacing.x(20),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShoppingRatingScreen()));
                    },
                    child: MyText.bodyMedium("PAY WITH SECURE",
                        fontWeight: 600,
                        color: theme.colorScheme.onPrimary,
                        letterSpacing: 0.3),
                  ),
                ),
              ],
            ));
      },
    );
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
    ThemeData theme = AppTheme.theme;
    return MyContainer.bordered(
      color: isSelected ? theme.colorScheme.primary : Colors.transparent,
      borderRadiusAll: 4,
      bordered: !isSelected,
      paddingAll: 16,
      width: MediaQuery.of(context).size.width * 0.25,
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
