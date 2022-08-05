import 'dart:math';

import 'package:flutkit/style/ScreenMedia.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../AppNotifier.dart';
import '../../AppTheme.dart';
import '../../utils/SizeConfig.dart';

class MyBottomNavigation extends StatefulWidget {
  final List<IconData> icons;
  final List<IconData> activeIcons;
  final List<Widget> screens;
  final List<String> titles;
  final Color activeColor, color, navigationBackground;
  final int initialIndex;
  final double activeIconSize, iconSize,bottomNavigationElevation;
  final Widget backButton;
  final Color splashColor, highlightColor, brandTextColor, verticalDividerColor;
  final Widget floatingActionButton;

  const MyBottomNavigation(
      {Key key,
      @required this.icons,
      this.activeIcons,
      @required this.screens,
      this.titles,
      this.activeColor,
      this.color,
      this.initialIndex,
      this.activeIconSize,
      this.iconSize,
      this.backButton,
      this.navigationBackground,
      this.splashColor,
      this.highlightColor,
      this.floatingActionButton,
      this.brandTextColor,
      this.verticalDividerColor, this.bottomNavigationElevation})
      : super(key: key);

  @override
  _MyBottomNavigationState createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation>
    with SingleTickerProviderStateMixin {
  //ThemeData
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  //Final Variables
  List<IconData> icons;
  List<IconData> activeIcons;
  List<Widget> screens;
  List<String> titles;
  Color activeColor,
      color,
      navigationBackground,
      splashColor,
      highlightColor,
      brandTextColor,
      verticalDividerColor;
  int length, initialIndex;
  double activeIconSize, iconSize, bottomNavigationElevation;
  Widget backButton;
  Widget floatingActionButton;

  //
  int _currentIndex = 0;
  TabController _tabController;

  ValueNotifier<bool> _isExtended;

  _handleTabSelection() {
    changeTab(_tabController.index);
  }

  onTapped(value) {
    changeTab(value);
  }

  dispose() {
    super.dispose();
    _tabController.dispose();
  }

  changeTab(int index) {
    setState(() {
      _currentIndex = index;
      _tabController.index = index;
    });
  }

  @override
  void initState() {
    super.initState();

    //Final Variables
    icons = widget.icons;
    activeIcons = widget.activeIcons ?? icons;
    screens = widget.screens;
    titles = widget.titles;
    activeColor = widget.activeColor;
    splashColor = widget.splashColor;
    highlightColor = widget.highlightColor;
    color = widget.color;
    length = icons.length;
    initialIndex = widget.initialIndex ?? 0;
    iconSize = widget.iconSize ?? widget.activeIconSize ?? 24;
    activeIconSize = widget.activeIconSize ?? widget.iconSize ?? 24;
    backButton = widget.backButton;
    navigationBackground = widget.navigationBackground;
    _currentIndex = initialIndex;
    floatingActionButton = widget.floatingActionButton;
    brandTextColor = widget.brandTextColor;
    verticalDividerColor = widget.verticalDividerColor;
    bottomNavigationElevation = widget.bottomNavigationElevation;

    //Mobile Tab Controller
    _tabController = new TabController(
        length: length, vsync: this, initialIndex: initialIndex);
    _tabController.addListener(_handleTabSelection);
    _tabController.animation.addListener(() {
      final aniValue = _tabController.animation.value;
      if (aniValue - _currentIndex > 0.5) {
        setState(() {
          _currentIndex = _currentIndex + 1;
        });
      } else if (aniValue - _currentIndex < -0.5) {
        setState(() {
          _currentIndex = _currentIndex - 1;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return MaterialApp(
            color: customAppTheme.bgLayer1,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (ScreenMedia.isMinimumSize(ScreenMediaType.XS,
                    currentWidth: constraints.maxWidth)) {
                  return mobileScreen();
                }
                return largeScreen(
                    ScreenMedia.getScreenMediaType(constraints.maxWidth));
              },
            ));
      },
    );
  }

  Widget mobileScreen() {
    List<Widget> tabs = [];

    for (int i = 0; i < length; i++) {
      tabs.add(Container(
        child: _currentIndex == i
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    activeIcons[i],
                    color: activeColor ?? themeData.colorScheme.primary,
                    size: activeIconSize,
                  ),
                  Spacing.height(4),
                  titles != null
                      ? Text(
                          titles[i],
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.caption,
                              color:
                                  activeColor ?? themeData.colorScheme.primary,
                              fontWeight: 600),
                        )
                      : SizedBox()
                ],
              )
            : Icon(
                icons[i],
                color: color ?? themeData.colorScheme.onBackground,
                size: iconSize,
              ),
      ));
    }

    return Scaffold(
      backgroundColor:
          customAppTheme.bgLayer1,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: BottomAppBar(
          elevation: bottomNavigationElevation??4,

          shape: CircularNotchedRectangle(),
          child: Container(
            decoration: BoxDecoration(
              color: navigationBackground ?? themeData.bottomAppBarTheme.color,
            ),
            padding: Spacing.y(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: themeData.colorScheme.primary,
                  tabs: tabs,
                ),
              ],
            ),
          )),
      body: TabBarView(
        controller: _tabController,
        children: screens,
      ),
    );
  }

  Widget largeScreen(ScreenMediaType screenMediaType) {
    List<NavigationRailDestination> rails = [];

    bool isTablet = ScreenMedia.isMinimumSize(ScreenMediaType.LG,
        currentScreenMediaType: screenMediaType);

    //Large Screen
    if (isTablet) _isExtended = ValueNotifier<bool>(false);
    if (_isExtended == null) _isExtended = ValueNotifier<bool>(!isTablet);

    for (int i = 0; i < length; i++) {
      rails.add(
        NavigationRailDestination(
          icon: Icon(
            icons[i],
            color: color ?? themeData.colorScheme.onBackground,
            size: 18,
          ),
          padding: Spacing.zero,
          selectedIcon: Icon(
            activeIcons[i],
            color: activeColor ?? themeData.colorScheme.primary,
            size: 18,
          ),
          label: titles != null
              ? Text(
                  titles[i],
                  style: AppTheme.getTextStyle(themeData.textTheme.caption,
                      color: _currentIndex == i
                          ? (activeColor ?? themeData.colorScheme.primary)
                          : (color ?? themeData.colorScheme.onBackground),
                      fontWeight: 600),
                )
              : Text(""),
        ),
      );
    }

    return Scaffold(
      floatingActionButton: floatingActionButton,
      body: Row(
        children: <Widget>[
          ValueListenableBuilder<bool>(
              valueListenable: _isExtended,
              builder: (context, value, child) {
                return Theme(
                  data: themeData.copyWith(
                    highlightColor: highlightColor ?? Colors.transparent,
                    colorScheme: themeData.colorScheme.copyWith(
                      primary: widget.splashColor ??
                          themeData.colorScheme.onBackground,
                    ),
                  ),
                  child: NavigationRail(
                    backgroundColor:
                        navigationBackground ?? customAppTheme.bgLayer1,
                    elevation: 10,
                    extended: _isExtended.value,
                    leading: _NavigationRailHeader(
                      extended: _isExtended,
                      brandTextColor: brandTextColor,
                    ),
                    selectedIndex: _currentIndex,
                    onDestinationSelected: (int index) {
                      setState(() {
                        changeTab(index);
                      });
                    },
                    minExtendedWidth: 200,
                    labelType: NavigationRailLabelType.none,
                    /*------------- Build Tabs -------------------*/
                    destinations: rails,
                  ),
                );
              }),
          VerticalDivider(
            width: 1.3,
            thickness: 1.3,
            color: verticalDividerColor??customAppTheme.border2,
          ),
          Expanded(
            child: screens[_currentIndex],
          )
        ],
      ),
    );
  }
}

