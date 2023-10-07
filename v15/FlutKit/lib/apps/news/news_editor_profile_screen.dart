import 'package:flutkit/apps/chat/chat_whatsapp_page.dart';
import 'package:flutkit/apps/news/single_news_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class NewsEditorProfileScreen extends StatefulWidget {
  @override
  _NewsEditorProfileScreenState createState() =>
      _NewsEditorProfileScreenState();
}

class _NewsEditorProfileScreenState extends State<NewsEditorProfileScreen> {
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
      padding: MySpacing.all(24),
      children: [
        Container(
          margin: MySpacing.top(24),
          padding: MySpacing.all(24),
          decoration: BoxDecoration(
              color: customTheme.card,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: customTheme.shadowColor,
                    blurRadius: 20,
                    spreadRadius: 2,
                    offset: Offset(0, 4))
              ]),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      child: Image(
                        image:
                            AssetImage('./assets/images/profile/avatar_2.jpg'),
                        height: 100,
                        width: 100,
                      )),
                  SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText.titleSmall("Maria M. Boyles",
                            color: theme.colorScheme.onBackground,
                            fontWeight: 700),
                        MyText.bodyMedium("Main Editor",
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0,
                            muted: true,
                            fontWeight: 600),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          padding: MySpacing.all(12),
                          decoration: BoxDecoration(
                              color: customTheme.card,
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  MyText.bodySmall("Articles",
                                      fontSize: 11,
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 600,
                                      letterSpacing: -0.2,
                                      xMuted: true),
                                  MyText.bodyLarge("54",
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 700),
                                ],
                              ),
                              Column(
                                children: [
                                  MyText.bodySmall("Followers",
                                      fontSize: 11,
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 600,
                                      letterSpacing: -0.2,
                                      xMuted: true),
                                  MyText.bodyLarge("670",
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 700),
                                ],
                              ),
                              Column(
                                children: [
                                  MyText.bodySmall("Rating",
                                      fontSize: 11,
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 600,
                                      letterSpacing: -0.2,
                                      xMuted: true),
                                  MyText.bodyLarge("8.8",
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 700),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatWhatsAppPage()));
                      },
                      style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all(MySpacing.xy(16, 0))),
                      child: MyText.bodyMedium("Chat",
                          color: theme.colorScheme.onBackground,
                          xMuted: true,
                          fontWeight: 600),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all(MySpacing.xy(16, 0))),
                      child: MyText.bodyMedium("Follow",
                          color: theme.colorScheme.onPrimary, fontWeight: 600),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          margin: MySpacing.top(16),
          child: MyText.titleLarge("Popular works",
              color: theme.colorScheme.onBackground,
              fontWeight: 700,
              letterSpacing: 0),
        ),
        Container(
          margin: MySpacing.top(4),
          child: MyText.titleSmall("Based on the popularity of articles",
              color: theme.colorScheme.onBackground,
              fontWeight: 600,
              letterSpacing: 0,
              xMuted: true),
        ),
        _singleNews(
            image: './assets/images/all/all-3.jpg',
            topic: "Politics",
            author: "Jennifer S. Smith",
            date: "Nov 6, 2020",
            headline: "Here's What's Keeping JasminAfter Bigg Boss 14",
            timeToRead: "10 min read"),
        _singleNews(
            image: './assets/images/all/all-4.jpg',
            topic: "Food",
            author: "Selena M. Waters",
            date: "March 12, 2020",
            headline: "Hunar Haat In Lucknow: When, Where, How Items",
            timeToRead: "3 min read"),
        _singleNews(
            image: './assets/images/all/all-5.jpg',
            topic: "Lifestyle",
            author: "Briana G. Holland",
            date: "April 31, 2020",
            headline: "5 Common Myths About Thyroid Disease Believing",
            timeToRead: "5 min read"),
        _singleNews(
            image: './assets/images/all/all-2.jpg',
            topic: "Science",
            author: "Emily G. Trice",
            date: "Dec 23, 2020",
            headline:
                "Joe Biden Plans Day One Orders To Reverse Trump Decisions.",
            timeToRead: "2 min read"),
      ],
    ));
  }

  _singleNews(
      {required String image,
      required String topic,
      required String headline,
      required String author,
      required String date,
      required String timeToRead}) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SingleNewsScreen()));
      },
      child: Container(
        margin: MySpacing.top(24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: Image.asset(
                  image,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                )),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText.bodyMedium(topic,
                      color: theme.colorScheme.onBackground,
                      fontWeight: 600,
                      xMuted: true),
                  SizedBox(
                    height: 4,
                  ),
                  MyText.bodyLarge(headline,
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                  SizedBox(
                    height: 8,
                  ),
                  MyText.titleSmall(author,
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                  Row(
                    children: [
                      MyText.bodyMedium(date,
                          color: theme.colorScheme.onBackground, xMuted: true),
                      SizedBox(
                        width: 12,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color:
                                theme.colorScheme.onBackground.withAlpha(100),
                            shape: BoxShape.circle),
                        width: 6,
                        height: 6,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      MyText.bodyMedium(timeToRead,
                          color: theme.colorScheme.onBackground, xMuted: true),
                      SizedBox(
                        width: 12,
                      ),
                      Icon(
                        LucideIcons.bookmark,
                        color: theme.colorScheme.primary,
                        size: 16,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
