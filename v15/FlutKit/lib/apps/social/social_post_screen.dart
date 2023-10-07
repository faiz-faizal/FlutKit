import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/generator.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SocialPostScreen extends StatefulWidget {
  @override
  _SocialPostScreenState createState() => _SocialPostScreenState();
}

class _SocialPostScreenState extends State<SocialPostScreen> {
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
      padding: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
      children: [
        Container(
          margin: MySpacing.fromLTRB(16, 0, 16, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  child: Image(
                    image: AssetImage('./assets/images/profile/avatar_2.jpg'),
                    width: 32,
                    height: 32,
                  )),
              Container(
                margin: MySpacing.left(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText.bodySmall("Charlize Avila",
                        color: theme.colorScheme.onBackground, fontWeight: 600),
                    MyText.bodySmall("Surat, Gujarat",
                        fontSize: 12,
                        color: theme.colorScheme.onBackground,
                        muted: true,
                        fontWeight: 500),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: MyText.bodySmall(
                    "12 min",
                    color: theme.colorScheme.onBackground,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: MySpacing.top(12),
          child: Image(
            image: AssetImage(
              './assets/images/apps/social/post-1.jpg',
            ),
            height: MediaQuery.of(context).size.height * 0.45,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: MySpacing.fromLTRB(24, 12, 24, 0),
          child: Row(
            children: [
              Icon(
                LucideIcons.heart,
                size: 20,
                color: theme.colorScheme.onBackground.withAlpha(200),
              ),
              Container(
                margin: MySpacing.left(16),
                child: Icon(LucideIcons.messageSquare,
                    size: 20,
                    color: theme.colorScheme.onBackground.withAlpha(200)),
              ),
              Container(
                margin: MySpacing.left(16),
                child: Icon(
                  LucideIcons.share,
                  size: 20,
                  color: theme.colorScheme.onBackground.withAlpha(200),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: MyText.bodySmall("7,327 views",
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: MySpacing.fromLTRB(24, 12, 24, 0),
          child: MyText.bodySmall(
              Generator.getParagraphsText(
                  withEmoji: true,
                  paragraph: 2,
                  words: 18,
                  noOfNewLine: 1,
                  withHyphen: true),
              color: theme.colorScheme.onBackground),
        ),
        Container(
          margin: MySpacing.fromLTRB(24, 8, 24, 0),
          child: MyText.bodySmall("View all 28 comments",
              color: theme.colorScheme.onBackground,
              xMuted: true,
              letterSpacing: -0.2),
        ),
        Container(
          margin: MySpacing.fromLTRB(24, 16, 24, 0),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  style: MyTextStyle.bodyMedium(
                      color: theme.colorScheme.onBackground,
                      fontWeight: 500,
                      fontSize: 12),
                  decoration: InputDecoration(
                      fillColor: customTheme.card,
                      hintStyle: MyTextStyle.bodySmall(
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500,
                          muted: true,
                          letterSpacing: 0,
                          fontSize: 12),
                      filled: true,
                      hintText: "Comment me",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      isDense: true,
                      contentPadding: MySpacing.all(12)),
                  textCapitalization: TextCapitalization.sentences,
                ),
              ),
              Container(
                margin: MySpacing.left(16),
                child: MyText.bodySmall("Post",
                    color: theme.colorScheme.primary.withAlpha(200),
                    fontWeight: 500),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
