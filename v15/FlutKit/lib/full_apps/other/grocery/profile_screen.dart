import 'package:flutkit/full_apps/other/grocery/order_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class GroceryProfileScreen extends StatefulWidget {
  final BuildContext rootContext;

  const GroceryProfileScreen({Key? key, required this.rootContext})
      : super(key: key);

  @override
  _GroceryProfileScreenState createState() => _GroceryProfileScreenState();
}

class _GroceryProfileScreenState extends State<GroceryProfileScreen>
    with SingleTickerProviderStateMixin {
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
    return Scaffold(
        body: ListView(
      padding: MySpacing.fromLTRB(24, 72, 24, 70),
      children: [
        Center(
          child: MyContainer.rounded(
            padding: MySpacing.all(20),
            color: customTheme.groceryPrimary.withAlpha(40),
            child: Image.asset(
              'assets/images/apps/grocery/profile.png',
              width: 60,
              height: 60,
            ),
          ),
        ),
        MySpacing.height(16),
        Center(
          child: MyText.bodyLarge("Kelvin Gonzalez", fontWeight: 600),
        ),
        MySpacing.height(32),
        InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GroceryOrderScreen()));
            },
            child: getSingleSetting(
                iconData: LucideIcons.shoppingBag,
                color: CustomTheme.brown,
                title: "My Orders")),
        getSingleSetting(
            iconData: LucideIcons.creditCard,
            color: CustomTheme.green,
            title: "Wallet"),
        getSingleSetting(
            iconData: LucideIcons.tag,
            color: CustomTheme.purple,
            title: "Vouchers"),
        getSingleSetting(
            iconData: LucideIcons.mapPin,
            color: CustomTheme.orange,
            title: "My Address"),
        getSingleSetting(
            iconData: LucideIcons.logOut,
            color: CustomTheme.red,
            title: "Log Out"),
      ],
    ));
  }

  Widget getSingleSetting(
      {IconData? iconData, required Color color, required String title}) {
    return Container(
      margin: MySpacing.bottom(16),
      child: Row(
        children: [
          MyContainer(
            color: color.withAlpha(24),
            child: Icon(
              iconData,
              color: color,
              size: 22,
            ),
          ),
          MySpacing.width(24),
          MyText.bodyLarge(title, letterSpacing: 0.3, fontWeight: 600)
        ],
      ),
    );
  }
}
