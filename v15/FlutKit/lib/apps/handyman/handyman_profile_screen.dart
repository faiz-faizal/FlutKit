import 'package:flutkit/apps/handyman/handyman_subscription_screen.dart';
import 'package:flutkit/full_apps/other/shopping/chat_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/generator.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HandymanProfileScreen extends StatefulWidget {
  @override
  _HandymanProfileScreenState createState() => _HandymanProfileScreenState();
}

class _HandymanProfileScreenState extends State<HandymanProfileScreen> {
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
    return SafeArea(
      child: Scaffold(
          body: ListView(
        padding: EdgeInsets.all(24),
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Column(
              children: <Widget>[
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image:
                            AssetImage("./assets/images/profile/avatar_3.jpg"),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: MyText.titleMedium("Derrick Malone",
                      fontWeight: 600, letterSpacing: 0),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24),
            padding: EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 16),
            decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.all(Radius.circular(4))),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HandymanSubscriptionScreen()));
              },
              child: Row(
                children: <Widget>[
                  Icon(LucideIcons.info,
                      color: theme.colorScheme.onPrimary, size: 18),
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: MyText.bodyMedium("Premium member",
                        color: Generator.goldColor,
                        fontWeight: 600,
                        letterSpacing: 0.2),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: MyText.bodySmall("Upgrade",
                          color: theme.colorScheme.onPrimary,
                          fontWeight: 600,
                          letterSpacing: 0.2),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24),
            child: Column(
              children: <Widget>[
                singleOption(iconData: LucideIcons.mapPin, option: "Address"),
                Divider(),
                singleOption(
                    iconData: LucideIcons.creditCard,
                    option: "Subscriptions",
                    navigation: HandymanSubscriptionScreen()),
                Divider(),
                singleOption(
                    iconData: LucideIcons.smile,
                    option: "Help & Support",
                    navigation: ShoppingChatScreen()),
                Container(
                  margin: EdgeInsets.only(top: 24),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStatePropertyAll(0),
                        padding:
                            MaterialStateProperty.all(MySpacing.xy(16, 0))),
                    onPressed: () {
                      // Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          LucideIcons.logOut,
                          color: theme.colorScheme.onPrimary,
                          size: 18,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 16),
                          child: MyText.bodySmall("LOGOUT",
                              letterSpacing: 0.3,
                              fontWeight: 600,
                              color: theme.colorScheme.onPrimary),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }

  Widget singleOption(
      {IconData? iconData, required String option, Widget? navigation}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: InkWell(
        onTap: () {
          if (navigation != null) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => navigation));
          }
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              iconData,
              size: 22,
              color: theme.colorScheme.onBackground,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 16),
                child: MyText.bodyLarge(option, fontWeight: 600),
              ),
            ),
            Icon(LucideIcons.chevronRight,
                size: 22, color: theme.colorScheme.onBackground),
          ],
        ),
      ),
    );
  }
}
