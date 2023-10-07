import 'package:flutkit/full_apps/animations/nft/controllers/wallet_controller.dart';
import 'package:flutkit/full_apps/animations/nft/models/coin.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  late ThemeData theme;
  late WalletController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.nftTheme;
    controller = WalletController();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletController>(
        init: controller,
        tag: 'wallet_controller',
        // theme: theme,
        builder: (controller) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: MySpacing.fromLTRB(
                    20, MySpacing.safeAreaTop(context) + 20, 20, 0),
                child: Column(
                  children: [
                    MyText.bodyMedium(
                      "Current Wallet balance",
                      fontWeight: 600,
                      xMuted: true,
                    ),
                    MyText.titleLarge("\$ 5,234.50", fontWeight: 700),
                    MySpacing.height(32),
                    currencyView(),
                    MySpacing.height(20),
                    balanceView(),
                    MySpacing.height(20),
                    coinsView(),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget coinsView() {
    List<Widget> list = [];
    for (int i = 0; i < controller.coins.length; i++) {
      Coin coin = controller.coins[i];
      list.add(MyContainer.bordered(
        onTap: () {
          controller.goToSingleCoinScreen(coin);
        },
        paddingAll: 12,
        margin: MySpacing.bottom(20),
        borderRadiusAll: Constant.containerRadius.small,
        color: theme.scaffoldBackgroundColor,
        child: Row(
          children: [
            Image(height: 32, width: 32, image: AssetImage(coin.image)),
            MySpacing.width(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText.bodyMedium("${coin.name} / ${coin.code}"),
                  MySpacing.height(4),
                  MyText.bodyMedium(
                    "\$ ${coin.priceChange}",
                    fontWeight: 700,
                  ),
                ],
              ),
            ),
            MyContainer(
              color: theme.colorScheme.primaryContainer,
              padding: MySpacing.xy(16, 8),
              borderRadiusAll: Constant.containerRadius.large,
              child: MyText.bodyMedium(
                "Buy",
                fontWeight: 600,
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
            MySpacing.width(12),
            MyContainer(
              padding: MySpacing.xy(16, 8),
              borderRadiusAll: Constant.containerRadius.large,
              child: MyText.bodyMedium(
                "Sell",
                fontWeight: 600,
              ),
            ),
          ],
        ),
      ));
    }
    return Column(
      children: list,
    );
  }

  Widget currencyView() {
    List<Widget> list = [];
    for (int i = 0; i < controller.currencyList.length; i++) {
      bool selected = controller.selectedCurrencyType == i;
      list.add(
        MyContainer(
          color: selected ? theme.colorScheme.primaryContainer : null,
          onTap: () {
            controller.selectCurrency(i);
          },
          borderRadiusAll: Constant.containerRadius.xs,
          padding: MySpacing.xy(24, 8),
          child: MyText(
            controller.currencyList[i],
            fontWeight: 600,
            color: selected ? theme.colorScheme.onPrimaryContainer : null,
          ),
        ),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: list,
    );
  }

  Widget balanceView() {
    return MyContainer.bordered(
      borderRadiusAll: Constant.containerRadius.small,
      color: theme.scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.bodySmall(
            "Balance",
            xMuted: true,
            fontWeight: 600,
          ),
          MyText.bodyMedium(
            "\$ 4,556.46",
            fontWeight: 700,
          ),
          MySpacing.height(16),
          balanceType(),
        ],
      ),
    );
  }

  Widget balanceType() {
    List<Widget> list = [];
    for (int i = 0; i < controller.balanceList.length; i++) {
      bool selected = controller.selectedBalanceType == i;
      list.add(MyContainer.bordered(
        onTap: () {
          controller.selectBalance(i);
        },
        padding: MySpacing.xy(16, 6),
        margin: MySpacing.right(16),
        color: selected
            ? theme.colorScheme.primary
            : theme.scaffoldBackgroundColor,
        border: Border.all(
            color: selected ? theme.colorScheme.primary : theme.dividerColor),
        borderRadiusAll: Constant.containerRadius.large,
        child: Row(
          children: [
            Icon(
              controller.balanceIcons[i],
              size: 20,
              color: selected ? theme.colorScheme.onPrimary : null,
            ),
            MySpacing.width(12),
            MyText.bodySmall(
              controller.balanceList[i],
              fontWeight: 600,
              color: selected ? theme.colorScheme.onPrimary : null,
            ),
          ],
        ),
      ));
    }
    return Row(
      children: list,
    );
  }
}
