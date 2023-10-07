import 'package:flutkit/full_apps/m3/cookify/controllers/showcase_controller.dart';
import 'package:flutkit/full_apps/m3/cookify/models/category.dart';
import 'package:flutkit/full_apps/m3/cookify/models/showcase.dart';
import 'package:flutkit/full_apps/m3/cookify/views/recipe_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ShowcaseScreen extends StatefulWidget {
  @override
  _ShowcaseScreenState createState() => _ShowcaseScreenState();
}

class _ShowcaseScreenState extends State<ShowcaseScreen> {
  late ThemeData theme;
  late ShowcaseController controller;

  @override
  void initState() {
    super.initState();
    controller = ShowcaseController();
    theme = AppTheme.cookifyTheme;
  }

  List<Widget> buildShowcases() {
    List<Widget> list = [];

    for (Showcase showcase in controller.showcases) {
      list.add(singleShowcase(showcase));
    }

    return list;
  }

  Widget singleShowcase(Showcase showcase) {
    return MyContainer(
      onTap: () {
        Navigator.of(context, rootNavigator: true)
            .push(MaterialPageRoute(builder: (context) => RecipeScreen()));
      },
      color: Colors.transparent,
      padding: MySpacing.bottom(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: Image(
              image: AssetImage(showcase.image),
            ),
          ),
          MySpacing.height(8),
          MyText.bodyLarge(showcase.title, fontWeight: 700, letterSpacing: 0),
          MyText.bodySmall(showcase.body,
              muted: true, fontWeight: 500, letterSpacing: -0.1),
          MySpacing.height(16),
          Row(
            children: [
              Icon(
                Icons.favorite_border,
                size: 16,
                color: theme.colorScheme.onBackground.withAlpha(200),
              ),
              MySpacing.width(4),
              MyText.bodySmall(showcase.likes.toString(), muted: true),
              MySpacing.width(16),
              Icon(
                Icons.schedule,
                size: 16,
                color: theme.colorScheme.onBackground.withAlpha(200),
              ),
              MySpacing.width(4),
              MyText.bodySmall("${showcase.timeInMinutes}'", muted: true),
              MySpacing.width(24),
              MyText.bodySmall("${showcase.ingredients} Ingredients",
                  muted: true)
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> buildCategories() {
    List<Widget> list = [];

    list.add(MySpacing.width(16));

    for (Category category in controller.categories) {
      list.add(singleCategory(category));
      list.add(MySpacing.width(16));
    }
    return list;
  }

  Widget singleCategory(Category category) {
    return MyContainer(
      paddingAll: 16,
      color: theme.colorScheme.primaryContainer,
      child: Column(
        children: [
          Icon(
            category.icon,
            color: theme.colorScheme.primary,
            size: 28,
          ),
          MySpacing.height(8),
          MyText.bodySmall(
            category.title,
            color: theme.colorScheme.primary,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShowcaseController>(
        init: controller,
        tag: 'showcase_controller',
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
                  padding: MySpacing.x(16),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: MySpacing.all(12),
                          prefixIcon: Icon(
                            LucideIcons.search,
                            size: 20,
                            color:
                                theme.colorScheme.onBackground.withAlpha(160),
                          ),
                          filled: true,
                          labelText: "Search",
                          labelStyle: TextStyle(
                            color:
                                theme.colorScheme.onBackground.withAlpha(160),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          fillColor:
                              theme.colorScheme.onBackground.withAlpha(10),
                          focusColor: Colors.transparent,
                        ),
                      )),
                      MySpacing.width(16),
                      MyContainer(
                        padding: MySpacing.all(12),
                        color: theme.colorScheme.primary.withAlpha(80),
                        child: Icon(
                          LucideIcons.utensilsCrossed,
                          size: 24,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                MySpacing.height(16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: buildCategories(),
                  ),
                ),
                Container(
                  padding: MySpacing.fromLTRB(16, 24, 16, 0),
                  child: Column(
                    children: buildShowcases(),
                  ),
                ),
                Center(
                  child: SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              theme.colorScheme.primary),
                          strokeWidth: 2)),
                ),
                MySpacing.height(24)
              ],
            ),
          ),
        ),
      );
    }
  }
}
