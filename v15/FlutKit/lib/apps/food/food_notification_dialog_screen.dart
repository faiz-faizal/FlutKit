import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class NotificationDialog extends StatefulWidget {
  const NotificationDialog({super.key});

  @override
  State<NotificationDialog> createState() => _NotificationDialogState();
}

class _NotificationDialogState extends State<NotificationDialog> {
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: theme.colorScheme.background,
          elevation: 0,
          title: MyText.titleLarge("Notifications", fontWeight: 600),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 16),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  LucideIcons.x,
                  size: 20,
                  color: theme.colorScheme.onBackground,
                ),
              ),
            )
          ],
        ),
        body: Container(
            // color: theme.colorScheme.background,
            padding: EdgeInsets.all(16),
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(0),
              children: <Widget>[
                singleNotification(
                    iconData: LucideIcons.salad,
                    time: "Just Now ",
                    text: "Your order placed successfully"),
                singleNotification(
                    iconData: LucideIcons.x,
                    time: "1 Day ago",
                    text: "Your last order cancel due to payment issue"),
                singleNotification(
                    iconData: LucideIcons.check,
                    time: "3 Day ago",
                    text: "Burger order successfully deliver"),
                singleNotification(
                    iconData: LucideIcons.mail,
                    time: "1 Month ago",
                    text: "A new email from restaurant"),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Center(
                    child: MyText.bodyMedium("View all",
                        color: theme.colorScheme.primary, fontWeight: 500),
                  ),
                )
              ],
            )));
  }

  Widget singleNotification(
      {IconData? iconData, required String text, required String time}) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      decoration:
          BoxDecoration(color: theme.colorScheme.background, boxShadow: [
        BoxShadow(
            color: theme.shadowColor.withAlpha(12),
            blurRadius: 8,
            offset: Offset(0, 4))
      ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: theme.colorScheme.primary, shape: BoxShape.circle),
            child: Icon(
              iconData,
              color: theme.colorScheme.onPrimary,
              size: 22,
            ),
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.only(left: 18, right: 18),
                child: MyText(text)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              MyText.bodySmall(time,
                  color: theme.colorScheme.onBackground,
                  fontSize: 12,
                  muted: true,
                  fontWeight: 500,
                  letterSpacing: -0.2),
            ],
          )
        ],
      ),
    );
  }
}
