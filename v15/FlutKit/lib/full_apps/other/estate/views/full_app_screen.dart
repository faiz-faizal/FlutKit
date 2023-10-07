import 'package:flutkit/full_apps/other/estate/controllers/full_app_controller.dart';
import 'package:flutkit/full_apps/other/estate/views/chat_screen.dart';
import 'package:flutkit/full_apps/other/estate/views/home_screen.dart';
import 'package:flutkit/full_apps/other/estate/views/profile_screen.dart';
import 'package:flutkit/full_apps/other/estate/views/search_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_bottom_navigation_bar.dart';
import 'package:flutkit/helpers/widgets/my_bottom_navigation_bar_item.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EstateFullAppScreen extends StatefulWidget {
  const EstateFullAppScreen({Key? key}) : super(key: key);

  @override
  _EstateFullAppScreenState createState() => _EstateFullAppScreenState();
}

class _EstateFullAppScreenState extends State<EstateFullAppScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;
  late EstateFullAppController controller;

  @override
  void initState() {
    super.initState();
    controller = EstateFullAppController();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
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
    return GetBuilder(
      init: controller,
      tag: 'estate_full_app_screen',
      builder: (controller) {
        return Scaffold(
          body: MyBottomNavigationBar(
            activeTitleColor: customTheme.estatePrimary,
            activeContainerColor: customTheme.estatePrimary.withAlpha(50),
            myBottomNavigationBarType: MyBottomNavigationBarType.containered,
            containerShape: BoxShape.circle,
            showActiveLabel: false,
            showLabel: false,
            activeIconColor: customTheme.estatePrimary,
            iconColor: theme.colorScheme.onBackground.withAlpha(140),
            itemList: [
              MyBottomNavigationBarItem(
                page: EstateHomeScreen(),
                activeIconData: Icons.other_houses,
                iconData: Icons.other_houses_outlined,
                activeIconSize: 24,
                iconSize: 24,
              ),
              MyBottomNavigationBarItem(
                page: EstateSearchScreen(),
                activeIconData: Icons.search,
                iconData: Icons.search,
                activeIconSize: 24,
                iconSize: 24,
              ),
              MyBottomNavigationBarItem(
                  page: EstateChatScreen(),
                  activeIconData: Icons.chat,
                  iconData: Icons.chat_outlined,
                  activeIconSize: 22,
                  iconSize: 24),
              MyBottomNavigationBarItem(
                page: EstateProfileScreen(),
                activeIconData: Icons.person,
                iconData: Icons.person_outline,
                activeIconSize: 24,
                iconSize: 24,
              ),
            ],
          ),
        );
      },
    );
  }
}
