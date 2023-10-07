import 'package:flutkit/full_apps/other/shopping/add_card_screen.dart';
import 'package:flutkit/full_apps/other/shopping/category_screen.dart';
import 'package:flutkit/full_apps/other/shopping/chat_screen.dart';
import 'package:flutkit/full_apps/other/shopping/favourite_screen.dart';
import 'package:flutkit/full_apps/other/shopping/mega_menu_screen.dart';
import 'package:flutkit/full_apps/other/shopping/order_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/my_color_utils.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ShoppingProfileScreen extends StatefulWidget {
  final BuildContext root;

  const ShoppingProfileScreen({Key? key, required this.root}) : super(key: key);

  @override
  _ShoppingProfileScreenState createState() => _ShoppingProfileScreenState();
}

class _ShoppingProfileScreenState extends State<ShoppingProfileScreen> {
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
        body: ListView(
      padding:
          MySpacing.fromLTRB(20, MySpacing.safeAreaTop(context) + 20, 20, 20),
      children: <Widget>[
        Column(
          children: <Widget>[
            MyContainer.rounded(
              paddingAll: 0,
              width: 80,
              height: 80,
              child: Image(
                  image: AssetImage("./assets/images/profile/avatar_3.jpg"),
                  fit: BoxFit.fill),
            ),
            MySpacing.height(8),
            MyText.titleMedium("Derrick Malone",
                fontWeight: 600, letterSpacing: 0),
          ],
        ),
        MySpacing.height(24),
        MyContainer(
          color: theme.colorScheme.primary,
          padding: MySpacing.xy(16, 8),
          borderRadiusAll: 4,
          child: Row(
            children: <Widget>[
              Icon(LucideIcons.info,
                  color: theme.colorScheme.onPrimary, size: 18),
              MySpacing.width(16),
              Expanded(
                child: MyText.bodyMedium("Gold member",
                    color: MyColorUtils.goldColor,
                    fontWeight: 600,
                    letterSpacing: 0.2),
              ),
              MySpacing.width(16),
              MyText.bodySmall(
                "Upgrade",
                fontWeight: 600,
                letterSpacing: 0.2,
                color: theme.colorScheme.onPrimary,
              )
            ],
          ),
        ),
        MySpacing.height(24),
        Column(
          children: <Widget>[
            singleOption(
                iconData: LucideIcons.shapes,
                option: "Category",
                navigation: ShoppingCategoryScreen()),
            Divider(),
            singleOption(
                iconData: LucideIcons.clipboard,
                option: "History",
                navigation: ShoppingOrderScreen()),
            Divider(),
            singleOption(
                iconData: LucideIcons.heart,
                option: "Favourite",
                navigation: ShoppingFavouriteScreen()),
            Divider(),
            singleOption(
                iconData: LucideIcons.creditCard,
                option: "Payment",
                navigation: ShoppingAddCardScreen()),
            Divider(),
            singleOption(
                iconData: LucideIcons.menu,
                option: "Mega Menu",
                navigation: ShoppingMegaMenuScreen()),
            Divider(),
            singleOption(
                iconData: LucideIcons.smile,
                option: "Help & Support",
                navigation: ShoppingChatScreen()),
            MySpacing.height(24),
            Center(
              child: MyButton(
                elevation: 0,
                padding: MySpacing.xy(16, 16),
                backgroundColor: theme.colorScheme.primary,
                borderRadiusAll: 4,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      LucideIcons.logOut,
                      color: theme.colorScheme.onPrimary,
                      size: 18,
                    ),
                    MySpacing.width(16),
                    MyText.bodySmall("LOGOUT",
                        letterSpacing: 0.3,
                        fontWeight: 600,
                        color: theme.colorScheme.onPrimary)
                  ],
                ),
                onPressed: () {
                  Navigator.pop(widget.root);
                },
              ),
            ),
          ],
        )
      ],
    ));
  }

  Widget singleOption(
      {IconData? iconData, required String option, Widget? navigation}) {
    return Container(
      padding: MySpacing.y(8),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => navigation!));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              iconData,
              size: 22,
              color: theme.colorScheme.onBackground,
            ),
            MySpacing.width(16),
            Expanded(
              child: MyText.bodyLarge(option, fontWeight: 600),
            ),
            Icon(LucideIcons.chevronRight,
                size: 22, color: theme.colorScheme.onBackground),
          ],
        ),
      ),
    );
  }
}
