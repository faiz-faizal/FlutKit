import 'package:flutkit/full_apps/other/cookify/models/full_recipe.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/my_utils.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class CookifyRecipeScreen extends StatefulWidget {
  @override
  _CookifyRecipeScreenState createState() => _CookifyRecipeScreenState();
}

class _CookifyRecipeScreenState extends State<CookifyRecipeScreen> {
  late FullRecipe recipe;
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    recipe = FullRecipe.getSingle();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: customTheme.cookifyPrimary.withAlpha(40))),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.chevron_left,
              color: theme.colorScheme.onBackground,
            ),
          ),
          actions: [
            Icon(
              Icons.favorite_border,
              color: customTheme.cookifyPrimary,
            ),
            MySpacing.width(16)
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: customTheme.cookifyPrimary,
          label: MyText.bodyMedium("Watch Video",
              color: customTheme.cookifyOnPrimary, fontWeight: 600),
          icon: Icon(
            Icons.play_circle_fill,
            color: customTheme.cookifyOnPrimary,
          ),
        ),
        body: Container(
          color: theme.scaffoldBackgroundColor,
          child: ListView(
            padding: MySpacing.fromLTRB(24, 4, 24, 0),
            children: [
              MyText.displaySmall(recipe.title,
                  fontWeight: 800, letterSpacing: -0.2),
              MySpacing.height(8),
              MyText.bodyMedium(recipe.body,
                  color: theme.colorScheme.onBackground.withAlpha(140),
                  letterSpacing: 0,
                  fontWeight: 600),
              MySpacing.height(24),
              Row(
                children: [
                  Column(
                    children: [
                      MyText.titleLarge("Nutrition",
                          fontWeight: 700, letterSpacing: -0.2),
                      MySpacing.height(16),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: buildNutritionList()),
                    ],
                  ),
                  Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image(
                      image: AssetImage(recipe.image),
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              MySpacing.height(24),
              MyText.titleLarge("Ingredients",
                  fontWeight: 700, letterSpacing: -0.2),
              MySpacing.height(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: buildIngredientList(),
              ),
              MySpacing.height(24),
              MyText.titleLarge("Preparation",
                  fontWeight: 700, letterSpacing: -0.2),
              MySpacing.height(16),
              MyText.bodyMedium(recipe.preparation,
                  fontWeight: 500, letterSpacing: 0, muted: true),
              MySpacing.height(80)
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildNutritionList() {
    List<Widget> list = [];
    for (int i = 0; i < recipe.nutritions.length; i++) {
      list.add(singleNutrition(recipe.nutritions[i]));
      if (i + 1 < recipe.nutritions.length) list.add(MySpacing.height(16));
    }
    return list;
  }

  Widget singleNutrition(Nutrition nutrition) {
    return MyContainer(
      borderRadiusAll: 50,
      padding: MySpacing.fromLTRB(8, 8, 12, 8),
      color: customTheme.cookifyPrimary.withAlpha(40),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MyContainer.bordered(
              paddingAll: 4,
              width: 32,
              height: 32,
              borderRadiusAll: 16,
              color: customTheme.cookifyPrimary.withAlpha(200),
              border: Border.all(color: customTheme.cookifyPrimary, width: 1),
              child: Center(
                  child: MyText.bodySmall(
                      MyTextUtils.doubleToString(
                        nutrition.unit,
                      ),
                      letterSpacing: 0,
                      color: customTheme.cookifyOnPrimary))),
          MySpacing.width(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText.bodySmall(nutrition.name, fontWeight: 600),
              MyText.bodySmall(nutrition.unitType,
                  fontSize: 10, xMuted: true, fontWeight: 600),
            ],
          )
        ],
      ),
    );
  }

  List<Widget> buildIngredientList() {
    List<Widget> list = [];
    for (Ingredient ingredient in recipe.ingredients) {
      list.add(MyText.bodySmall(ingredient.ingredient,
          muted: true, height: 1.7, letterSpacing: 0));
    }
    return list;
  }
}
