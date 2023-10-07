import 'package:flutkit/apps/social/social_profile_detail_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SocialProfileScreen extends StatefulWidget {
  @override
  _SocialProfileScreenState createState() => _SocialProfileScreenState();
}

class _SocialProfileScreenState extends State<SocialProfileScreen> {
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
        body: Stack(
      children: [
        Image(
          image: AssetImage('./assets/images/apps/social/profile-p1.jpg'),
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
          top: MySpacing.safeAreaTop(context) + 20,
          left: 24,
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                LucideIcons.chevronLeft,
                size: 24,
                color: Colors.black,
              )),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.black.withAlpha(220),
              Colors.black.withAlpha(160),
              Colors.black.withAlpha(100),
              Colors.black.withAlpha(0)
            ], stops: const [
              0.25,
              0.5,
              0.75,
              1
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
            padding: MySpacing.fromLTRB(24, 56, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.headlineSmall("Zayn Molloy",
                    color: Colors.white, fontWeight: 700),
                MyText.bodyMedium("Fashion Model",
                    color: Colors.white, muted: true, fontWeight: 500),
                Container(
                  margin: MySpacing.top(24),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            MyText.titleMedium("125",
                                color: Colors.white, fontWeight: 600),
                            Container(
                              margin: MySpacing.top(4),
                              child: MyText.bodyMedium("Posts",
                                  color: Colors.white,
                                  muted: true,
                                  fontWeight: 400),
                            ),
                          ],
                        ),
                        VerticalDivider(),
                        Column(
                          children: [
                            MyText.titleMedium("250",
                                color: Colors.white, fontWeight: 600),
                            Container(
                              margin: MySpacing.top(4),
                              child: MyText.bodyMedium("Following",
                                  color: Colors.white,
                                  muted: true,
                                  fontWeight: 400),
                            ),
                          ],
                        ),
                        VerticalDivider(),
                        Column(
                          children: [
                            MyText.titleMedium("1.2M",
                                color: Colors.white, fontWeight: 600),
                            Container(
                              margin: MySpacing.top(4),
                              child: MyText.bodyMedium("Followers",
                                  color: Colors.white,
                                  muted: true,
                                  fontWeight: 400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: MySpacing.top(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  MySpacing.xy(16, 0))),
                          onPressed: () {},
                          child: MyText.bodyMedium("Follow",
                              fontWeight: 600,
                              color: theme.colorScheme.onPrimary),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SocialProfileDetailScreen()));
                        },
                        child: Container(
                            margin: MySpacing.left(16),
                            decoration: BoxDecoration(
                              color: Colors.white.withAlpha(120),
                              shape: BoxShape.circle,
                            ),
                            padding: MySpacing.all(4),
                            child: Icon(
                              LucideIcons.arrowRight,
                              size: 20,
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
