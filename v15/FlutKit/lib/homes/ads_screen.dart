// import 'package:flutkit/helpers/theme/app_theme.dart';
// import 'package:flutkit/helpers/widgets/my_button.dart';
// import 'package:flutkit/helpers/widgets/my_spacing.dart';
// import 'package:flutkit/helpers/widgets/my_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
//
// class AdsScreen extends StatefulWidget {
//   @override
//   _AdsScreenState createState() => _AdsScreenState();
// }
//
// class _AdsScreenState extends State<AdsScreen> {
//   String testDevice = 'YOUR_DEVICE_ID';
//   int maxFailedLoadAttempts = 3;
//
//   late CustomTheme customTheme;
//   late ThemeData theme;
//
//   bool bannerDone = false;
//
//   @override
//   void initState() {
//     super.initState();
//     customTheme = AppTheme.customTheme;
//     theme = AppTheme.theme;
//     AdHelper.setCallback(setState);
//
//
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       AdHelper.initAll();
//     });
//
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           centerTitle: true,
//           leading: InkWell(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Icon(
//               FeatherIcons.chevronLeft,
//               size: 20,
//             ),
//           ),
//           title: MyText.titleMedium("Demo Ads", fontWeight: 600),
//         ),
//         body: Column(
//           children: [
//             Expanded(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Center(
//                     child: MyButton(
//                       elevation: 0,
//
//                       borderRadiusAll: 4,
//                       padding: MySpacing.xy(20, 18),
//                       onPressed: AdHelper.interstitialAd == null
//                           ? null
//                           : () => AdHelper.showInterstitialAd(),
//                       child: MyText.bodyLarge(
//                         'Interstitial',
//                         color: theme.colorScheme.onPrimary,
//                       ),
//                     ),
//                   ),
//                   MySpacing.height(20),
//                   Center(
//                     child: MyButton(
//                       elevation: 0,
//                       borderRadiusAll: 4,
//                       backgroundColor: Color(0xffff7300),
//                       padding: MySpacing.xy(20, 18),
//                       onPressed: AdHelper.rewardedAd == null
//                           ? null
//                           : () => AdHelper.showRewardedAd(),
//                       child: MyText.bodyLarge(
//                         'Awarded',
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   MySpacing.height(20),
//                   Center(
//                     child: MyButton(
//                       elevation: 0,
//                       borderRadiusAll: 4,
//                       backgroundColor: Colors.purple,
//                       padding: MySpacing.xy(20, 18),
//                       onPressed: AdHelper.interstitialRewardedAd == null
//                           ? null
//                           : () => AdHelper.showRewardedInterstitialAd(),
//                       child: MyText.bodyLarge(
//                         'Awarded Interstitial (Beta)',
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   MySpacing.height(20),
//                   Center(
//                     child: MyButton(
//                       elevation: 0,
//                       borderRadiusAll: 4,
//                       backgroundColor: Color(0xff0b85ff),
//                       padding: MySpacing.xy(20, 18),
//                       onPressed: AdHelper.appOpenAd == null
//                           ? null
//                           : () => AdHelper.showOpenAppAd(),
//                       child: MyText.bodyLarge(
//                         'Open app',
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   MySpacing.height(20),
//                   MyText(
//                     !AdHelper.earnReward
//                         ? 'If you see full ad then you win reward'
//                         : "Hurray!!! You earn rewards",
//                     fontWeight: 600,
//                     textAlign: TextAlign.center,
//                   )
//                 ],
//               ),
//             ),
//             if (AdHelper.bannerAd != null)
//               Container(
//                   width: 320,
//                   height: 50,
//                   child: AdWidget(ad: AdHelper.bannerAd!)),
//           ],
//         ));
//   }
// }
//
// class AdHelper {
//   static bool testing = true;
//
//   static Map<String, String> originalId = {
//     'banner': 'ca-app-pub-2589836711490682/5976715712',
//     'interstitial': 'ca-app-pub-2589836711490682/9744570334',
//     'rewarded': 'ca-app-pub-2589836711490682/6919876699',
//     'rewarded_interstitial': 'ca-app-pub-2589836711490682/7062566676',
//     'app_open': 'ca-app-pub-2589836711490682/9677901977',
//   };
//
//   static Map<String, String> testingId = {
//     'banner': 'ca-app-pub-3940256099942544/6300978111',
//     'interstitial': 'ca-app-pub-3940256099942544/1033173712',
//     'rewarded': 'ca-app-pub-3940256099942544/5224354917',
//     'rewarded_interstitial': 'ca-app-pub-3940256099942544/5354046379',
//     'app_open': 'ca-app-pub-3940256099942544/3419835294',
//   };
//
//   static String get bannerAdUnitId {
//     return ((testing ? testingId : originalId)['banner']) ?? '';
//   }
//
//   static String get interstitialAdUnitId {
//     return ((testing ? testingId : originalId)['interstitial']) ?? '';
//   }
//
//   static String get rewardedAdUnitId {
//     return ((testing ? testingId : originalId)['rewarded']) ?? '';
//   }
//
//   static String get rewardedInterstitialAdUnitId {
//     return ((testing ? testingId : originalId)['rewarded_interstitial']) ?? '';
//   }
//
//   static String get appOpenAdUnitId {
//     return ((testing ? testingId : originalId)['app_open']) ?? '';
//   }
//
//   static final AdRequest request = AdRequest(
//       // keywords: <String>['foo', 'bar'],
//       // contentUrl: 'http://foo.com/bar.html',
//       // nonPersonalizedAds: true,
//       );
//
//   static BannerAd? bannerAd = null;
//   static InterstitialAd? interstitialAd = null;
//   static RewardedAd? rewardedAd = null;
//   static RewardedInterstitialAd? interstitialRewardedAd = null;
//   static AppOpenAd? appOpenAd = null;
//
//   static bool earnReward = false;
//
//   static Function? callback;
//
//   static void setCallback(Function fn) {
//     callback = fn;
//   }
//
//   static void createBannerAds() {
//     bannerAd = BannerAd(
//       adUnitId: AdHelper.bannerAdUnitId,
//       size: AdSize.banner,
//       listener: BannerAdListener(
//           onAdLoaded: (_) {
//             callback?.call();
//           },
//           onAdFailedToLoad: (_, err) {}),
//       request: AdHelper.request,
//     );
//     bannerAd?.load();
//   }
//
//   static void createInitAds() {
//     InterstitialAd.load(
//         adUnitId: AdHelper.interstitialAdUnitId,
//         request: AdHelper.request,
//         adLoadCallback: InterstitialAdLoadCallback(
//           onAdLoaded: (InterstitialAd ad) {
//             print('$ad loaded');
//             callback?.call();
//             interstitialAd = ad;
//             interstitialAd!.setImmersiveMode(true);
//           },
//           onAdFailedToLoad: (LoadAdError error) {
//             print('InterstitialAd failed to load: $error.');
//           },
//         ));
//   }
//
//   static void showInterstitialAd() {
//     if (interstitialAd == null) {
//       print('Warning: attempt to show interstitial before loaded.');
//       return;
//     }
//     interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
//       onAdShowedFullScreenContent: (InterstitialAd ad) =>
//           print('ad onAdShowedFullScreenContent.'),
//       onAdDismissedFullScreenContent: (InterstitialAd ad) {
//         print('$ad onAdDismissedFullScreenContent.');
//         ad.dispose();
//         createInitAds();
//       },
//       onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
//         print('$ad onAdFailedToShowFullScreenContent: $error');
//         ad.dispose();
//         createInitAds();
//       },
//     );
//     interstitialAd!.show();
//     interstitialAd = null;
//   }
//
//   static void createRewardedAd() {
//     RewardedAd.load(
//         adUnitId: AdHelper.rewardedAdUnitId,
//         request: AdHelper.request,
//         rewardedAdLoadCallback: RewardedAdLoadCallback(
//           onAdLoaded: (RewardedAd ad) {
//             print('$ad loaded.');
//             callback?.call();
//             rewardedAd = ad;
//           },
//           onAdFailedToLoad: (LoadAdError error) {
//             print('RewardedAd failed to load: $error');
//             rewardedAd = null;
//             callback?.call();
//           },
//         ));
//   }
//
//   static void showRewardedAd() {
//     if (rewardedAd == null) {
//       print('Warning: attempt to show rewarded before loaded.');
//       return;
//     }
//     rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
//       onAdShowedFullScreenContent: (RewardedAd ad) =>
//           print('ad onAdShowedFullScreenContent.'),
//       onAdDismissedFullScreenContent: (RewardedAd ad) {
//         print('$ad onAdDismissedFullScreenContent.');
//         ad.dispose();
//         createRewardedAd();
//       },
//       onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
//         print('$ad onAdFailedToShowFullScreenContent: $error');
//         ad.dispose();
//         createRewardedAd();
//       },
//     );
//
//     rewardedAd!.setImmersiveMode(true);
//     rewardedAd!.show(onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
//       earnReward = true;
//       callback?.call();
//       print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
//     });
//     rewardedAd = null;
//   }
//
//   static void createRewardedInterstitialAd() {
//     RewardedInterstitialAd.load(
//         adUnitId: AdHelper.rewardedInterstitialAdUnitId,
//         request: AdHelper.request,
//         rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
//           onAdLoaded: (RewardedInterstitialAd ad) {
//             print('$ad loaded.');
//             interstitialRewardedAd = ad;
//             callback?.call();
//           },
//           onAdFailedToLoad: (LoadAdError error) {
//             print('RewardedInterstitialAd failed to load: $error');
//             interstitialRewardedAd = null;
//             callback?.call();
//           },
//         ));
//   }
//
//   static void showRewardedInterstitialAd() {
//     if (interstitialRewardedAd == null) {
//       print('Warning: attempt to show rewarded interstitial before loaded.');
//       return;
//     }
//     interstitialRewardedAd!.fullScreenContentCallback =
//         FullScreenContentCallback(
//       onAdShowedFullScreenContent: (RewardedInterstitialAd ad) =>
//           print('$ad onAdShowedFullScreenContent.'),
//       onAdDismissedFullScreenContent: (RewardedInterstitialAd ad) {
//         print('$ad onAdDismissedFullScreenContent.');
//         ad.dispose();
//         createRewardedInterstitialAd();
//       },
//       onAdFailedToShowFullScreenContent:
//           (RewardedInterstitialAd ad, AdError error) {
//         print('$ad onAdFailedToShowFullScreenContent: $error');
//         ad.dispose();
//         createRewardedInterstitialAd();
//       },
//     );
//
//     interstitialRewardedAd!.setImmersiveMode(true);
//     interstitialRewardedAd!.show(
//         onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
//       earnReward = true;
//       callback?.call();
//       print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
//     });
//     interstitialRewardedAd = null;
//   }
//
//   static void createOpenAppAd() {
//     AppOpenAd.load(
//       adUnitId: AdHelper.appOpenAdUnitId,
//       orientation: AppOpenAd.orientationPortrait,
//       adLoadCallback: AppOpenAdLoadCallback(
//         onAdLoaded: (ad) {
//           appOpenAd = ad;
//           callback?.call();
//         },
//         onAdFailedToLoad: (error) {
//           print('AppOpenAd failed to load: $error');
//           // Handle the error.
//         },
//       ),
//       request: AdHelper.request,
//     );
//   }
//
//   static void showOpenAppAd() {
//     if (appOpenAd == null) {
//       print('Tried to show ad before available.');
//       return;
//     }
//
//     // Set the fullScreenContentCallback and show the ad.
//     appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
//       onAdShowedFullScreenContent: (ad) {
//         print('$ad onAdShowedFullScreenContent');
//       },
//       onAdFailedToShowFullScreenContent: (ad, error) {
//         print('$ad onAdFailedToShowFullScreenContent: $error');
//         ad.dispose();
//         appOpenAd = null;
//       },
//       onAdDismissedFullScreenContent: (ad) {
//         print('$ad onAdDismissedFullScreenContent');
//         ad.dispose();
//         appOpenAd = null;
//         callback?.call();
//         createOpenAppAd();
//       },
//     );
//     appOpenAd!.show();
//     appOpenAd = null;
//   }
//
//   static Future<void> initAll() async {
//     createBannerAds();
//     createInitAds();
//     createRewardedAd();
//     createRewardedInterstitialAd();
//     createOpenAppAd();
//   }
// }
