import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_card.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class ShoppingOrderPlaceScreen extends StatefulWidget {
  @override
  _ShoppingOrderPlaceScreenState createState() =>
      _ShoppingOrderPlaceScreenState();
}

class _ShoppingOrderPlaceScreenState extends State<ShoppingOrderPlaceScreen> {
  void _showDialog() {
    showDialog(
        context: context, builder: (BuildContext context) => _ScratchDialog());
  }

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
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image:
                AssetImage('./assets/illustration/shopping/order-confirm.png'),
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.width * 0.5,
          ),
          MySpacing.height(32),
          MyText.bodyMedium(
            "Your order placed successfully",
          ),
          MySpacing.height(16),
          MyText.bodyMedium(
            "You won a scratch coupon",
          ),
          MySpacing.height(16),
          MyButton(
              backgroundColor: theme.colorScheme.primary,
              borderRadiusAll: 4,
              elevation: 0,
              onPressed: () {
                _showDialog();
              },
              child: MyText.bodyMedium("Scratch",
                  fontWeight: 600, color: theme.colorScheme.onPrimary)),
        ],
      ),
    ));
  }
}

class _ScratchDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = AppTheme.theme;
    return Dialog(
      insetPadding: MySpacing.x(52),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: MyCard(
        padding: MySpacing.xy(40, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            MyText.titleMedium(
              "Congratulations !",
              color: theme.colorScheme.primary,
              fontWeight: 700,
            ),
            MySpacing.height(16),
            MyText.bodyMedium(
              "Here's the code for your \$50 Puma's Gift Card",
              fontWeight: 600,
              height: 1.2,
              letterSpacing: -0.2,
              textAlign: TextAlign.center,
            ),
            MySpacing.height(32),
            MyText.titleLarge(
              "SH10USE",
              fontWeight: 800,
              letterSpacing: 0.5,
              textAlign: TextAlign.center,
            ),
            MySpacing.height(32),
            MyButton(
                borderRadiusAll: 4,
                elevation: 2,
                backgroundColor: theme.colorScheme.primary,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: MyText.labelMedium(
                  "Redeem it".toUpperCase(),
                  fontSize: 13,
                  letterSpacing: 0.5,
                  color: theme.colorScheme.onPrimary,
                  fontWeight: 600,
                ))
          ],
        ),
      ),
    );
  }
}
