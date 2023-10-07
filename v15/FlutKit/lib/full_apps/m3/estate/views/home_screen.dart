import 'package:flutkit/full_apps/m3/estate/controllers/home_controller.dart';
import 'package:flutkit/full_apps/m3/estate/models/category.dart';
import 'package:flutkit/full_apps/m3/estate/models/house.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
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
  late HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = HomeController();
    theme = AppTheme.estateTheme;
  }

  List<Widget> _buildCategoryList() {
    List<Widget> list = [];
    list.add(MySpacing.width(24));

    for (Category category in controller.categories!) {
      list.add(_buildSingleCategory(category));
    }
    return list;
  }

  List<Widget> _buildFilterCategoryList() {
    List<Widget> list = [];
    list.add(MySpacing.width(24));
    for (Category category in controller.categories!) {
      list.add(_buildFilterCategory(category));
    }
    return list;
  }

  List<Widget> _buildHouseList() {
    List<Widget> list = [];
    list.add(MySpacing.width(24));

    for (House house in controller.houses!) {
      list.add(_buildSingleHouse(house));
    }
    return list;
  }

  Widget _buildSingleCategory(Category category) {
    return Container(
      margin: MySpacing.right(16),
      child: Column(
        children: [
          MyContainer.rounded(
            color: theme.colorScheme.primaryContainer,
            child: Icon(
              category.categoryIcon,
              color: theme.colorScheme.primary,
            ),
          ),
          MySpacing.height(8),
          MyText.bodySmall(
            category.category,
            xMuted: true,
            fontSize: 10,
          ),
        ],
      ),
    );
  }

  Widget _buildFilterCategory(Category category) {
    return MyContainer.bordered(
      paddingAll: 8,
      borderRadiusAll: Constant.containerRadius.small,
      margin: MySpacing.right(8),
      border: Border.all(color: theme.colorScheme.primary, width: 1),
      splashColor: theme.colorScheme.primaryContainer,
      color: theme.colorScheme.primaryContainer,
      child: Row(
        children: [
          Icon(
            category.categoryIcon,
            color: theme.colorScheme.primary,
            size: 16,
          ),
          MySpacing.width(8),
          MyText.bodySmall(
            category.category,
            fontWeight: 600,
            color: theme.colorScheme.onPrimaryContainer,
          ),
        ],
      ),
    );
  }

  Widget _buildSingleHouse(House house) {
    return MyContainer(
      onTap: () {
        controller.goToSingleHouseScreen(house);
      },
      margin: MySpacing.nTop(24),
      paddingAll: 0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadiusAll: Constant.containerRadius.medium,
      child: Column(
        children: [
          Image(
            image: AssetImage(house.image),
            fit: BoxFit.fitWidth,
          ),
          MyContainer(
            paddingAll: 16,
            color: theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(Constant.containerRadius.medium),
                bottomRight: Radius.circular(Constant.containerRadius.medium)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.bodyLarge(
                      house.name,
                      fontWeight: 700,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                    MyText.bodyMedium(
                      "\$${house.price.toString()}/month",
                      fontWeight: 600,
                      color: theme.colorScheme.secondary,
                    ),
                  ],
                ),
                MySpacing.height(4),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 16,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                    MySpacing.width(4),
                    MyText.bodySmall(house.location,
                        xMuted: true,
                        color: theme.colorScheme.onPrimaryContainer),
                  ],
                ),
                MySpacing.height(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.king_bed,
                            size: 16,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                          MySpacing.width(4),
                          MyText.bodySmall(
                            '${house.bedrooms} Beds',
                            xMuted: true,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.bathtub,
                            size: 16,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                          MySpacing.width(4),
                          MyText.bodySmall(
                            '${house.bathrooms} Baths',
                            xMuted: true,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                MySpacing.height(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.square_foot,
                            size: 16,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                          MySpacing.width(4),
                          MyText.bodySmall(
                            '${house.floors} Floors',
                            xMuted: true,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.aspect_ratio,
                            size: 16,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                          MySpacing.width(4),
                          MyText.bodySmall(
                            '${house.area} sqft',
                            xMuted: true,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: controller,
        tag: 'home_controller',
        builder: (controller) {
          return Theme(
            data: theme.copyWith(
                colorScheme: theme.colorScheme
                    .copyWith(secondary: theme.colorScheme.primaryContainer)),
            child: Scaffold(
              body: Container(
                padding: MySpacing.top(MySpacing.safeAreaTop(context)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 2,
                      child: controller.showLoading
                          ? LinearProgressIndicator(
                              color: theme.colorScheme.primary,
                              minHeight: 2,
                            )
                          : Container(
                              height: 2,
                            ),
                    ),
                    Expanded(
                      child: _buildBody(),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Container(
          child: LoadingEffect.getSearchLoadingScreen(
        context,
      ));
    } else {
      return ListView(
        padding: MySpacing.top(20),
        children: [
          Padding(
            padding: MySpacing.horizontal(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText.bodySmall(
                      'Location',
                      xMuted: true,
                    ),
                    MySpacing.height(2),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: theme.colorScheme.primary,
                          size: 14,
                        ),
                        MySpacing.width(4),
                        MyText.bodyMedium(
                          'San Jose, CA',
                          fontWeight: 600,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: theme.colorScheme.primary,
                        ),
                      ],
                    ),
                  ],
                ),
                MyContainer(
                  onTap: () {
                    _selectSizeSheet(context);
                  },
                  color: theme.colorScheme.secondaryContainer,
                  paddingAll: 6,
                  child: Icon(
                    Icons.more_horiz_outlined,
                    color: theme.colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
          MySpacing.height(24),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _buildCategoryList(),
            ),
          ),
          MySpacing.height(24),
          Padding(
            padding: MySpacing.horizontal(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText.bodyLarge(
                  'Recommended',
                  fontWeight: 600,
                ),
                MyText.bodySmall(
                  'More',
                  xMuted: true,
                ),
              ],
            ),
          ),
          MySpacing.height(16),
          Column(
            children: _buildHouseList(),
          ),
        ],
      );
    }
  }

  void _selectSizeSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return MyContainer(
                padding: MySpacing.top(24),
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: MySpacing.horizontal(24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyContainer.rounded(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            paddingAll: 6,
                            color: theme.colorScheme.secondary,
                            child: Icon(
                              Icons.close,
                              size: 16,
                              color: theme.colorScheme.secondaryContainer,
                            ),
                          ),
                          MyText.bodyMedium(
                            'Filters',
                            fontWeight: 600,
                          ),
                          MyText.bodySmall(
                            'Reset',
                            color: theme.colorScheme.primary,
                          ),
                        ],
                      ),
                    ),
                    MySpacing.height(8),
                    Padding(
                      padding: MySpacing.horizontal(24),
                      child: MyText.bodyMedium(
                        'Category',
                        fontWeight: 700,
                      ),
                    ),
                    MySpacing.height(8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: _buildFilterCategoryList(),
                      ),
                    ),
                    MySpacing.height(16),
                    Padding(
                      padding: MySpacing.horizontal(24),
                      child: MyText.bodyMedium(
                        'Price Range ( ${controller.selectedRange.start.toInt().toString()} - ${controller.selectedRange.end.toInt().toString()} )',
                        fontWeight: 700,
                      ),
                    ),
                    RangeSlider(
                        activeColor: theme.colorScheme.primary,
                        inactiveColor: theme.colorScheme.primary.withAlpha(100),
                        max: 10000,
                        min: 0,
                        values: controller.selectedRange,
                        onChanged: (RangeValues newRange) {
                          setState(() => controller.selectedRange = newRange);
                        }),
                    Padding(
                      padding: MySpacing.horizontal(24),
                      child: MyText.bodyMedium(
                        'Bed Rooms',
                        fontWeight: 700,
                      ),
                    ),
                    MySpacing.height(8),
                    SingleChildScrollView(
                      padding: MySpacing.x(24),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children:
                              ['Any', '1', '2', '3', '4', '5'].map((element) {
                        return InkWell(
                            onTap: () {
                              setState(() {
                                if (controller.selectedBedRooms
                                    .contains(element)) {
                                  controller.selectedBedRooms.remove(element);
                                } else {
                                  controller.selectedBedRooms.add(element);
                                }
                              });
                            },
                            child: SingleBed(
                              bed: element,
                              selected:
                                  controller.selectedBedRooms.contains(element),
                            ));
                      }).toList()),
                    ),
                    MySpacing.height(16),
                    Padding(
                      padding: MySpacing.horizontal(24),
                      child: MyText.bodyMedium(
                        'Bath Rooms',
                        fontWeight: 700,
                      ),
                    ),
                    MySpacing.height(8),
                    SingleChildScrollView(
                      padding: MySpacing.x(24),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children:
                              ['Any', '1', '2', '3', '4', '5'].map((element) {
                        return InkWell(
                            onTap: () {
                              setState(() {
                                if (controller.selectedBathRooms
                                    .contains(element)) {
                                  controller.selectedBathRooms.remove(element);
                                } else {
                                  controller.selectedBathRooms.add(element);
                                }
                              });
                            },
                            child: SingleBath(
                              bath: element,
                              selected: controller.selectedBathRooms
                                  .contains(element),
                            ));
                      }).toList()),
                    ),
                    MySpacing.height(16),
                    Padding(
                      padding: MySpacing.horizontal(24),
                      child: MyButton.block(
                        borderRadiusAll: 8,
                        elevation: 0,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        backgroundColor: theme.colorScheme.primary,
                        child: MyText.titleSmall(
                          "Apply Filters",
                          fontWeight: 700,
                          color: theme.colorScheme.onPrimary,
                          letterSpacing: 0.4,
                        ),
                      ),
                    ),
                    MySpacing.height(16),
                  ],
                ),
              );
            },
          );
        });
  }
}

