import 'package:flutkit/full_apps/animations/nft/controllers/portfolio_controller.dart';
import 'package:flutkit/full_apps/animations/nft/models/coin.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  late ThemeData theme;
  late PortfolioController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.nftTheme;
    controller = PortfolioController();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PortfolioController>(
        init: controller,
        tag: 'portfolio_controller',
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
                    titleRow(),
                    MySpacing.height(32),
                    statistics(),
                    MySpacing.height(12),
                    Divider(),
                    MySpacing.height(12),
                    MyText.titleMedium(
                      "My Assets",
                      fontWeight: 700,
                    ),
                    MySpacing.height(20),
                    assetsView(),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget titleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.titleLarge(
              "\$ 25,587.56",
              fontWeight: 700,
            ),
            MyText.titleSmall(
              "Portfolio balance",
              fontWeight: 600,
              xMuted: true,
            ),
          ],
        ),
        MyContainer.rounded(
            paddingAll: 8,
            color: theme.colorScheme.primaryContainer,
            child: Icon(
              LucideIcons.arrowUpRight,
              size: 20,
              color: theme.colorScheme.onPrimaryContainer,
            )),
      ],
    );
  }

  Widget statistics() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText.bodySmall(
              "Today's Results",
              xMuted: true,
              fontWeight: 600,
            ),
            MyText.bodyMedium(
              "\$ 2513.65",
              fontWeight: 700,
            ),
          ],
        ),
        MySpacing.height(12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText.bodySmall(
              "Estimated Profit",
              xMuted: true,
              fontWeight: 600,
            ),
            MyText.bodyMedium(
              "\$ 34.40",
              fontWeight: 700,
            ),
          ],
        ),
        MySpacing.height(12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText.bodySmall(
              "Realized Profit",
              xMuted: true,
              fontWeight: 600,
            ),
            MyText.bodyMedium(
              "\$ 4533.55",
              fontWeight: 700,
            ),
          ],
        ),
      ],
    );
  }

  Widget assetsView() {
    List<Widget> list = [];

    for (int i = 0; i < controller.coins.length; i++) {
      Coin coin = controller.coins[i];
      list.add(
        MyContainer(
          onTap: () {
            controller.goToSingleCoinScreen(coin);
          },
          margin: MySpacing.bottom(20),
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
                        ? Colors.red
                        : Colors.green,
                    fontSize: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: list,
    );
  }
}
