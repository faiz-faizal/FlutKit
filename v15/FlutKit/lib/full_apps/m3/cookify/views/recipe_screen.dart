import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/full_apps/m3/cookify/controllers/recipe_controller.dart';
import 'package:flutkit/full_apps/m3/cookify/models/ingredient.dart';
import 'package:flutkit/full_apps/m3/cookify/models/nutrition.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/my_utils.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecipeScreen extends StatefulWidget {
  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  late ThemeData theme;
  late RecipeController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.cookifyTheme;
    controller = RecipeController();
  }

  List<Widget> buildNutritionList() {
    List<Widget> list = [];
    for (int i = 0; i < controller.recipe.nutritions.length; i++) {
      list.add(singleNutrition(controller.recipe.nutritions[i]));
      if (i + 1 < controller.recipe.nutritions.length) {
        list.add(MySpacing.height(16));
      }
    }
    return list;
  }

  Widget singleNutrition(Nutrition nutrition) {
    return MyContainer(
      borderRadiusAll: 50,
      padding: MySpacing.fromLTRB(8, 8, 12, 8),
      color: theme.colorScheme.primaryContainer,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MyContainer.bordered(
              paddingAll: 4,
              width: 32,
              height: 32,
              borderRadiusAll: 16,
              color: theme.colorScheme.primary.withAlpha(200),
              border: Border.all(color: theme.colorScheme.primary, width: 1),
              child: Center(
                  child: MyText.bodySmall(
                      MyTextUtils.doubleToString(
                        nutrition.unit,
                      ),
                      letterSpacing: 0,
                      color: theme.colorScheme.onPrimary))),
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
    for (Ingredient ingredient in controller.recipe.ingredients) {
      list.add(MyText.bodySmall(ingredient.ingredient,
          muted: true, height: 1.7, letterSpacing: 0));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: theme.colorScheme.primaryContainer)),
      child: GetBuilder<RecipeController>(
          init: controller,
          tag: 'recipe_controller',
          builder: (controller) {
            return _buildBody();
          }),
    );
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
              color: theme.colorScheme.primary,
            ),
            MySpacing.width(16)
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: theme.colorScheme.primary,
          label: MyText.bodyMedium("Watch Video",
              color: theme.colorScheme.onPrimary, fontWeight: 600),
          icon: Icon(
            Icons.play_circle_fill,
            color: theme.colorScheme.onPrimary,
          ),
        ),
        body: Container(
          color: theme.scaffoldBackgroundColor,
          child: ListView(
            padding: MySpacing.fromLTRB(24, 4, 24, 0),
            children: [
              MyText.displaySmall(controller.recipe.title,
                  fontWeight: 800, letterSpacing: -0.2),
              MySpacing.height(8),
              MyText.bodyMedium(controller.recipe.body,
                  color: theme.colorScheme.onBackground.withAlpha(140),
                  letterSpacing: 0,
                  fontWeight: 600),
              MySpacing.height(24),
              Row(
                children: [
                  Column(
                    children: [
                      MyText.titleLarge("Nutritions",
                          fontWeight: 700, letterSpacing: -0.2),
                      MySpacing.height(16),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: buildNutritionList()),
                    ],
                  ),
                  MySpacing.width(24),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: Image(
                        image: AssetImage(controller.recipe.image),
                        height: 200,
                        fit: BoxFit.cover,
                      ),
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
              MyText.bodyMedium(controller.recipe.preparation,
                  fontWeight: 500, letterSpacing: 0, muted: true),
              MySpacing.height(80)
            ],
          ),
        ),
      );
    }
  }
}
