import 'package:flutkit/full_apps/m3/homemade/controllers/home_controller.dart';
import 'package:flutkit/full_apps/m3/homemade/models/shop.dart';
import 'package:flutkit/full_apps/m3/homemade/views/single_shop_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ThemeData theme;

  late HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController();
    theme = AppTheme.homemadeTheme;
  }

  List<Widget> _buildShopList() {
    List<Widget> list = [];

    for (Shop shop in homeController.shops) {
      list.add(_buildSingleShop(shop));
    }
    return list;
  }

  Widget _buildSingleShop(Shop shop) {
    return MyContainer(
      margin: MySpacing.bottom(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SingleShopScreen(shop)),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyContainer(
            paddingAll: 0,
            clipBehavior: Clip.hardEdge,
            child: Image(
              height: 80,
              width: 80,
              fit: BoxFit.fill,
              image: AssetImage(shop.url),
            ),
          ),
          MySpacing.width(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.bodyLarge(
                      shop.name,
                      fontWeight: 600,
                    ),
                    Icon(
                      LucideIcons.heart,
                      color: theme.colorScheme.primary,
                      size: 20,
                    ),
                  ],
                ),
                MySpacing.height(8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: theme.colorScheme.onBackground.withAlpha(140),
                      size: 16,
                    ),
                    MySpacing.width(8),
                    Expanded(
                        child: MyText.bodySmall(
                      shop.location,
                      xMuted: true,
                    )),
                  ],
                ),
                MySpacing.height(6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.phone_outlined,
                      color: theme.colorScheme.onBackground.withAlpha(140),
                      size: 16,
                    ),
                    MySpacing.width(8),
                    Expanded(
                        child: MyText.bodySmall(
                      shop.contact,
                      xMuted: true,
                    )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _endDrawer() {
    return SafeArea(
      child: Container(
        margin: MySpacing.fromLTRB(16, 16, 16, 80),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: theme.cardTheme.color,
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Drawer(
          child: Container(
            color: theme.cardTheme.color,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: MySpacing.xy(16, 12),
                  color: theme.colorScheme.primary,
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: MyText(
                            "Filter",
                            fontWeight: 700,
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      MyContainer.rounded(
                          onTap: () {
                            homeController.closeEndDrawer();
                          },
                          paddingAll: 6,
                          color: theme.colorScheme.onPrimary.withAlpha(80),
                          child: Icon(
                            LucideIcons.x,
                            size: 12,
                            color: theme.colorScheme.onPrimary,
                          ))
                    ],
                  ),
                ),
                Expanded(
                    child: ListView(
                  padding: MySpacing.all(16),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText.bodyMedium(
                          "Type",
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600,
                        ),
                        MyText.bodySmall(
                          "${homeController.selectedChoices.length} selected",
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600,
                          xMuted: true,
                        ),
                      ],
                    ),
                    MySpacing.height(16),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: _buildType(),
                    ),
                    MySpacing.height(24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText.bodyMedium(
                          "Price Range",
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600,
                        ),
                        MyText.bodySmall(
                          "\$${homeController.selectedRange.start.toInt()} - \$${homeController.selectedRange.end.toInt()}",
                          color: theme.colorScheme.secondary,
                          fontWeight: 600,
                          letterSpacing: 0.35,
                        )
                      ],
                    ),
                    MySpacing.height(16),
                    RangeSlider(
                        activeColor: theme.colorScheme.primary,
                        inactiveColor:
                            theme.colorScheme.secondary.withAlpha(100),
                        max: 10000,
                        min: 0,
                        values: homeController.selectedRange,
                        onChanged: (RangeValues newRange) {
                          homeController.onChangePriceRange(newRange);
                        }),
                  ],
                )),
                Row(
                  children: [
                    Expanded(
                        child: MyContainer(
                      onTap: () {
                        homeController.closeEndDrawer();
                      },
                      padding: MySpacing.y(12),
                      child: Center(
                        child: MyText(
                          "Clear",
                          color: theme.colorScheme.secondary,
                          fontWeight: 600,
                        ),
                      ),
                    )),
                    Expanded(
                        child: MyContainer.none(
                      onTap: () {
                        homeController.closeEndDrawer();
                      },
                      padding: MySpacing.y(12),
                      color: theme.colorScheme.primary,
                      child: Center(
                        child: MyText(
                          "Apply",
                          color: theme.colorScheme.onPrimary,
                          fontWeight: 600,
                        ),
                      ),
                    )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildType() {
    List<String> categoryList = [
      "ECom",
      "Automobile",
      "Crimes",
      "Business",
      "Fitness",
      "Astro",
      "Politics",
      "Relationship",
      "Food",
      "Electronics",
      "Health",
      "Tech",
      "Entertainment",
      "World",
      "Sports",
      "Other",
    ];

    List<Widget> choices = [];
    for (var item in categoryList) {
      bool selected = homeController.selectedChoices.contains(item);
      if (selected) {
        choices.add(MyContainer.none(
            color: theme.colorScheme.primary.withAlpha(28),
            bordered: true,
            borderRadiusAll: 12,
            paddingAll: 8,
            border: Border.all(color: theme.colorScheme.primary),
            onTap: () {
              homeController.removeChoice(item);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check,
                  size: 14,
                  color: theme.colorScheme.primary,
                ),
                MySpacing.width(6),
                MyText.bodySmall(
                  item,
                  fontSize: 11,
                  color: theme.colorScheme.primary,
                )
              ],
            )));
      } else {
        choices.add(MyContainer.none(
          // color: theme.colorScheme.border,
          borderRadiusAll: 12,
          padding: MySpacing.xy(12, 8),
          onTap: () {
            homeController.addChoice(item);
          },
          child: MyText.labelSmall(
            item,
            color: theme.colorScheme.onBackground,
            fontSize: 11,
          ),
        ));
      }
    }
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: homeController,
        tag: 'home_controller',
        builder: (homeController) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (homeController.uiLoading) {
      return Scaffold(
          backgroundColor: theme.cardTheme.color,
          body: Container(
              margin: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
              child: LoadingEffect.getSearchLoadingScreen(
                context,
              )));
    } else {
      return Scaffold(
        key: homeController.scaffoldKey,
        endDrawer: _endDrawer(),
        resizeToAvoidBottomInset: false,
        body: ListView(
          padding: MySpacing.fromLTRB(24, 44, 24, 64),
          children: [
            Row(
              children: [
                MyContainer.bordered(
                    onTap: () {
                      homeController.openLocationDialog();
                    },
                    splashColor: theme.colorScheme.secondary,
                    borderRadiusAll: 8,
                    paddingAll: 13,
                    color: theme.colorScheme.secondary.withAlpha(28),
                    border: Border.all(
                        color: theme.colorScheme.secondary.withAlpha(120)),
                    child: Icon(
                      LucideIcons.mapPin,
                      color: theme.colorScheme.secondary,
                      size: 18,
                    )),
                MySpacing.width(16),
                Expanded(
                    child: TextFormField(
                  controller: homeController.searchEditingController,
                  style: MyTextStyle.bodyMedium(
                      color: theme.colorScheme.onPrimaryContainer),
                  cursorColor: theme.colorScheme.secondary,
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: MyTextStyle.bodyMedium(
                        color: theme.colorScheme.onPrimaryContainer),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        borderSide: BorderSide.none),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: theme.colorScheme.primaryContainer,
                    prefixIcon: Icon(
                      LucideIcons.search,
                      size: 20,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.only(right: 16),
                  ),
                  textCapitalization: TextCapitalization.sentences,
                )),
                MySpacing.width(16),
                MyContainer.bordered(
                    onTap: () {
                      homeController.openEndDrawer();
                    },
                    color: theme.colorScheme.secondary.withAlpha(28),
                    border: Border.all(
                        color: theme.colorScheme.secondary.withAlpha(120)),
                    borderRadiusAll: 8,
                    paddingAll: 13,
                    child: Icon(
                      LucideIcons.sliders,
                      color: theme.colorScheme.secondary,
                      size: 18,
                    )),
              ],
            ),
            MySpacing.height(16),
            Column(
              children: _buildShopList(),
            ),
          ],
        ),
      );
    }
  }
}
