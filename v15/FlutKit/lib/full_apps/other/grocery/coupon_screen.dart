import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_dotted_line.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GroceryCouponScreen extends StatefulWidget {
  @override
  _GroceryCouponScreenState createState() => _GroceryCouponScreenState();
}

class _GroceryCouponScreenState extends State<GroceryCouponScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: customTheme.groceryPrimary)),
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                LucideIcons.chevronLeft,
                size: 20,
              ),
            ),
            title: MyText.titleMedium("Coupons", fontWeight: 600),
          ),
          body: ListView(
            padding: MySpacing.fromLTRB(24, 8, 24, 0),
            children: <Widget>[
              singleCoupon(MdiIcons.skype, CustomTheme.blue, "Skype", "Shoes",
                  80, "VIABILITY50"),
              // Space.height(24),
              singleCoupon(MdiIcons.spotify, CustomTheme.green, "Spotify",
                  "Songs", 30, "SPOTIFY70"),
              // Space.height(24),
              singleCoupon(LucideIcons.shoppingCart, CustomTheme.purple, "Cart",
                  "Shop", 60, "CART30"),
              // Space.height(24),
              singleCoupon(MdiIcons.sonyPlaystation, CustomTheme.orange, "Sony",
                  "PS5", 35, "SPS35"),
            ],
          )),
    );
  }

  Widget singleCoupon(IconData iconData, Color color, String company,
      String product, int offer, String code) {
    return MyContainer(
      margin: MySpacing.bottom(16),
      padding: MySpacing.all(16),
      color: customTheme.card,
      onTap: () {
        Navigator.pop(context);
      },
      child: Row(
        children: [
          Column(
            children: [
              Container(
                padding: MySpacing.all(16),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: color.withAlpha(200)),
                child: Icon(
                  iconData,
                  color: customTheme.groceryOnPrimary,
                ),
              ),
              MySpacing.height(8),
              MyText.bodyLarge(company, fontWeight: 600),
              MySpacing.height(4),
              MyText.bodySmall(
                product,
                fontWeight: 500,
                muted: true,
              ),
            ],
          ),
          MySpacing.width(16),
          MyDottedLine(
            color: theme.colorScheme.onBackground.withAlpha(100),
            height: 100,
            strokeWidth: 1.2,
            dottedLength: 8,
            space: 4,
          ),
          MySpacing.width(16),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyText.titleLarge("$offer%", fontWeight: 700),
                  MyText.bodyMedium("off", fontWeight: 600, xMuted: true),
                ],
              ),
              MySpacing.height(24),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyText.bodySmall("Promo code:",
                      xMuted: true, letterSpacing: -0.2),
                  MySpacing.width(8),
                  MyContainer(
                    padding: MySpacing.fromLTRB(12, 8, 12, 8),
                    borderRadiusAll: 4,
                    color: customTheme.groceryPrimary.withAlpha(40),
                    child: MyText.bodySmall(
                      code,
                      letterSpacing: 0,
                      fontWeight: 600,
                      color: customTheme.groceryPrimary,
                    ),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
