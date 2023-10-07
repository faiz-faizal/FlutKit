// ignore_for_file: unnecessary_string_escapes

import 'package:flutkit/full_apps/other/cookify/models/recipe.dart';
import 'package:flutkit/full_apps/other/cookify/views/recipe_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class CookifyHomeScreen extends StatefulWidget {
  @override
  _CookifyHomeScreenState createState() => _CookifyHomeScreenState();
}

class _CookifyHomeScreenState extends State<CookifyHomeScreen> {
  late Recipe recipe;
  late List<Recipe> trendingRecipe;
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    recipe = Recipe.getOne();
    trendingRecipe = Recipe.getList();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: customTheme.cookifyPrimary.withAlpha(40))),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            padding: MySpacing.top(24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: MySpacing.x(16),
                    child: MyText.headlineLarge("Hello Den,",
                        color: customTheme.cookifyPrimary, fontWeight: 800),
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
                        Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                                builder: (context) => CookifyRecipeScreen()));
                      },
                      splashColor: customTheme.cookifyPrimary.withAlpha(40),
                      color: customTheme.cookifyPrimary.withAlpha(30),
                      child: Row(
                        children: [
                          Icon(
                            Icons.outdoor_grill,
                            color: customTheme.cookifyPrimary,
                            size: 48,
                          ),
                          MySpacing.width(16),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText.bodySmall(
                                  "You have 12 recipes that\nyou haven\'t tried yet",
                                  fontWeight: 700),
                              MyButton.text(
                                  padding: MySpacing.zero,
                                  onPressed: () {},
                                  splashColor:
                                      customTheme.cookifyPrimary.withAlpha(40),
                                  child: MyText.labelMedium("See Recipes",
                                      color: customTheme.cookifyPrimary,
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
                        Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                                builder: (context) => CookifyRecipeScreen()));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: Stack(
                          children: [
                            Image(
                              image: AssetImage(recipe.image),
                            ),
                            Positioned(
                                left: 16,
                                top: 16,
                                child: MyContainer(
                                  paddingAll: 8,
                                  color:
                                      customTheme.cookifyPrimary.withAlpha(200),
                                  child: MyText.bodySmall(recipe.tag,
                                      color: customTheme.cookifyOnPrimary,
                                      fontWeight: 600),
                                )),
                            Positioned(
                                right: 16,
                                top: 16,
                                child: Icon(
                                  recipe.favorite
                                      ? Icons.bookmark
                                      : Icons.bookmark_outline,
                                  color: customTheme.cookifyPrimary,
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
                                        customTheme.cookifyPrimary
                                            .withAlpha(220),
                                        customTheme.cookifyPrimary
                                            .withAlpha(180),
                                        customTheme.cookifyPrimary
                                            .withAlpha(140),
                                        customTheme.cookifyPrimary
                                            .withAlpha(100),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MyText.headlineLarge(recipe.title,
                                          color: Colors.white, fontWeight: 800),
                                      MySpacing.height(16),
                                      MyText.bodySmall(
                                          "${recipe.preparationTime} Recipes | ${recipe.serving} Serving",
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
        ),
      ),
    );
  }

  List<Widget> recipeList() {
    List<Widget> list = [];
    list.add(MySpacing.width(16));

    for (int i = 0; i < trendingRecipe.length; i++) {
      list.add(singleRecipe(trendingRecipe[i]));
      list.add(MySpacing.width(16));
    }

    return list;
  }

  Widget singleRecipe(Recipe recipe) {
    return InkWell(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(builder: (context) => CookifyRecipeScreen()));
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
                      color: customTheme.cookifyOnPrimary, fontWeight: 600),
                )),
            Positioned(
                bottom: 16,
                left: 12,
                right: 12,
                child: MyContainer(
                  padding: MySpacing.xy(12, 16),
                  color:
                      Color.lerp(customTheme.cookifyPrimary, Colors.black, 0.9)!
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
                            recipe.favorite
                                ? Icons.bookmark
                                : Icons.bookmark_outline,
                            color: customTheme.cookifyPrimary,
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
}
