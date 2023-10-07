import 'package:flutkit/full_apps/animations/nft/models/coin.dart';
import 'package:flutkit/full_apps/animations/nft/nft_cache.dart';
import 'package:flutkit/full_apps/animations/nft/views/single_coin_screen.dart';
import 'package:get/get.dart';

class PortfolioController extends GetxController {
  List<Coin> coins = [];

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    coins = NFTCache.coins!;
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
