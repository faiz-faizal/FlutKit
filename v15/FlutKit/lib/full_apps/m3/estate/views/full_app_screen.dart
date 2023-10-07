import 'package:flutkit/full_apps/m3/estate/views/chat_screen.dart';
import 'package:flutkit/full_apps/m3/estate/views/home_screen.dart';
import 'package:flutkit/full_apps/m3/estate/views/profile_screen.dart';
import 'package:flutkit/full_apps/m3/estate/views/search_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/widgets/my_bottom_navigation_bar.dart';
import 'package:flutkit/helpers/widgets/my_bottom_navigation_bar_item.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FullAppScreen extends StatefulWidget {
  const FullAppScreen({Key? key}) : super(key: key);

  @override
  _FullAppScreenState createState() => _FullAppScreenState();
}

class _FullAppScreenState extends State<FullAppScreen> {
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.estateTheme;
    MyTextStyle.changeFontFamily(GoogleFonts.quicksand);
    MyTextStyle.changeDefaultFontWeight({
      100: FontWeight.w100,
      200: FontWeight.w200,
      300: FontWeight.w300,
      400: FontWeight.w400,
      500: FontWeight.w500,
      600: FontWeight.w600,
      700: FontWeight.w700,
      800: FontWeight.w800,
      900: FontWeight.w900,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: theme.colorScheme.primaryContainer)),
      child: Scaffold(
        body: MyBottomNavigationBar(
          activeTitleColor: theme.colorScheme.primary,
          activeContainerColor: theme.colorScheme.primary.withAlpha(80),
          myBottomNavigationBarType: MyBottomNavigationBarType.containered,
          containerShape: BoxShape.rectangle,
          containerRadius: Constant.containerRadius.small,
          showActiveLabel: false,
          showLabel: false,
          activeIconColor: theme.colorScheme.primary,
          iconColor: theme.colorScheme.onPrimaryContainer.withAlpha(120),
          backgroundColor: theme.colorScheme.primaryContainer,
          itemList: [
            MyBottomNavigationBarItem(
              page: HomeScreen(),
              activeIconData: Icons.other_houses,
              iconData: Icons.other_houses_outlined,
              activeIconSize: 24,
              iconSize: 24,
            ),
            MyBottomNavigationBarItem(
              page: SearchScreen(),
              activeIconData: Icons.search,
              iconData: Icons.search,
              activeIconSize: 24,
              iconSize: 24,
            ),
            MyBottomNavigationBarItem(
                page: ChatScreen(),
                activeIconData: Icons.chat,
                iconData: Icons.chat_outlined,
                activeIconSize: 22,
                iconSize: 24),
            MyBottomNavigationBarItem(
              page: ProfileScreen(),
              activeIconData: Icons.person,
              iconData: Icons.person_outline,
              activeIconSize: 24,
              iconSize: 24,
            ),
          ],
        ),
      ),
    );
  }
}