class SingleBed extends StatefulWidget {
  final String bed;
  final bool selected;

  const SingleBed({Key? key, required this.bed, required this.selected})
      : super(key: key);

  @override
  _SingleBedState createState() => _SingleBedState();
}

class _SingleBedState extends State<SingleBed> {
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.estateTheme;
  }

  @override
  Widget build(BuildContext context) {
    bool selected = widget.selected;

    return MyContainer(
      padding: MySpacing.symmetric(horizontal: 16, vertical: 8),
      borderRadiusAll: 8,
      margin: MySpacing.right(12),
      bordered: true,
      border: Border.all(
          color:
              selected ? theme.colorScheme.primary : theme.colorScheme.primary),
      splashColor: theme.colorScheme.primaryContainer,
      color: selected
          ? theme.colorScheme.primary
          : theme.colorScheme.primaryContainer,
      child: MyText.bodySmall(
        widget.bed,
        fontWeight: 600,
        color: selected
            ? theme.colorScheme.onPrimary
            : theme.colorScheme.onPrimaryContainer,
      ),
    );
  }
}

class SingleBath extends StatefulWidget {
  final String bath;
  final bool selected;

  const SingleBath({Key? key, required this.bath, required this.selected})
      : super(key: key);

  @override
  _SingleBathState createState() => _SingleBathState();
}

class _SingleBathState extends State<SingleBath> {
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.estateTheme;
  }

  @override
  Widget build(BuildContext context) {
    bool selected = widget.selected;

    return MyContainer(
      padding: MySpacing.symmetric(horizontal: 16, vertical: 8),
      borderRadiusAll: 8,
      margin: MySpacing.right(12),
      bordered: true,
      border: Border.all(
          color:
              selected ? theme.colorScheme.primary : theme.colorScheme.primary),
      splashColor: theme.colorScheme.primaryContainer,
      color: selected
          ? theme.colorScheme.primary
          : theme.colorScheme.primaryContainer,
      child: MyText.bodySmall(
        widget.bath,
        fontWeight: 600,
        color: selected
            ? theme.colorScheme.onPrimary
            : theme.colorScheme.onPrimaryContainer,
      ),
    );
  }
}
