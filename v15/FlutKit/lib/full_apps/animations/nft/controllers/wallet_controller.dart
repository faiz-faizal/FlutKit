import 'package:flutkit/full_apps/animations/nft/models/coin.dart';
import 'package:flutkit/full_apps/animations/nft/nft_cache.dart';
import 'package:flutkit/full_apps/animations/nft/views/single_coin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletController extends GetxController {
  List<String> currencyList = [];
  List<String> balanceList = [];
  List<IconData> balanceIcons = [];
  int selectedCurrencyType = 0;
  int selectedBalanceType = 0;
  List<Coin> coins = [];

  @override
  void onInit() {
    fetchData();
    currencyList = ["USD", "IDR", "SGD"];
    balanceList = ["Top Up", "Withdrawal"];
    balanceIcons = [
      Icons.account_balance_wallet_outlined,
      Icons.swap_horiz_outlined
    ];
    super.onInit();
  }

  fetchData() async {
    coins = NFTCache.coins!;
    update();
  }

  void selectCurrency(int index) {
    selectedCurrencyType = index;
    update();
  }

  void selectBalance(int index) {
    selectedBalanceType = index;
    update();
  }

  void goToSingleCoinScreen(Coin coin) {
    Get.to(SingleCoinScreen(coin: coin));
    // Navigator.of(context, rootNavigator: true).push(
    //   MaterialPageRoute(
    //     builder: (context) => SingleCoinScreen(coin: coin),
    //   ),
    // );
  }
}
