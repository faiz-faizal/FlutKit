/*
* File : Hotel Room
* Version : 1.0.0
* */

import 'dart:async';

import 'package:flutkit/apps/hotel/hotel_review_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_star_rating.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HotelRoomScreen extends StatefulWidget {
  @override
  _HotelRoomScreenState createState() => _HotelRoomScreenState();
}

class _HotelRoomScreenState extends State<HotelRoomScreen>
    with TickerProviderStateMixin {
  int _currentPage = 0, numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);

  late Timer timerAnimation;
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    timerAnimation = Timer.periodic(Duration(seconds: 4), (Timer timer) {
      if (_currentPage < numPages - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 800),
        curve: Curves.ease,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    timerAnimation.cancel();
    _pageController.dispose();
  }

  final String _aboutText =
      "Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content. It's also called placeholder (or filler) text. It's a convenient tool for mock-ups.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.zero,
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        Stack(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: PageView(
                pageSnapping: true,
                physics: ClampingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: <Widget>[
                  Image(
                    image: AssetImage('./assets/images/apps/hotel/room-1.jpg'),
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                  Image(
                    image: AssetImage('./assets/images/apps/hotel/room-2.jpg'),
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                  Image(
                    image: AssetImage('./assets/images/apps/hotel/room-3.jpg'),
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 24,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  LucideIcons.chevronLeft,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
        Container(
          padding: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MyText.titleMedium("Mandarin Oriental",
                        fontWeight: 600, letterSpacing: 0),
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            LucideIcons.mapPin,
                            color: theme.colorScheme.onBackground,
                            size: 16,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 2),
                              child: MyText.bodySmall("London bridge",
                                  fontWeight: 500)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  ClipOval(
                    child: Material(
                      color: theme.colorScheme.primary.withAlpha(24),
                      child: InkWell(
                        splashColor: theme.colorScheme.primary.withAlpha(100),
                        highlightColor: theme.primaryColor.withAlpha(20),
                        child: SizedBox(
                            width: 44,
                            height: 44,
                            child: Icon(
                              LucideIcons.share,
                              size: 22,
                              color: theme.colorScheme.primary.withAlpha(240),
                            )),
                        onTap: () {},
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    child: ClipOval(
                      child: Material(
                        color: theme.colorScheme.primary.withAlpha(24),
                        child: InkWell(
                          highlightColor: theme.primaryColor.withAlpha(20),
                          splashColor: theme.primaryColor.withAlpha(100),
                          child: SizedBox(
                              width: 44,
                              height: 44,
                              child: Icon(
                                LucideIcons.heart,
                                size: 20,
                                color: theme.colorScheme.primary,
                              )),
                          onTap: () {},
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 8, left: 16, right: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyText.bodyMedium("Price", fontWeight: 500),
                  MyText.bodyMedium("350 \$", fontWeight: 700)
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MyText.bodyMedium("Rating", fontWeight: 500),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        MyText.bodyMedium("4.6", fontWeight: 700),
                        Container(
                            margin: EdgeInsets.only(left: 4),
                            child: MyStarRating(rating: 4.1))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 24, left: 8, right: 8),
          child: Column(
            children: <Widget>[
              Row(
                children: const <Widget>[
                  Expanded(
                      child: _FacilityWidget(
                    iconData: LucideIcons.dollarSign,
                    text: "Low Cost",
                  )),
                  Expanded(
                      child: _FacilityWidget(
                    iconData: LucideIcons.car,
                    text: "Parking",
                  )),
                  Expanded(
                      child: _FacilityWidget(
                    iconData: LucideIcons.partyPopper,
                    text: "Party",
                  )),
                  Expanded(
                      child: _FacilityWidget(
                    iconData: LucideIcons.tv,
                    text: "Theater",
                  )),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Row(
                  children: const <Widget>[
                    Expanded(
                        child: _FacilityWidget(
                      iconData: LucideIcons.wine,
                      text: "Bar",
                    )),
                    Expanded(
                        child: _FacilityWidget(
                      iconData: LucideIcons.waves,
                      text: "Pool",
                    )),
                    Expanded(
                        child: _FacilityWidget(
                      iconData: LucideIcons.spade,
                      text: "Spa",
                    )),
                    Expanded(
                        child: _FacilityWidget(
                      iconData: LucideIcons.gamepad,
                      text: "Games",
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 24, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MyText.titleMedium("About", fontWeight: 600),
              Container(
                  margin: EdgeInsets.only(top: 8),
                  child: MyText.bodyMedium(_aboutText, fontWeight: 500))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 8, top: 8),
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 500),
                          transitionsBuilder: (
                            BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child,
                          ) =>
                              FadeTransition(
                                opacity: animation,
                                child: child,
                              ),
                          pageBuilder: (_, __, ___) => HotelReviewScreen()));
                },
                child: MyText.bodyMedium("REVIEW",
                    fontWeight: 600, color: theme.colorScheme.primary)),
          ),
        ),
      ],
    ));
  }
}

class _FacilityWidget extends StatelessWidget {
  final IconData iconData;
  final String text;

  const _FacilityWidget({Key? key, required this.iconData, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return MyContainer.bordered(
      margin: EdgeInsets.only(left: 8, right: 8),
      padding: EdgeInsets.only(top: 8, bottom: 8),
      child: Center(
        child: Column(
          children: <Widget>[
            Icon(
              iconData,
              color: theme.colorScheme.primary,
              size: 28,
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: MyText.bodySmall(text,
                  letterSpacing: 0,
                  fontWeight: 600,
                  color: theme.colorScheme.onBackground),
            )
          ],
        ),
      ),
    );
  }
}
