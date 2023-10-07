import 'package:flutkit/apps/shopping/shopping_register_screen.dart';
import 'package:flutkit/full_apps/other/shopping/full_app.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';

class ShoppingPasswordScreen extends StatefulWidget {
  @override
  _ShoppingPasswordScreenState createState() => _ShoppingPasswordScreenState();
}

class _ShoppingPasswordScreenState extends State<ShoppingPasswordScreen> {
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
    return Scaffold(
        body: Container(
      padding: MySpacing.top(MySpacing.safeAreaTop(context) + 48),
      child: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Center(
                child: MyText.headlineSmall("Reset Password", fontWeight: 700),
              )),
          Container(
            margin: EdgeInsets.only(left: 48, right: 48, top: 40),
            child: MyText.bodyLarge(
              "Enter your email address to reset your password",
              softWrap: true,
              fontWeight: 500,
              height: 1.2,
              color: theme.colorScheme.onBackground.withAlpha(200),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 24, right: 24, top: 36),
            child: MyContainer.none(
              borderRadiusAll: 4,
              child: TextFormField(
                style:
                    MyTextStyle.bodyLarge(fontWeight: 500, letterSpacing: 0.2),
                decoration: InputDecoration(
                  hintStyle: MyTextStyle.bodyLarge(
                      fontWeight: 500,
                      letterSpacing: 0,
                      color: theme.colorScheme.onBackground.withAlpha(180)),
                  hintText: "Email Address",
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.all(16),
                ),
                autofocus: false,
                textInputAction: TextInputAction.search,
                textCapitalization: TextCapitalization.sentences,
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 24, right: 24, top: 36),
              child: MyButton.block(
                borderRadiusAll: 4,
                elevation: 0,
                padding: MySpacing.y(20),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShoppingFullApp()));
                },
                child: MyText.bodyMedium("RESET PASSWORD",
                    color: theme.colorScheme.onPrimary,
                    letterSpacing: 0.6,
                    fontWeight: 700),
              )),
          MySpacing.height(8),
          Center(
            child: MyButton.text(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShoppingRegisterScreen()));
              },
              child: MyText.bodyMedium("I haven't an account",
                  decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    ));
  }
}
