import 'package:flutkit/full_apps/animations/nft/models/coin.dart';

class NFTCache {
  static List<Coin>? coins;
  static Future<void> initDummy() async {
    NFTCache.coins = await Coin.getDummyList();
  }
}
