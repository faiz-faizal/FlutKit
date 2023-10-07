import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class NotificationDialog extends StatefulWidget {
  @override
  _NotificationDialogState createState() => _NotificationDialogState();
}

class _NotificationDialogState extends State<NotificationDialog> {
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
          automaticallyImplyLeading: false,
          title: MyText.titleMedium("Notification", fontWeight: 600),
          actions: <Widget>[
            Container(
              margin: MySpacing.right(16),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  LucideIcons.x,
                  size: 24,
                  color: theme.colorScheme.onBackground,
                ),
              ),
            )
          ],
        ),
        body: ListView(
          padding: MySpacing.all(16),
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                MyText.bodyLarge(
                  "Offers",
                  fontWeight: 600,
                ),
                MyContainer.rounded(
                  margin: MySpacing.left(8),
                  width: 18,
                  paddingAll: 0,
                  height: 18,
                  color: customTheme.groceryPrimary.withAlpha(40),
                  child: Center(
                      child: MyText.labelSmall(
                    "2",
                    fontWeight: 600,
                    color: customTheme.groceryPrimary,
                  )),
                )
              ],
            ),
            MySpacing.height(24),
            singleNotification(
                image: './assets/images/apps/grocery/product-5.png',
                text: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "50% OFF ",
                        style: MyTextStyle.labelMedium(
                            color: customTheme.groceryPrimary,
                            fontWeight: 600,
                            letterSpacing: 0.2)),
                    TextSpan(
                      text: "in ultraboost all puma ltd shoes",
                      style: MyTextStyle.labelMedium(
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500,
                          letterSpacing: 0.2),
                    )
                  ]),
                ),
                time: "9:35 AM"),
            MySpacing.height(24),
            singleNotification(
                image: './assets/images/apps/grocery/product-2.png',
                text: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "30% OFF ",
                        style: MyTextStyle.labelMedium(
                            color: customTheme.groceryPrimary,
                            fontWeight: 600,
                            letterSpacing: 0.2)),
                    TextSpan(
                        text: "in all cake till 31 july",
                        style: MyTextStyle.labelMedium(
                            color: theme.colorScheme.onBackground,
                            fontWeight: 500,
                            letterSpacing: 0.2))
                  ]),
                ),
                time: "9:35 AM"),
            MySpacing.height(24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                MyText.bodyLarge(
                  "Orders",
                  fontWeight: 600,
                ),
                MyContainer.rounded(
                  margin: MySpacing.left(8),
                  width: 18,
                  paddingAll: 0,
                  height: 18,
                  color: customTheme.groceryPrimary.withAlpha(40),
                  child: Center(
                      child: MyText.labelSmall(
                    "8",
                    fontWeight: 600,
                    color: customTheme.groceryPrimary,
                  )),
                )
              ],
            ),
            MySpacing.height(24),
            singleNotification(
                image: './assets/images/apps/grocery/product-3.png',
                text: MyText.labelMedium(
                    "Your cake order has been delivered at Himalaya",
                    color: theme.colorScheme.onBackground,
                    fontWeight: 500,
                    letterSpacing: 0),
                time: "Just Now"),
            MySpacing.height(24),
            singleNotification(
                image: './assets/images/apps/grocery/product-2.png',
                text: MyText.labelMedium(
                    "last order has been cancelled by seller",
                    color: theme.colorScheme.onBackground,
                    fontWeight: 500,
                    letterSpacing: 0),
                time: "14 July"),
            MySpacing.height(24),
            Center(
              child: MyButton.text(
                splashColor: customTheme.groceryPrimary.withAlpha(40),
                child: MyText.labelMedium("View all",
                    color: customTheme.groceryPrimary,
                    fontWeight: 600,
                    letterSpacing: 0.2),
                onPressed: () {},
              ),
            ),
            MySpacing.height(24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                MyText.bodyLarge(
                  "Security",
                  fontWeight: 600,
                ),
                MyContainer.rounded(
                  margin: MySpacing.left(8),
                  width: 18,
                  paddingAll: 0,
                  height: 18,
                  color: customTheme.groceryPrimary.withAlpha(40),
                  child: Center(
                      child: MyText.labelSmall(
                    "1",
                    fontWeight: 600,
                    color: customTheme.groceryPrimary,
                  )),
                )
              ],
            ),
            MySpacing.height(24),
            singleNotification(
                image: './assets/images/apps/grocery/profile.png',
                text: MyText.labelMedium(
                    "Your account password has been changed",
                    color: theme.colorScheme.onBackground,
                    fontWeight: 500,
                    letterSpacing: 0),
                time: "2 days ago"),
          ],
        ),
      ),
    );
  }

  Widget singleNotification(
      {required String image, Widget? text, required String time}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        MyContainer.rounded(
          width: 52,
          height: 52,
          padding: MySpacing.all(10),
          color: customTheme.groceryPrimary.withAlpha(40),
          child: Image.asset(image),
        ),
        Expanded(
          child: Container(margin: MySpacing.horizontal(16), child: text),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            MyText.bodySmall(time,
                muted: true, fontWeight: 500, letterSpacing: -0.2),
          ],
        )
      ],
    );
  }
}