class _NavigationRailHeader extends StatelessWidget {
  final ValueNotifier<bool> extended;
  final Color brandTextColor;

  const _NavigationRailHeader({
    @required this.extended,
    this.brandTextColor,
  }) : assert(extended != null);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final animation = NavigationRail.extendedAnimation(context);

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Align(
          alignment: AlignmentDirectional.centerStart,
          widthFactor: animation.value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 56,
                child: Row(
                  children: [
                    const SizedBox(width: 6),
                    InkWell(
                      key: const ValueKey('ReplyLogo'),
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      child: Row(
                        children: [
                          Transform.rotate(
                            angle: animation.value * pi,
                            child: const Icon(
                              Icons.arrow_left,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                          Spacing.width(2),
                          Image(
                            image: AssetImage(
                              'assets/brand/flutkit_icon.png',
                            ),
                            width: 24,
                          ),
                          Spacing.width(12),
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            widthFactor: animation.value,
                            child: Opacity(
                              opacity: animation.value,
                              child: Text(
                                'FLUTKIT',
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    fontWeight: 700,
                                    color: brandTextColor ??
                                        themeData.colorScheme.onBackground,
                                    letterSpacing: 0.4),
                              ),
                            ),
                          ),
                          SizedBox(width: 18 * animation.value),
                        ],
                      ),
                      splashColor: Colors.white24,
                      highlightColor: Colors.white24,
                      onTap: () {
                        extended.value = !extended.value;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
