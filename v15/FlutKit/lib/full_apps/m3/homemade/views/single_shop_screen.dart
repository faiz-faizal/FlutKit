import 'package:flutkit/full_apps/m3/homemade/controllers/single_shop_controller.dart';
import 'package:flutkit/full_apps/m3/homemade/models/category.dart';
import 'package:flutkit/full_apps/m3/homemade/models/shop.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_star_rating.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SingleShopScreen extends StatefulWidget {
  final Shop shop;

  const SingleShopScreen(this.shop);

  @override
  _SingleShopScreenState createState() => _SingleShopScreenState();
}

class _SingleShopScreenState extends State<SingleShopScreen> {
  late Shop shop;
  late ThemeData theme;

  late SingleShopController singleShopController;

  @override
  void initState() {
    super.initState();
    singleShopController = SingleShopController();
    theme = AppTheme.homemadeTheme;
    shop = widget.shop;
  }

  List<Widget> _buildCategoryList() {
    List<Widget> list = [];

    for (Category category in singleShopController.categories) {
      list.add(_buildSingleCategory(category));
      list.add(MySpacing.width(16));
    }
    return list;
  }

  Widget _buildSingleCategory(Category category) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MyContainer.rounded(
          color: theme.colorScheme.primary.withAlpha(40),
          child: Center(
            child: Image(
              height: 24,
              width: 24,
              fit: BoxFit.fill,
              color: theme.colorScheme.primary,
              image: AssetImage(category.url),
            ),
          ),
        ),
        MySpacing.height(4),
        MyText.bodySmall(
          category.name,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingleShopController>(
        init: singleShopController,
        tag: 'single_shop_controller',
        builder: (singleShopController) {
          return Theme(
            data: theme.copyWith(
                colorScheme: theme.colorScheme.copyWith(
                    secondary: theme.colorScheme.primary.withAlpha(80))),
            child: _buildBody(),
          );
        });
  }

  Widget _buildBody() {
    if (singleShopController.uiLoading) {
      return Scaffold(
        body: Container(
            margin: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
            child: LoadingEffect.getSearchLoadingScreen(
              context,
            )),
      );
    } else {
      return Scaffold(
        body: ListView(
          children: [
            Container(
              padding: MySpacing.fromLTRB(16, 16, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyContainer.bordered(
                    paddingAll: 10,
                    borderRadiusAll: 6,
                    color: theme.colorScheme.secondary.withAlpha(28),
                    border: Border.all(
                        color: theme.colorScheme.secondary.withAlpha(120)),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      LucideIcons.chevronLeft,
                      size: 16,
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyContainer.bordered(
                        paddingAll: 10,
                        borderRadiusAll: 6,
                        color: theme.colorScheme.secondary.withAlpha(28),
                        border: Border.all(
                            color: theme.colorScheme.secondary.withAlpha(120)),
                        child: Icon(
                          LucideIcons.map,
                          size: 16,
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                      MySpacing.width(16),
                      MyContainer.bordered(
                        paddingAll: 10,
                        borderRadiusAll: 6,
                        color: theme.colorScheme.secondary.withAlpha(28),
                        border: Border.all(
                            color: theme.colorScheme.secondary.withAlpha(120)),
                        child: Icon(
                          LucideIcons.phoneOutgoing,
                          size: 16,
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                      MySpacing.width(16),
                      MyContainer.bordered(
                        paddingAll: 10,
                        borderRadiusAll: 6,
                        color: theme.colorScheme.secondary.withAlpha(28),
                        border: Border.all(
                            color: theme.colorScheme.secondary.withAlpha(120)),
                        child: Icon(
                          LucideIcons.moreHorizontal,
                          size: 16,
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            MyContainer(
              margin: MySpacing.fromLTRB(16, 24, 16, 0),
              clipBehavior: Clip.hardEdge,
              height: 250,
              borderRadiusAll: 8,
              paddingAll: 0,
              child: Stack(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                children: [
                  Image(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    image: AssetImage(shop.url),
                  ),
                  Positioned(
                      left: 0,
                      top: 16,
                      child: MyContainer(
                        color: theme.colorScheme.primary,
                        padding: MySpacing.fromLTRB(10, 4, 10, 6),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                        child: MyText.bodySmall(
                          "Open",
                          color: theme.colorScheme.onPrimary,
                          letterSpacing: 0.3,
                        ),
                      ))
                ],
              ),
            ),
            MyContainer(
              margin: MySpacing.fromLTRB(16, 24, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText.titleLarge(
                        shop.name,
                        fontWeight: 600,
                      ),
                      Icon(
                        Icons.favorite_outline_rounded,
                        size: 22,
                        color: theme.colorScheme.primary,
                      ),
                    ],
                  ),
                  MySpacing.height(4),
                  Row(
                    children: [
                      MyStarRating(
                          rating: shop.ratings,
                          size: 16,
                          activeColor: theme.colorScheme.secondary,
                          inactiveColor:
                              theme.colorScheme.onBackground.withAlpha(140),
                          inactiveStarFilled: false,
                          showInactive: true),
                      MySpacing.width(4),
                      MyText.bodyMedium(
                        shop.ratings.toString(),
                        xMuted: true,
                      ),
                    ],
                  ),
                  MySpacing.height(10),
                  Row(
                    children: [
                      Icon(
                        LucideIcons.mapPin,
                        size: 14,
                        color: theme.colorScheme.secondary,
                      ),
                      MySpacing.width(8),
                      MyText.bodyMedium(
                        shop.location,
                        xMuted: true,
                        letterSpacing: 0.3,
                      ),
                    ],
                  ),
                  MySpacing.height(8),
                  Row(
                    children: [
                      MySpacing.width(2),
                      Icon(
                        LucideIcons.phone,
                        size: 14,
                        color: theme.colorScheme.secondary,
                      ),
                      MySpacing.width(8),
                      MyText.bodySmall(
                        shop.contact,
                        xMuted: true,
                        letterSpacing: 0.4,
                      ),
                    ],
                  ),
                  MySpacing.height(10),
                  MyText.bodyMedium(
                    shop.description,
                    textAlign: TextAlign.justify,
                    xMuted: true,
                  ),
                ],
              ),
            ),
            Container(
              margin: MySpacing.fromLTRB(24, 16, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText.bodyLarge(
                    'Categories',
                    fontWeight: 600,
                    fontSize: 18,
                  ),
                  MySpacing.height(16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _buildCategoryList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
