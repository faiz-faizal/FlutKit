import 'package:flutkit/full_apps/other/estate/controllers/home_controller.dart';
import 'package:flutkit/full_apps/other/estate/models/category.dart';
import 'package:flutkit/full_apps/other/estate/models/house.dart';
import 'package:flutkit/full_apps/other/estate/views/single_estate_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_card.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EstateHomeScreen extends StatefulWidget {
  const EstateHomeScreen({Key? key}) : super(key: key);

  @override
  _EstateHomeScreenState createState() => _EstateHomeScreenState();
}

class _EstateHomeScreenState extends State<EstateHomeScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late EstateHomeController estateHomeController;

  @override
  void initState() {
    super.initState();
    estateHomeController = EstateHomeController();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  List<Widget> _buildCategoryList() {
    List<Widget> list = [];
    list.add(MySpacing.width(24));

    for (Category category in estateHomeController.categories!) {
      list.add(_buildSingleCategory(category));
    }
    return list;
  }

  List<Widget> _buildFilterCategoryList() {
    List<Widget> list = [];
    list.add(MySpacing.width(24));
    for (Category category in estateHomeController.categories!) {
      list.add(_buildFilterCategory(category));
    }
    return list;
  }

  List<Widget> _buildHouseList() {
    List<Widget> list = [];
    list.add(MySpacing.width(24));

    for (House house in estateHomeController.houses!) {
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
            color: customTheme.card.withAlpha(180),
            child: Icon(
              category.categoryIcon,
              color: customTheme.estatePrimary,
            ),
          ),
          MySpacing.height(8),
          MyText.labelSmall(
            category.category,
            xMuted: true,
          ),
        ],
      ),
    );
  }

  Widget _buildFilterCategory(Category category) {
    return MyContainer(
      paddingAll: 8,
      borderRadiusAll: 8,
      margin: MySpacing.right(8),
      bordered: true,
      splashColor: customTheme.medicarePrimary.withAlpha(40),
      color: customTheme.card,
      child: Row(
        children: [
          Icon(
            category.categoryIcon,
            color: customTheme.estatePrimary,
            size: 16,
          ),
          MySpacing.width(8),
          MyText.bodySmall(
            category.category,
            fontWeight: 600,
          ),
        ],
      ),
    );
  }

  Widget _buildSingleHouse(House house) {
    return MyCard(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EstateSingleEstateScreen(house)));
      },
      margin: MySpacing.nTop(24),
      paddingAll: 0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadiusAll: 16,
      child: Column(
        children: [
          Image(
            image: AssetImage(house.image),
            fit: BoxFit.fitWidth,
          ),
          MyContainer(
            paddingAll: 16,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.bodyMedium(
                      house.name,
                      fontWeight: 700,
                    ),
                    MyText.bodyMedium(
                      house.price,
                      fontWeight: 600,
                      color: customTheme.estateSecondary,
                    ),
                  ],
                ),
                MySpacing.height(4),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 16,
                      color: theme.colorScheme.onBackground.withAlpha(180),
                    ),
                    MySpacing.width(4),
                    MyText.bodySmall(
                      house.location,
                      xMuted: true,
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
                            Icons.king_bed,
                            size: 16,
                            color:
                                theme.colorScheme.onBackground.withAlpha(180),
                          ),
                          MySpacing.width(4),
                          MyText.bodySmall(
                            house.bedrooms,
                            xMuted: true,
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
                            color:
                                theme.colorScheme.onBackground.withAlpha(180),
                          ),
                          MySpacing.width(4),
                          MyText.bodySmall(
                            house.bathrooms,
                            xMuted: true,
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
                            color:
                                theme.colorScheme.onBackground.withAlpha(180),
                          ),
                          MySpacing.width(4),
                          MyText.bodySmall(
                            house.floors,
                            xMuted: true,
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
                            color:
                                theme.colorScheme.onBackground.withAlpha(180),
                          ),
                          MySpacing.width(4),
                          MyText.bodySmall(
                            house.area,
                            xMuted: true,
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
    return GetBuilder<EstateHomeController>(
        init: estateHomeController,
        tag: 'estate_home_controller',
        builder: (estateHomeController) {
          return SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  SizedBox(
                    height: 2,
                    child: estateHomeController.showLoading
                        ? LinearProgressIndicator(
                            color: customTheme.estatePrimary,
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
          );
        });
  }

  Widget _buildBody() {
    if (estateHomeController.uiLoading) {
      return Container(
          margin: MySpacing.top(16),
          child: LoadingEffect.getSearchLoadingScreen(
            context,
          ));
    } else {
      return ListView(
        padding: MySpacing.top(16),
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
                          color: customTheme.estatePrimary,
                          size: 14,
                        ),
                        MySpacing.width(4),
                        MyText.bodyMedium(
                          'San Jose, CA',
                          fontWeight: 600,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: customTheme.estatePrimary,
                        ),
                      ],
                    ),
                  ],
                ),
                MyContainer.bordered(
                  onTap: () {
                    _selectSizeSheet(context);
                  },
                  paddingAll: 6,
                  child: Icon(
                    Icons.more_horiz_outlined,
                    color: theme.colorScheme.onBackground,
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
                          MyCard.circular(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            paddingAll: 6,
                            color: customTheme.border,
                            child: Icon(
                              Icons.close,
                              size: 16,
                              color: theme.colorScheme.onBackground,
                            ),
                          ),
                          MyText.bodyMedium(
                            'Filters',
                            fontWeight: 600,
                          ),
                          MyText.bodySmall(
                            'Reset',
                            color: customTheme.estatePrimary,
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
                        'Price Range ( ${estateHomeController.selectedRange.start.toInt().toString()} - ${estateHomeController.selectedRange.end.toInt().toString()} )',
                        fontWeight: 700,
                      ),
                    ),
                    RangeSlider(
                        activeColor: customTheme.estatePrimary,
                        inactiveColor: customTheme.estatePrimary.withAlpha(100),
                        max: 10000,
                        min: 0,
                        values: estateHomeController.selectedRange,
                        onChanged: (RangeValues newRange) {
                          setState(() =>
                              estateHomeController.selectedRange = newRange);
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
                                if (estateHomeController.selectedBedRooms
                                    .contains(element)) {
                                  estateHomeController.selectedBedRooms
                                      .remove(element);
                                } else {
                                  estateHomeController.selectedBedRooms
                                      .add(element);
                                }
                              });
                            },
                            child: SingleBed(
                              bed: element,
                              selected: estateHomeController.selectedBedRooms
                                  .contains(element),
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
                                if (estateHomeController.selectedBathRooms
                                    .contains(element)) {
                                  estateHomeController.selectedBathRooms
                                      .remove(element);
                                } else {
                                  estateHomeController.selectedBathRooms
                                      .add(element);
                                }
                              });
                            },
                            child: SingleBath(
                              bath: element,
                              selected: estateHomeController.selectedBathRooms
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
                        padding: MySpacing.y(20),
                        backgroundColor: customTheme.estatePrimary,
                        child: MyText.titleSmall(
                          "Apply Filters",
                          fontWeight: 700,
                          color: customTheme.estateOnPrimary,
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
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
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
          color: selected ? customTheme.estatePrimary : customTheme.border),
      splashColor: customTheme.medicarePrimary.withAlpha(40),
      color: selected ? customTheme.estatePrimary : customTheme.border,
      child: MyText.bodySmall(
        widget.bed,
        fontWeight: 600,
        color: selected
            ? customTheme.estateOnPrimary
            : theme.colorScheme.onBackground,
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
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
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
          color: selected ? customTheme.estatePrimary : customTheme.border),
      splashColor: customTheme.medicarePrimary.withAlpha(40),
      color: selected ? customTheme.estatePrimary : customTheme.border,
      child: MyText.bodySmall(
        widget.bath,
        fontWeight: 600,
        color: selected
            ? customTheme.estateOnPrimary
            : theme.colorScheme.onBackground,
      ),
    );
  }
}
