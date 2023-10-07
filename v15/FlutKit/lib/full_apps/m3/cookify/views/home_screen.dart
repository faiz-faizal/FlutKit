import 'package:flutkit/full_apps/m3/cookify/controllers/home_controller.dart';
import 'package:flutkit/full_apps/m3/cookify/models/recipe.dart';
import 'package:flutkit/full_apps/m3/cookify/views/recipe_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ThemeData theme;
  late HomeController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.cookifyTheme;
    controller = HomeController();
  }

  List<Widget> recipeList() {
    List<Widget> list = [];
    list.add(MySpacing.width(16));

    for (int i = 0; i < controller.trendingRecipe.length; i++) {
      list.add(singleRecipe(controller.trendingRecipe[i]));
      list.add(MySpacing.width(16));
    }

    return list;
  }

  Widget singleRecipe(Recipe recipe) {
    return InkWell(
      onTap: () {
        Navigator.of(context, rootNavigator: true)
            .push(MaterialPageRoute(builder: (context) => RecipeScreen()));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        child: Stack(
          children: [
            Image(
              image: AssetImage(recipe.image),
              width: 240,
            ),
            Positioned(
                left: 16,
                top: 16,
                child: MyContainer(
                  paddingAll: 8,
                  color: Colors.black.withAlpha(200),
                  child: MyText.bodySmall(recipe.tag,
                      color: theme.colorScheme.onPrimary, fontWeight: 600),
                )),
            Positioned(
                bottom: 16,
                left: 12,
                right: 12,
                child: MyContainer(
                  padding: MySpacing.xy(12, 16),
                  color:
                      Color.lerp(theme.colorScheme.primary, Colors.black, 0.9)!
                          .withAlpha(160),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: MyText.titleMedium(recipe.title,
                                color: Colors.white, fontWeight: 800),
                          ),
                          Icon(
                            recipe.favourite
                                ? Icons.bookmark
                                : Icons.bookmark_outline,
                            color: theme.colorScheme.primary,
                            size: 18,
                          )
                        ],
                      ),
                      MySpacing.height(16),
                      MyText.bodySmall(
                          "${recipe.preparationTime} Recipes | ${recipe.serving} Serving",
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: 600),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
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
        body: Padding(
          padding: MySpacing.top(MySpacing.safeAreaTop(context) + 16),
          child: LoadingEffect.getSearchLoadingScreen(context),
        ),
      );
    } else {
      return Scaffold(
        body: Container(
          padding: MySpacing.top(MySpacing.safeAreaTop(context) + 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: MySpacing.x(16),
                  child: MyText.displaySmall("Hello Den,",
                      color: theme.colorScheme.primary, fontWeight: 800),
                ),
                Container(
                  margin: MySpacing.x(16),
                  child: MyText.bodyMedium(
                      "Excited to cook something new today?",
                      color: theme.colorScheme.onBackground,
                      letterSpacing: 0,
                      xMuted: true,
                      fontWeight: 700),
                ),
                MySpacing.height(16),
                MyContainer(
                    margin: MySpacing.x(16),
                    onTap: () {
                      controller.goToRecipeScreen();
                    },
                    splashColor: theme.colorScheme.primary.withAlpha(40),
                    color: theme.colorScheme.primaryContainer,
                    child: Row(
                      children: [
                        Icon(
                          Icons.outdoor_grill,
                          color: theme.colorScheme.primary,
                          size: 48,
                        ),
                        MySpacing.width(16),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText.bodySmall(
                                "You have 12 recipes that\nyou haven't tried yet",
                                fontWeight: 700),
                            MyButton.text(
                                padding: MySpacing.zero,
                                onPressed: () {},
                                splashColor: theme.colorScheme.primary,
                                child: MyText.labelMedium("See Recipes",
                                    color: theme.colorScheme.primary,
                                    decoration: TextDecoration.underline))
                          ],
                        ))
                      ],
                    )),
                MySpacing.height(16),
                Container(
                  margin: MySpacing.x(16),
                  child: InkWell(
                    onTap: () {
                      controller.goToRecipeScreen();
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      child: Stack(
                        children: [
                          Image(
                            image: AssetImage(controller.recipe.image),
                          ),
                          Positioned(
                              left: 16,
                              top: 16,
                              child: MyContainer(
                                paddingAll: 8,
                                color: theme.colorScheme.primary.withAlpha(200),
                                child: MyText.bodySmall(controller.recipe.tag,
                                    color: theme.colorScheme.onPrimary,
                                    fontWeight: 600),
                              )),
                          Positioned(
                              right: 16,
                              top: 16,
                              child: Icon(
                                controller.recipe.favourite
                                    ? Icons.bookmark
                                    : Icons.bookmark_outline,
                                color: theme.colorScheme.primary,
                                size: 28,
                              )),
                          Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                padding: MySpacing.fromLTRB(16, 48, 16, 32),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                      theme.colorScheme.primary.withAlpha(220),
                                      theme.colorScheme.primary.withAlpha(180),
                                      theme.colorScheme.primary.withAlpha(140),
                                      theme.colorScheme.primary.withAlpha(100),
                                      Colors.transparent
                                    ],
                                        stops: const [
                                      0.1,
                                      0.25,
                                      0.5,
                                      0.7,
                                      1
                                    ])),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText.displaySmall(controller.recipe.title,
                                        color: Colors.white, fontWeight: 800),
                                    MySpacing.height(16),
                                    MyText.bodySmall(
                                        "${controller.recipe.preparationTime} Recipes | ${controller.recipe.serving} Serving",
                                        color: Colors.white,
                                        fontWeight: 600),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                MySpacing.height(16),
                Container(
                    margin: MySpacing.x(16),
                    child: MyText.titleMedium(
                      "Trending Recipe",
                      fontWeight: 800,
                    )),
                MySpacing.height(16),
                SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: recipeList(),
                  ),
                ),
                MySpacing.height(16),
              ],
            ),
          ),
        ),
      );
    }
  }
}
