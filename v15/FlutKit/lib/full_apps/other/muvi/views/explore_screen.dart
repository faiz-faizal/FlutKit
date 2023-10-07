import 'package:flutkit/full_apps/other/muvi/controllers/explore_controller.dart';
import 'package:flutkit/full_apps/other/muvi/models/movie.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late ExploreController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;

    controller = ExploreController();
  }

  List<Widget> _buildCategoryList() {
    List<Widget> list = [];
    list.add(MySpacing.width(20));
    for (String category in controller.categories) {
      list.add(_buildSingleCategory(category));
    }
    list.add(MySpacing.width(20));
    return list;
  }

  Widget _buildSingleMovie(Movie movie) {
    return MyContainer(
      onTap: () {
        controller.goToSingleMovieScreen(movie);
      },
      borderRadiusAll: 4,
      paddingAll: 8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyContainer(
            paddingAll: 0,
            borderRadiusAll: 4,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image(
              image: AssetImage(movie.image),
              height: 160,
              width: 200,
              fit: BoxFit.fill,
            ),
          ),
          MySpacing.height(6),
          MyText.labelMedium(
            movie.name,
            fontWeight: 700,
          ),
          MySpacing.height(2),
          MyText.labelMedium(
            movie.production,
          ),
          MySpacing.height(4),
          MyContainer.bordered(
            border: Border.all(color: customTheme.muviPrimary),
            color: customTheme.muviPrimary.withAlpha(30),
            borderRadiusAll: 4,
            padding: MySpacing.xy(8, 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  LucideIcons.star,
                  color: customTheme.muviPrimary,
                  size: 12,
                ),
                MySpacing.width(6),
                MyText.bodySmall(
                  movie.ratings.toString(),
                  fontWeight: 600,
                  color: customTheme.muviPrimary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSingleCategory(String category) {
    bool selected = category == controller.selectedCategory;

    return MyContainer.bordered(
      onTap: () {
        controller.selectCategory(category);
      },
      borderRadiusAll: 24,
      border: Border.all(
          color: selected ? customTheme.muviPrimary : customTheme.border),
      margin: MySpacing.right(8),
      padding: MySpacing.xy(12, 6),
      color: selected ? customTheme.muviPrimary : customTheme.card,
      child: MyText.labelMedium(
        category,
        color: selected
            ? customTheme.muviOnPrimary
            : theme.colorScheme.onBackground,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExploreController>(
        init: controller,
        tag: 'explore_controller',
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
          ),
        ),
      );
    } else {
      return Scaffold(
        body: ListView(
          padding:
              MySpacing.fromLTRB(0, MySpacing.safeAreaTop(context) + 20, 0, 20),
          children: [
            Padding(
              padding: MySpacing.x(20),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      style: MyTextStyle.bodyMedium(),
                      cursorColor: customTheme.muviPrimary,
                      decoration: InputDecoration(
                        hintText: "Search your movie ...",
                        hintStyle: MyTextStyle.labelMedium(
                            color: theme.colorScheme.onBackground,
                            xMuted: true),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: customTheme.card,
                        prefixIcon: Icon(
                          LucideIcons.search,
                          size: 16,
                          color: theme.colorScheme.onBackground.withAlpha(150),
                        ),
                        isDense: true,
                      ),
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                  MySpacing.width(20),
                  MyContainer(
                    paddingAll: 12,
                    borderRadiusAll: 4,
                    onTap: () {},
                    color: customTheme.muviPrimary,
                    child: Icon(
                      LucideIcons.sliders,
                      color: customTheme.muviOnPrimary,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            MySpacing.height(20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _buildCategoryList(),
              ),
            ),
            MySpacing.height(20),
            GridView.builder(
                padding: MySpacing.x(20),
                shrinkWrap: true,
                itemCount: controller.movies!.length,
                physics: ClampingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: controller.findAspectRatio(),
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return _buildSingleMovie(controller.movies![index]);
                }),
          ],
        ),
      );
    }
  }
}
