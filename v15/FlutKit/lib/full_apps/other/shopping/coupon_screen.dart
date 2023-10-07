import 'package:flutkit/apps/other/terms_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ShoppingCouponScreen extends StatefulWidget {
  @override
  _ShoppingCouponScreenState createState() => _ShoppingCouponScreenState();
}

class _ShoppingCouponScreenState extends State<ShoppingCouponScreen> {
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
          backgroundColor: theme.scaffoldBackgroundColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(LucideIcons.chevronLeft),
          ),
          title: MyText.titleLarge("Coupons", fontWeight: 600),
        ),
        body: ListView(
          padding: MySpacing.x(16),
          children: <Widget>[
            MyText.bodySmall("Active".toUpperCase(),
                muted: true, fontWeight: 700),
            MySpacing.height(16),
            singleCoupon(
                image: "./assets/images/apps/shopping/offer/offer-1.png",
                offer: "Gift Card Valued at \$100 or 20% off at Puma stores",
                expireDate: "04 Jun 2020"),
            MySpacing.height(16),
            singleCoupon(
                image: "./assets/images/apps/shopping/offer/offer-1.png",
                offer: "Gift Card Valued at \$50 or 10% off at all stores",
                expireDate: "16 July 2020"),
            MySpacing.height(16),
            MyText.bodySmall("Upcoming".toUpperCase(),
                muted: true, fontWeight: 700),
            MySpacing.height(16),
            singleCoupon(
                image: "./assets/images/apps/shopping/offer/offer-2.png",
                offer: "Gift Card Valued at \$100 or 20% off at Puma stores",
                comingDate: "04 Aug 2020",
                isActive: false),
            MySpacing.height(16),
            singleCoupon(
                image: "./assets/images/apps/shopping/offer/offer-2.png",
                offer: "Gift Card Valued at \$50 or 10% off at all stores",
                comingDate: "16 Aug 2020",
                isActive: false),
          ],
        ));
  }

  Widget singleCoupon(
      {required String image,
      required String offer,
      String? expireDate,
      bool isActive = true,
      String? comingDate}) {
    return MyContainer(
      paddingAll: 24,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.fill),
                ),
              ),
              MySpacing.width(16),
              Expanded(
                child: MyText.bodyMedium(offer,
                    fontWeight: 600, letterSpacing: 0.2),
              )
            ],
          ),
          MySpacing.height(16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MyText.bodySmall(
                      isActive ? "Expires" : "Coming at",
                      muted: true,
                    ),
                    MyText.bodyMedium(isActive ? expireDate! : comingDate!,
                        fontWeight: 600),
                    MySpacing.height(8),
                    MyButton.text(
                      padding: MySpacing.zero,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TermsScreen()));
                      },
                      child: MyText.bodySmall("Terms & Condition Apply",
                          muted: true,
                          letterSpacing: 0,
                          color: theme.colorScheme.primary,
                          fontWeight: 600),
                    )
                  ],
                ),
              ),
              MyButton(
                  backgroundColor: theme.colorScheme.primary,
                  borderRadiusAll: 4,
                  elevation: 2,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: MyText.labelMedium(
                    isActive ? "Apply" : "Activate",
                    fontWeight: 600,
                    color: isActive
                        ? theme.colorScheme.onPrimary
                        : customTheme.onDisabled,
                    letterSpacing: 0.5,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
