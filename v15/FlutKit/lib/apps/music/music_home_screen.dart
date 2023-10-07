/*
* File : Music Home
* Version : 1.0.0
* */

import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class MusicHomeScreen extends StatefulWidget {
  @override
  _MusicHomeScreenState createState() => _MusicHomeScreenState();
}

class _MusicHomeScreenState extends State<MusicHomeScreen> {
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
      padding: MySpacing.top(MySpacing.safeAreaTop(context) + 16),
      children: <Widget>[
        Center(
          child:
              MyText.titleMedium("Home", fontWeight: 600, letterSpacing: 0.2),
        ),
        Container(
          padding: EdgeInsets.only(top: 12, left: 20, bottom: 4),
          child:
              MyText.titleMedium("Recently", fontWeight: 600, letterSpacing: 0),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 8),
                child: _SingleSongWidget(
                  image: './assets/images/apps/music/singer-1.jpg',
                  text: "Song one",
                  height: 110,
                  radius: 6,
                ),
              ),
              _SingleSongWidget(
                image: './assets/images/apps/music/singer-2.jpg',
                text: "Song two",
                height: 110,
                radius: 6,
              ),
              _SingleSongWidget(
                image: './assets/images/apps/music/singer-3.jpg',
                text: "Song three",
                height: 110,
                radius: 6,
              ),
              Container(
                margin: EdgeInsets.only(right: 8),
                child: _SingleSongWidget(
                  image: './assets/images/apps/music/singer-4.jpg',
                  text: "Song four",
                  height: 110,
                  radius: 6,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 20, left: 20, bottom: 4),
          child:
              MyText.titleMedium("Trending", fontWeight: 600, letterSpacing: 0),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 8),
                child: _SingleSongWidget(
                  image: './assets/images/apps/music/singer-4.jpg',
                  text: "Trend one",
                  height: 110,
                  radius: 6,
                ),
              ),
              _SingleSongWidget(
                image: './assets/images/apps/music/singer-3.jpg',
                text: "Trend two",
                height: 110,
                radius: 6,
              ),
              _SingleSongWidget(
                image: './assets/images/apps/music/singer-2.jpg',
                text: "Trend three",
                height: 110,
                radius: 6,
              ),
              Container(
                margin: EdgeInsets.only(right: 8),
                child: _SingleSongWidget(
                  image: './assets/images/apps/music/singer-1.jpg',
                  text: "Trend four",
                  height: 110,
                  radius: 6,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 20, left: 20),
          child: MyText.titleMedium("Events of 2020",
              fontWeight: 600, letterSpacing: 0),
        ),
        Container(
          margin: EdgeInsets.all(8),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: <Widget>[
              _SingleSongWidget(
                image: './assets/images/apps/music/event-1.jpg',
                text: "Event one",
                height: MediaQuery.of(context).size.width * 0.5 - 24,
              ),
              _SingleSongWidget(
                image: './assets/images/apps/music/event-2.jpg',
                text: "Event two",
                height: MediaQuery.of(context).size.width * 0.5 - 24,
              ),
              _SingleSongWidget(
                  image: './assets/images/apps/music/event-3.jpg',
                  text: "Event three",
                  height: MediaQuery.of(context).size.width * 0.5 - 24),
              _SingleSongWidget(
                  image: './assets/images/apps/music/event-1.jpg',
                  text: "Event four",
                  height: MediaQuery.of(context).size.width * 0.5 - 24),
            ],
          ),
        ),
      ],
    ));
  }
}

class _SingleSongWidget extends StatelessWidget {
  final String image, text;
  final double? height, radius;

  const _SingleSongWidget(
      {Key? key,
      required this.image,
      required this.text,
      required this.height,
      this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.cover,
                height: height,
                width: height,
              )),
          Container(
              margin: EdgeInsets.only(top: 4),
              child: MyText.bodyMedium(text, fontWeight: 500))
        ],
      ),
    );
  }
}
