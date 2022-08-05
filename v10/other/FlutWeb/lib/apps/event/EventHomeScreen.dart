import 'package:flutkit/style/MyCard.dart';
import 'package:flutkit/style/MyContainer.dart';
import 'package:flutkit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppNotifier.dart';
import '../../AppTheme.dart';
import 'EventSingleEventScreen.dart';

class EventHomeScreen extends StatefulWidget {
  @override
  _EventHomeScreenState createState() => _EventHomeScreenState();
}

class _EventHomeScreenState extends State<EventHomeScreen> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  int selectedCategory = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return SafeArea(
          child: Scaffold(
              key: _scaffoldKey,
              endDrawer: FilterWidget(
                themeType: value.themeMode(),
              ),
              resizeToAvoidBottomInset: false,
              body: Container(
                color: customAppTheme.bgLayer1,
                child: ListView(
                  padding: Spacing.fromLTRB(24, 16, 24, 0),
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Today 24 Aug, 2020",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    fontWeight: 500,
                                    letterSpacing: 0,
                                    color: themeData.colorScheme.onBackground),
                              ),
                              Container(
                                child: Text(
                                  "Discover Events",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.headline5,
                                      fontSize: 24,
                                      fontWeight: 700,
                                      letterSpacing: -0.3,
                                      color:
                                          themeData.colorScheme.onBackground),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            MyCard.bordered(
                              paddingAll: 8,
                              child: Icon(
                                MdiIcons.bellOutline,
                                size: 18,
                                color: themeData.colorScheme.onBackground
                                    .withAlpha(160),
                              ),
                            ),
                            Positioned(
                              right: 6,
                              top: 6,
                              child: Container(
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                    color: customAppTheme.colorError,
                                    shape: BoxShape.circle),
                              ),
                            )
                          ],
                        ),
                        Spacing.width(16),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          child: Image(
                            image: AssetImage('./assets/images/avatar-2.jpg'),
                            width: 32,
                            height: 32,
                          ),
                        )
                      ],
                    ),
                    Spacing.height(16),
                    Row(
                      children: [
                        Expanded(
                          child: MyContainer.bordered(
                            padding: Spacing.all(6),
                            child: Row(
                              children: [
                                Container(
                                  margin: Spacing.left(12),
                                  child: Icon(
                                    MdiIcons.magnify,
                                    color: themeData.colorScheme.onBackground
                                        .withAlpha(200),
                                    size: 16,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: Spacing.left(12),
                                    child: TextFormField(
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText2,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 500),
                                      decoration: InputDecoration(
                                        fillColor: customAppTheme.bgLayer1,
                                        hintStyle: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText2,
                                            color: themeData
                                                .colorScheme.onBackground,
                                            muted: true,
                                            fontWeight: 500),
                                        hintText: "Find Events...",
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        isDense: true,
                                      ),
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacing.width(16),
                        InkWell(
                          onTap: () {
                            _scaffoldKey.currentState.openEndDrawer();
                          },
                          child: MyContainer(
                            paddingAll: 8,
                            color: themeData.colorScheme.primary,
                            child: Icon(
                              MdiIcons.tune,
                              size: 20,
                              color: themeData.colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: Spacing.y(16),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            singleCategory(
                                title: "All",
                                iconData: MdiIcons.ballotOutline,
                                index: 0),
                            Spacing.width(16),
                            singleCategory(
                                title: "Birthday",
                                iconData: MdiIcons.cakeVariant,
                                index: 1),
                            Spacing.width(16),
                            singleCategory(
                                title: "Party",
                                iconData: MdiIcons.partyPopper,
                                index: 2),
                            Spacing.width(16),
                            singleCategory(
                                title: "Talks",
                                iconData: MdiIcons.chatOutline,
                                index: 3),
                            Spacing.width(16),
                            singleCategory(
                                title: "Food",
                                iconData: MdiIcons.food,
                                index: 4),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      "Popular",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle1,
                          fontWeight: 700,
                          color: themeData.colorScheme.onBackground),
                    ),
                    Spacing.height(16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          singleEvent(
                              title: "Flutter Test",
                              image: './assets/design/pattern-1.png',
                              date: "04",
                              month: "May",
                              subject: "California, US",
                              time: "07:30 PM - 09:00 PM",
                              width: 200),
                          Spacing.width(16),
                          singleEvent(
                              title: "Flutter Dev",
                              image: './assets/images/social/post-l1.jpg',
                              date: "29",
                              month: "Feb",
                              subject: "California, US",
                              time: "07:30 PM - 09:00 PM",
                              width: 200),
                          Spacing.width(16),
                          singleEvent(
                              title: "Flutter Test",
                              image: './assets/design/pattern-1.png',
                              date: "04",
                              month: "May",
                              subject: "California, US",
                              time: "07:30 PM - 09:00 PM",
                              width: 200),
                        ],
                      ),
                    ),
                    Spacing.height(16),
                    Text(
                      "This Weekend",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle1,
                          fontWeight: 700,
                          color: themeData.colorScheme.onBackground),
                    ),
                    Spacing.height(16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          singleEvent(
                              title: "Flutter Test",
                              image: './assets/design/pattern-1.png',
                              date: "04",
                              month: "May",
                              subject: "California, US",
                              time: "07:30 PM - 09:00 PM",
                              width: 200),
                          Spacing.width(16),
                          singleEvent(
                              title: "Flutter Dev",
                              image: './assets/images/social/post-l1.jpg',
                              date: "29",
                              month: "Feb",
                              subject: "California, US",
                              time: "07:30 PM - 09:00 PM",
                              width: 200),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }

  Widget singleCategory({IconData iconData, String title, int index}) {
    bool isSelected = (selectedCategory == index);
    return MyCard(
      onTap: () {
        if (!isSelected) {
          setState(() {
            selectedCategory = index;
          });
        }
      },
      color:
          isSelected ? themeData.colorScheme.primary : customAppTheme.bgLayer1,
      border:
          Border.all(color: customAppTheme.bgLayer2, width: isSelected ? 0 : 1),
      bordered: isSelected,
      shadow: MyShadow(
          elevation: isSelected ? 4 : 0,
          color: themeData.colorScheme.primary.withAlpha(80)),
      padding: Spacing.fromLTRB(16, 8, 16, 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            size: 22,
            color: isSelected
                ? themeData.colorScheme.onPrimary
                : themeData.colorScheme.onBackground,
          ),
          Container(
            margin: Spacing.left(8),
            child: Text(
              title,
              style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                  color: isSelected
                      ? themeData.colorScheme.onPrimary
                      : themeData.colorScheme.onBackground),
            ),
          )
        ],
      ),
    );
  }

  Widget singleEvent(
      {String image,
      String date,
      String month,
      String title,
      String subject,
      String time,
      @required double width}) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => EventSingleEventScreen()));
      },
      child: MyContainer.bordered(
        clipBehavior: Clip.hardEdge,
        paddingAll: 0,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                    child: Image(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                      width: width,
                      height: width * 0.55,
                    ),
                  ),
                  Positioned(
                    bottom: -16,
                    left: 16,
                    child: MyCard(
                      shadow: MyShadow(elevation: 16, darkShadow: true),
                      padding: Spacing.fromLTRB(8, 4, 8, 4),
                      child: Column(
                        children: [
                          Text(
                            date,
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                color: themeData.colorScheme.primary,
                                fontWeight: 600),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            month,
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.caption,
                                fontSize: 11,
                                color: themeData.colorScheme.primary,
                                fontWeight: 600),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: Spacing.fromLTRB(16, 24, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                  ),
                  Container(
                    margin: Spacing.top(8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                subject,
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    fontSize: 12,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 500,
                                    xMuted: true),
                              ),
                              Container(
                                margin: Spacing.top(2),
                                child: Text(
                                  time,
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      fontSize: 10,
                                      color: themeData.colorScheme.onBackground,
                                      fontWeight: 500,
                                      xMuted: true),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Icon(
                            MdiIcons.heartOutline,
                            size: 20,
                            color: themeData.colorScheme.primary,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FilterWidget extends StatefulWidget {
  final int themeType;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const FilterWidget({Key key, @required this.themeType, this.scaffoldKey})
      : super(key: key);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  double _startValue = 30;
  double _endValue = 60;
  int selectedLocation = 0, selectedDate = 2, selectedTOD = 1;

  @override
  void initState() {
    super.initState();
    themeData = AppTheme.getThemeFromThemeMode(widget.themeType);
    customAppTheme = AppTheme.getCustomAppTheme(widget.themeType);
  }

  _pickDate(BuildContext context) async {
    await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
  }

  _pickTime(BuildContext context) async {
    await showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: Spacing.y(16),
      padding: Spacing.xy(24, 16),
      decoration: BoxDecoration(
          color: customAppTheme.bgLayer1,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), bottomLeft: Radius.circular(16))),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    MdiIcons.close,
                    color: themeData.colorScheme.onBackground,
                    size: 16,
                  ),
                ),
                Text(
                  "Filter".toUpperCase(),
                  style: AppTheme.getTextStyle(themeData.textTheme.caption,
                      fontWeight: 700,
                      color: themeData.colorScheme.onBackground),
                ),
                Text(
                  "Reset",
                  style: AppTheme.getTextStyle(themeData.textTheme.caption,
                      fontSize: 12,
                      xMuted: true,
                      letterSpacing: 0,
                      fontWeight: 600,
                      color: themeData.colorScheme.onBackground),
                )
              ],
            ),
            Spacing.height(16),
            Text(
              "Location",
              style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                  color: themeData.colorScheme.onBackground, fontWeight: 700),
            ),
            Spacing.height(8),
            locationWidget(),
            Spacing.height(16),
            Text(
              "Date",
              style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                  color: themeData.colorScheme.onBackground, fontWeight: 700),
            ),
            Spacing.height(8),
            dateWidget(),
            Spacing.height(16),
            Text(
              "Time of day",
              style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                  color: themeData.colorScheme.onBackground, fontWeight: 700),
            ),
            Spacing.height(8),
            todWidget(),
            Spacing.height(16),
            Text(
              "Price",
              style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                  color: themeData.colorScheme.onBackground, fontWeight: 700),
            ),
            Spacing.height(8),
            Text(
              ((_startValue == 0)
                      ? "Free"
                      : "\$" + _startValue.floor().toString()) +
                  " - \$" +
                  _endValue.floor().toString(),
              style: AppTheme.getTextStyle(themeData.textTheme.caption,
                  color: themeData.colorScheme.onBackground, fontWeight: 600),
            ),
            SliderTheme(
              data: SliderThemeData(
                rangeThumbShape:
                    RoundRangeSliderThumbShape(enabledThumbRadius: 7),
                trackHeight: 2,
              ),
              child: RangeSlider(
                values: RangeValues(_startValue, _endValue),
                min: 0,
                max: 199,
                onChanged: (values) {
                  setState(() {
                    _startValue = values.start.roundToDouble();
                    _endValue = values.end.roundToDouble();
                  });
                },
              ),
            ),
            Spacing.height(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "CANCEL",
                      style: AppTheme.getTextStyle(themeData.textTheme.caption,
                          fontSize: 12,
                          color: themeData.colorScheme.primary,
                          letterSpacing: 0.5,
                          fontWeight: 600),
                    )),
                ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(Spacing.xy(32, 0))),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "APPLY",
                    style: AppTheme.getTextStyle(themeData.textTheme.caption,
                        fontWeight: 600,
                        fontSize: 12,
                        letterSpacing: 0.5,
                        color: themeData.colorScheme.onPrimary),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget locationWidget() {
    return Container(
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                selectedLocation = 0;
              });
            },
            child: singleChip(
                isSelected: selectedLocation == 0,
                text: "Current location",
                iconData: MdiIcons.mapMarkerOutline),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedLocation = 1;
              });
            },
            child: singleChip(
                isSelected: selectedLocation == 1,
                text: "Search",
                iconData: MdiIcons.magnify),
          ),
        ],
      ),
    );
  }

  Widget todWidget() {
    return Container(
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                selectedTOD = 0;
              });
            },
            child: singleChip(isSelected: selectedTOD == 0, text: "Day"),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedTOD = 1;
              });
            },
            child: singleChip(isSelected: selectedTOD == 1, text: "Night"),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedTOD = 2;
                _pickTime(context);
              });
            },
            child: singleChip(
                isSelected: selectedTOD == 2,
                text: "Choose time",
                iconData: MdiIcons.clockOutline),
          ),
        ],
      ),
    );
  }

  Widget dateWidget() {
    return Container(
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                selectedDate = 0;
              });
            },
            child: singleChip(isSelected: selectedDate == 0, text: "Today"),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedDate = 1;
              });
            },
            child: singleChip(isSelected: selectedDate == 1, text: "Tomorrow"),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedDate = 2;
              });
            },
            child: singleChip(
              isSelected: selectedDate == 2,
              text: "This week",
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedDate = 3;
                _pickDate(context);
              });
            },
            child: singleChip(
                isSelected: selectedDate == 3,
                text: "Choose a date",
                iconData: MdiIcons.calendarOutline),
          ),
        ],
      ),
    );
  }

  Widget singleChip({IconData iconData, String text, bool isSelected}) {
    if (iconData != null) {
      return Chip(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: isSelected
            ? themeData.colorScheme.primary
            : themeData.colorScheme.primary.withAlpha(24),
        avatar: Icon(iconData,
            size: 16,
            color: isSelected
                ? themeData.colorScheme.onPrimary
                : themeData.colorScheme.primary),
        label: Text(
          text,
          style: AppTheme.getTextStyle(themeData.textTheme.caption,
              fontSize: 12.5,
              color: isSelected
                  ? themeData.colorScheme.onPrimary
                  : themeData.colorScheme.primary,
              letterSpacing: 0,
              wordSpacing: 0,
              fontWeight: 500),
        ),
        padding: Spacing.fromLTRB(12, 6, 12, 6),
      );
    }

    return Chip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      backgroundColor: isSelected
          ? themeData.colorScheme.primary
          : themeData.colorScheme.primary.withAlpha(24),
      label: Text(
        text,
        style: AppTheme.getTextStyle(themeData.textTheme.caption,
            color: isSelected
                ? themeData.colorScheme.onPrimary
                : themeData.colorScheme.primary,
            letterSpacing: 0,
            wordSpacing: 0,
            fontWeight: 500),
      ),
      padding: Spacing.fromLTRB(12, 6, 12, 6),
    );
  }
}
