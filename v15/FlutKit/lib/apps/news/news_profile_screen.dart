import 'package:flutkit/apps/profile/edit_profile_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class NewsProfileScreen extends StatefulWidget {
  @override
  _NewsProfileScreenState createState() => _NewsProfileScreenState();
}

class _NewsProfileScreenState extends State<NewsProfileScreen> {
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
        body: ListView(
      padding:
          MySpacing.fromLTRB(20, MySpacing.safeAreaTop(context) + 20, 20, 20),
      children: <Widget>[
        _upgradeWidget(),
        Container(
          margin: MySpacing.top(20),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color: theme.colorScheme.primary),
                padding: MySpacing.all(10),
                child: Icon(
                  LucideIcons.settings2,
                  size: 20,
                  color: theme.colorScheme.onPrimary,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText.bodyMedium("Account",
                      color: theme.colorScheme.onBackground, fontWeight: 700),
                  MyText.labelSmall("Edit and manage your account details",
                      color: theme.colorScheme.onBackground,
                      letterSpacing: 0,
                      muted: true,
                      fontWeight: 600)
                ],
              )
            ],
          ),
        ),
        Container(
          margin: MySpacing.top(20),
          padding: MySpacing.vertical(8),
          decoration: BoxDecoration(
            color: customTheme.card,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditProfileScreen()));
                },
                leading: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: Image(
                      image: AssetImage('./assets/images/profile/avatar_2.jpg'),
                      height: 44,
                      width: 44,
                    )),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText.titleSmall("Maria M. Boyles",
                        color: theme.colorScheme.onBackground, fontWeight: 700),
                    MyText.bodyMedium("Editor",
                        color: theme.colorScheme.onBackground,
                        letterSpacing: 0,
                        muted: true,
                        fontWeight: 600)
                  ],
                ),
                trailing: Icon(
                  LucideIcons.chevronRight,
                  color: theme.colorScheme.onBackground,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText.bodyMedium("Email",
                        color: theme.colorScheme.onBackground,
                        letterSpacing: 0,
                        xMuted: true,
                        fontWeight: 600),
                    MyText.titleSmall("maria@coderthemes.com",
                        color: theme.colorScheme.onBackground, fontWeight: 600)
                  ],
                ),
                trailing: Icon(
                  LucideIcons.chevronRight,
                  color: theme.colorScheme.onBackground,
                ),
              ),
              Divider(),
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText.bodyMedium("Phone",
                        color: theme.colorScheme.onBackground,
                        letterSpacing: 0,
                        xMuted: true,
                        fontWeight: 600),
                    MyText.titleSmall("+91 98765 43210",
                        color: theme.colorScheme.onBackground, fontWeight: 600)
                  ],
                ),
                trailing: Icon(
                  LucideIcons.chevronRight,
                  color: theme.colorScheme.onBackground,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: MySpacing.top(20),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color: theme.colorScheme.primary),
                padding: MySpacing.all(10),
                child: Icon(
                  LucideIcons.mailOpen,
                  size: 20,
                  color: theme.colorScheme.onPrimary,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText.bodyMedium("Help and Feedback",
                      color: theme.colorScheme.onBackground, fontWeight: 700),
                  MyText.labelSmall("Reach us with your feedback and questions",
                      color: theme.colorScheme.onBackground,
                      letterSpacing: 0,
                      muted: true,
                      fontWeight: 600)
                ],
              )
            ],
          ),
        ),
        Container(
          margin: MySpacing.top(20),
          padding: MySpacing.vertical(8),
          decoration: BoxDecoration(
            color: customTheme.card,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Column(
            children: [
              ListTile(
                leading: Icon(
                  LucideIcons.mailQuestion,
                  color: theme.colorScheme.onBackground,
                ),
                title: MyText.bodyLarge("FAQs",
                    color: theme.colorScheme.onBackground, fontWeight: 600),
                trailing: Icon(
                  LucideIcons.chevronRight,
                  color: theme.colorScheme.onBackground,
                ),
              ),
              Divider(
                height: 0,
              ),
              ListTile(
                leading: Icon(
                  LucideIcons.youtube,
                  color: theme.colorScheme.onBackground,
                ),
                title: MyText.bodyLarge("Videos",
                    color: theme.colorScheme.onBackground, fontWeight: 600),
                trailing: Icon(
                  LucideIcons.chevronRight,
                  color: theme.colorScheme.onBackground,
                ),
              ),
              Divider(
                height: 0,
              ),
              ListTile(
                leading: Icon(
                  LucideIcons.mail,
                  color: theme.colorScheme.onBackground,
                ),
                title: MyText.bodyLarge("Contact us",
                    color: theme.colorScheme.onBackground, fontWeight: 600),
                trailing: Icon(
                  LucideIcons.chevronRight,
                  color: theme.colorScheme.onBackground,
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  _upgradeWidget() {
    return Container(
      decoration: BoxDecoration(
          color: customTheme.card,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: customTheme.border, width: 1)),
      padding: MySpacing.all(20),
      child: Column(
        children: [
          MyText.bodyLarge("Become Pro",
              color: theme.colorScheme.onBackground, fontWeight: 600),
          MyText.bodyMedium("Get more done with pro",
              color: theme.colorScheme.onBackground, fontWeight: 500),
          Container(
            margin: MySpacing.top(8),
            padding: MySpacing.fromLTRB(20, 8, 20, 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                color: theme.colorScheme.primary),
            child: MyText.bodySmall("Upgrade now",
                color: theme.colorScheme.onPrimary,
                fontWeight: 600,
                letterSpacing: 0.3),
          )
        ],
      ),
    );
  }
}
