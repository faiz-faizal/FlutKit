import 'package:flutkit/apps/news/single_news_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class NewsVideoScreen extends StatefulWidget {
  @override
  _NewsVideoScreenState createState() => _NewsVideoScreenState();
}

class _NewsVideoScreenState extends State<NewsVideoScreen> {
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
          appBar: AppBar(
            elevation: 0,
            title: MyText.titleMedium("Videos",
                color: theme.colorScheme.onBackground, fontWeight: 600),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: ListView(
            padding: MySpacing.x(20),
            children: <Widget>[
              _singleVideoNews(
                  image: './assets/images/all/all-7.jpg',
                  title: "The Man Who Paid Rs. 55 Lakh To Increase His Height",
                  duration: "22:30",
                  views: "25k"),
              _singleVideoNews(
                  image: './assets/images/all/all-8.jpg',
                  title: "MINI India Sells 512 Vehicles In 2020",
                  duration: "5:45",
                  views: "1M"),
              _singleVideoNews(
                  image: './assets/images/all/all-9.jpg',
                  title:
                      "Steve Smith Released By Rajasthan Royals Ahead Auctions",
                  duration: "10:45",
                  views: "3M"),
              _singleVideoNews(
                  image: './assets/images/all/all-10.jpg',
                  title: "5 Common Myths About Thyroid Disease You Believing",
                  duration: "14:55",
                  views: "5k"),
              _singleVideoNews(
                  image: './assets/images/all/all-11.jpg',
                  title:
                      "Hunar Haat In Lucknow: When, Where, How Handmade Items",
                  duration: "20:00",
                  views: "700"),
            ],
          )),
    );
  }

  _singleVideoNews(
      {required String image,
      required String title,
      required String duration,
      required String views}) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SingleNewsScreen()));
      },
      child: Container(
        margin: MySpacing.bottom(20),
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
                  MyText.titleSmall(title, fontWeight: 60),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Icon(
                        LucideIcons.clock,
                        color: theme.colorScheme.onBackground.withAlpha(200),
                        size: 16,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      MyText.bodySmall(duration,
                          color: theme.colorScheme.onBackground),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Icon(
                        LucideIcons.eye,
                        color: theme.colorScheme.onBackground.withAlpha(200),
                        size: 16,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      MyText.bodySmall("$views views",
                          color: theme.colorScheme.onBackground),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
