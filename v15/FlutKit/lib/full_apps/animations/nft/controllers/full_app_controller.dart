import 'package:flutkit/full_apps/animations/nft/views/home_screen.dart';
import 'package:flutkit/full_apps/animations/nft/views/portfolio_screen.dart';
import 'package:flutkit/full_apps/animations/nft/views/profile_screen.dart';
import 'package:flutkit/full_apps/animations/nft/views/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class NavItem {
  final String title;
  final IconData iconData;

  NavItem(this.title, this.iconData);
}

class FullAppController extends GetxController {
  int currentIndex = 0;
  int pages = 4;
  late TabController tabController;

  final TickerProvider tickerProvider;

  late List<NavItem> navItems;
  late List<Widget> items;

  FullAppController(this.tickerProvider) {
    tabController =
        TabController(length: pages, vsync: tickerProvider, initialIndex: 0);

    navItems = [
      NavItem('Home', LucideIcons.home),
      NavItem('Portfolio', LucideIcons.pieChart),
      NavItem('Wallet', Icons.account_balance_wallet_outlined),
      NavItem('Profile', LucideIcons.user),
    ];

    items = [HomeScreen(), PortfolioScreen(), WalletScreen(), ProfileScreen()];
  }

  @override
  void onInit() {
    tabController.addListener(handleTabSelection);
    tabController.animation!.addListener(() {
      final aniValue = tabController.animation!.value;
      if (aniValue - currentIndex > 0.5) {
        currentIndex++;
        update();
      } else if (aniValue - currentIndex < -0.5) {
        currentIndex--;
        update();
      }
    });
    super.onInit();
  }

  handleTabSelection() {
    currentIndex = tabController.index;
    update();
  }
}
