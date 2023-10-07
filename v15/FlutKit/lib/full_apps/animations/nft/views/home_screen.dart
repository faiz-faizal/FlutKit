import 'package:flutkit/full_apps/animations/nft/controllers/home_controller.dart';
import 'package:flutkit/full_apps/animations/nft/models/coin.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
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
  late HomeController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.nftTheme;
    controller = HomeController();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: controller,
        tag: 'home_controller',
        // theme: theme,
        builder: (controller) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: MySpacing.fromLTRB(
                    20, MySpacing.safeAreaTop(context) + 20, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    balance(),
                    MySpacing.height(20),
                    MyText.titleMedium(
                      "Popular Coins",
                      fontWeight: 700,
                    ),
                    MySpacing.height(20),
                    coinsGrid(),
                    MySpacing.height(20),
                    MyText.titleMedium(
                      "Crypto Assets",
                      fontWeight: 700,
                    ),
                    MySpacing.height(20),
                    transactionList(),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget balance() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.titleSmall(
              "Balance",
              fontWeight: 600,
            ),
            MySpacing.height(4),
            MyText.titleLarge(
              "\$ 5,234.50",
              fontWeight: 700,
            ),
            MyText.titleSmall(
              "3.56%",
              color: theme.colorScheme.primary,
              fontWeight: 600,
            ),
          ],
        ),
        MyContainer.roundBordered(
          onTap: () {},
          paddingAll: 8,
          color: theme.scaffoldBackgroundColor,
          child: Icon(
            LucideIcons.bell,
            size: 20,
          ),
        ),
      ],
    );
  }

  Widget coinsGrid() {
    return GridView.builder(
        padding: MySpacing.zero,
        shrinkWrap: true,
        itemCount: controller.coins.length,
        physics: ClampingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: controller.findAspectRatio(),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (BuildContext context, int index) {
          return singleCoin(controller.coins[index]);
        });
  }

  Widget singleCoin(Coin coin) {
    return MyContainer(
      onTap: () {
        controller.goToSingleCoinScreen(coin);
      },
      paddingAll: 12,
      borderRadiusAll: Constant.containerRadius.xs,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            height: 32,
            width: 32,
            image: AssetImage(coin.image),
          ),
          MySpacing.height(8),
          MyText.bodySmall(
            coin.name.toUpperCase(),
            fontWeight: 700,
          ),
          MySpacing.height(2),
          MyText.bodySmall(
            coin.price.toString(),
            xMuted: true,
            fontSize: 10,
          ),
          MySpacing.height(8),
          MyText.bodySmall(
            coin.priceChange.toString(),
            fontWeight: 600,
            fontSize: 10,
          ),
          MySpacing.height(2),
          MyText.bodySmall(
            "${coin.percentChange}%",
            fontWeight: 600,
            color: (coin.percentChange.toString().startsWith("-"))
                ? theme.colorScheme.error
                : theme.colorScheme.primary,
            fontSize: 10,
          ),
          MySpacing.height(2),
        ],
      ),
    );
  }

  Widget transactionList() {
    return ListView.separated(
      shrinkWrap: true,
      padding: MySpacing.zero,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          height: 28,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        Coin coin = controller.coins[index];

        return InkWell(
          onTap: () {
            controller.goToSingleCoinScreen(coin);
          },
          child: Row(
            children: [
              Image(
                height: 32,
                width: 32,
                image: AssetImage(coin.image),
              ),
              MySpacing.width(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText.bodySmall(
                      coin.name.toUpperCase(),
                      fontWeight: 700,
                    ),
                    MyText.bodySmall(
                      "${coin.date.day}-${coin.date.month}-${coin.date.year}",
                      fontSize: 10,
                    ),
                  ],
                ),
              ),
              MySpacing.width(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText.bodySmall(
                    coin.priceChange.toString(),
                    fontWeight: 600,
                    fontSize: 10,
                  ),
                  MyText.bodySmall(
                    "${coin.percentChange}%",
                    color: (coin.percentChange.toString().startsWith("-"))
                        ? theme.colorScheme.error
                        : theme.colorScheme.primary,
                    fontSize: 10,
                    fontWeight: 600,
                  ),
                ],
              ),
            ],
          ),
        );
      },
      itemCount: controller.coins.length,
    );
  }
}
