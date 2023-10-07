import 'package:flutkit/full_apps/other/cookify/models/category.dart';
import 'package:flutkit/full_apps/other/cookify/models/showcase.dart';
import 'package:flutkit/full_apps/other/cookify/views/recipe_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class CookifyShowcaseScreen extends StatefulWidget {
  @override
  _CookifyShowcaseScreenState createState() => _CookifyShowcaseScreenState();
}

class _CookifyShowcaseScreenState extends State<CookifyShowcaseScreen> {
  late List<Showcase> showcases;
  late List<Category> categories;
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    showcases = Showcase.getList();
    categories = Category.getList();
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
                    padding: MySpacing.x(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search,
                                    color: theme.colorScheme.onBackground
                                        .withAlpha(160)),
                                filled: true,
                                fillColor: customTheme.card,
                                hintStyle: TextStyle(
                                  color: AppTheme.theme.colorScheme.onBackground
                                      .withAlpha(200),
                                ),
                                hintText: "Search",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                border: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding: MySpacing.all(12)),
                            cursorColor: customTheme.cookifyPrimary,
                          ),
                        ),
                        MySpacing.width(16),
                        MyContainer(
                          padding: MySpacing.all(12),
                          color: customTheme.cookifyPrimary.withAlpha(80),
                          child: Icon(
                            Icons.local_dining_outlined,
                            size: 24,
                            color: customTheme.cookifyPrimary,
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
                                customTheme.cookifyPrimary),
                            strokeWidth: 2)),
                  ),
                  MySpacing.height(24)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildShowcases() {
    List<Widget> list = [];

    for (Showcase showcase in showcases) {
      list.add(singleShowcase(showcase));
    }

    return list;
  }

  Widget singleShowcase(Showcase showcase) {
    return MyContainer(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(builder: (context) => CookifyRecipeScreen()));
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

    for (Category category in categories) {
      list.add(singleCategory(category));
      list.add(MySpacing.width(16));
    }
    return list;
  }

  Widget singleCategory(Category category) {
    return MyContainer(
      paddingAll: 16,
      color: customTheme.cookifyPrimary.withAlpha(40),
      child: Column(
        children: [
          Icon(
            category.icon,
            color: customTheme.cookifyPrimary,
            size: 28,
          ),
          MySpacing.height(8),
          MyText.bodySmall(
            category.title,
            color: customTheme.cookifyPrimary,
          )
        ],
      ),
    );
  }
}
