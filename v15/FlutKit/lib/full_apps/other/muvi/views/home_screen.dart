import 'package:flutkit/full_apps/other/muvi/controllers/home_controller.dart';
import 'package:flutkit/full_apps/other/muvi/models/movie.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_star_rating.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = HomeController();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  Widget _buildSingleMovie(Movie movie) {
    return MyContainer(
      onTap: () {
        controller.goToSingleMovieScreen(movie);
      },
      borderRadiusAll: 4,
      paddingAll: 0,
      // margin: MySpacing.right(20),
      color: theme.scaffoldBackgroundColor,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyContainer(
            borderRadiusAll: 4,
            paddingAll: 0,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image(
              height: 150,
              width: 120,
              fit: BoxFit.fill,
              image: AssetImage(movie.image),
            ),
          ),
          MySpacing.height(8),
          MyText.bodyMedium(
            movie.name,
            fontWeight: 600,
          ),
          MySpacing.height(4),
          MyText.bodySmall(
            movie.production,
            xMuted: true,
          ),
          MySpacing.height(4),
          MyStarRating(
            size: 18,
            spacing: 4,
            activeColor: customTheme.muviPrimary,
            inactiveColor: customTheme.muviPrimary.withAlpha(100),
            inactiveStarFilled: true,
            showInactive: true,
            rating: movie.ratings,
          ),
        ],
      ),
    );
  }

  List<Widget> _buildTrendingList() {
    List<Widget> list = [];
    list.add(MySpacing.width(20));
    for (int i = 0; i < 5; i++) {
      list.add(_buildSingleMovie(controller.movies![i]));
      list.add(MySpacing.width(20));
    }
    return list;
  }

  List<Widget> _buildHollyWoodList() {
    List<Widget> list = [];
    list.add(MySpacing.width(20));
    for (int i = 0; i < controller.movies!.length - 5; i++) {
      list.add(_buildSingleMovie(controller.movies![i + 5]));
      list.add(MySpacing.width(20));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: controller,
        tag: 'home_controller',
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
          body: Container(
              margin: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
              child: LoadingEffect.getSearchLoadingScreen(
                context,
              )));
    } else {
      return Scaffold(
        body: ListView(
          padding:
              MySpacing.fromLTRB(0, MySpacing.safeAreaTop(context) + 20, 0, 20),
          children: [
            MyContainer(
              onTap: () {
                controller.goToSubscriptionScreen();
              },
              paddingAll: 0,
              margin: MySpacing.x(20),
              borderRadiusAll: 4,
              height: 210,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                children: [
                  Image(
                    height: 210,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/apps/muvi/banner.jpg'),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 30,
                    right: 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText.bodyMedium(
                                'Avengers : Endgame',
                                color: customTheme.muviOnPrimary,
                                letterSpacing: 0.3,
                                fontWeight: 600,
                              ),
                              MySpacing.height(8),
                              MyText.bodySmall(
                                'Marvel Studio',
                                color: customTheme.muviOnPrimary,
                                letterSpacing: 0.3,
                              ),
                            ],
                          ),
                        ),
                        MyContainer.none(
                            padding: MySpacing.fromLTRB(12, 6, 12, 6),
                            color: customTheme.muviPrimary,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16)),
                            child: MyText.labelMedium(
                              'Premium',
                              color: customTheme.muviOnPrimary,
                              letterSpacing: 0.3,
                            ))
                      ],
                    ),
                  ),
                  // Positioned(
                  //   right: 20,
                  //   bottom: -20,
                  //   child: MyContainer.rounded(
                  //     paddingAll: 8,
                  //     color: customTheme.muviPrimary,
                  //     child: Icon(
                  //       Icons.play_arrow,
                  //       color: customTheme.muviOnPrimary,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            MySpacing.height(20),
            Padding(
              padding: MySpacing.x(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText.bodyMedium(
                    'Trending',
                    fontWeight: 600,
                  ),
                  MyText.bodySmall(
                    'See All',
                    color: customTheme.muviPrimary,
                  ),
                ],
              ),
            ),
            MySpacing.height(20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _buildTrendingList(),
              ),
            ),
            MySpacing.height(20),
            Padding(
              padding: MySpacing.x(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText.bodyMedium(
                    'Hollywood',
                    fontWeight: 600,
                  ),
                  MyText.bodySmall(
                    'See All',
                    color: customTheme.muviPrimary,
                  ),
                ],
              ),
            ),
            MySpacing.height(20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _buildHollyWoodList(),
              ),
            ),
          ],
        ),
      );
    }
  }
}
