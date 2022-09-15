import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/full_apps/shopping_manager/controllers/profile_controller.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/constant.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ThemeData theme;
  late ProfileController controller;
  late OutlineInputBorder outlineInputBorder;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.shoppingManagerTheme;
    controller = FxControllerStore.putOrFind(ProfileController());
    outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide.none,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<ProfileController>(
        controller: controller,
        theme: theme,
        builder: (controller) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                padding: FxSpacing.fromLTRB(
                    20, FxSpacing.safeAreaTop(context) + 16, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleRow(),
                    FxSpacing.height(20),
                    statistics(),
                    FxSpacing.height(24),
                    status(),
                    FxSpacing.height(24),
                    other(),
                    FxSpacing.height(32),
                    account()
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget titleRow() {
    return Row(
      children: [
        FxContainer(
          width: 10,
          height: 24,
          color: theme.colorScheme.primaryContainer,
          borderRadiusAll: 2,
        ),
        FxSpacing.width(8),
        FxText.titleMedium(
          "My Shop",
          fontWeight: 600,
        ),
      ],
    );
  }

  Widget statistics() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: FxContainer(
              paddingAll: 12,
              child: Row(
                children: [
                  FxContainer(
                      paddingAll: 10,
                      color: Constant.softColors.green.color,
                      child: Icon(
                        Icons.inventory_2_outlined,
                        size: 18,
                        color: Constant.softColors.green.onColor,
                      )),
                  FxSpacing.width(16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FxText.bodySmall(
                        'Products',
                        fontWeight: 600,
                      ),
                      FxSpacing.height(4),
                      FxText.bodyMedium(
                        '114',
                        fontWeight: 600,
                      ),
                    ],
                  )
                ],
              ),
            )),
            FxSpacing.width(16),
            Expanded(
                child: FxContainer(
              paddingAll: 10,
              child: Row(
                children: [
                  FxContainer(
                      paddingAll: 10,
                      color: Constant.softColors.blue.color,
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        size: 18,
                        color: Constant.softColors.blue.onColor,
                      )),
                  FxSpacing.width(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FxText.bodySmall(
                        'Orders',
                        fontWeight: 600,
                      ),
                      FxSpacing.height(4),
                      FxText.bodyMedium(
                        '284',
                        fontWeight: 600,
                      ),
                    ],
                  )
                ],
              ),
            )),
          ],
        ),
        FxSpacing.height(16),
        Row(
          children: [
            Expanded(
                child: FxContainer(
              paddingAll: 12,
              child: Row(
                children: [
                  FxContainer(
                      paddingAll: 10,
                      color: Constant.softColors.violet.color,
                      child: Icon(
                        FeatherIcons.users,
                        size: 18,
                        color: Constant.softColors.violet.onColor,
                      )),
                  FxSpacing.width(16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FxText.bodySmall(
                        'Users',
                        fontWeight: 600,
                      ),
                      FxSpacing.height(4),
                      FxText.bodyMedium(
                        '489',
                        fontWeight: 600,
                      ),
                    ],
                  )
                ],
              ),
            )),
            FxSpacing.width(16),
            Expanded(
                child: FxContainer(
              paddingAll: 10,
              child: Row(
                children: [
                  FxContainer(
                      paddingAll: 10,
                      color: Constant.softColors.pink.color,
                      child: Icon(
                        Icons.alt_route_outlined,
                        size: 18,
                        color: Constant.softColors.pink.onColor,
                      )),
                  FxSpacing.width(12),
                  Row(
                    children: [
                      FxText.bodySmall(
                        'View All',
                        fontWeight: 600,
                      ),
                      FxSpacing.width(4),
                      Icon(
                        FeatherIcons.chevronRight,
                        size: 16,
                      )
                    ],
                  ),
                ],
              ),
            )),
          ],
        ),
      ],
    );
  }

  Widget status() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FxText.bodySmall(
          'Shop Status',
          fontWeight: 600,
          muted: true,
        ),
        FxSpacing.height(20),
        Row(
          children: [
            FxContainer(
              onTap: () {
                controller.changeShopStatus(ShopStatus.close);
              },
              color: controller.shopStatus == ShopStatus.close
                  ? theme.colorScheme.primaryContainer
                  : null,
              padding: FxSpacing.fromLTRB(12, 8, 12, 8),
              child: Row(
                children: [
                  Icon(Icons.work_off_outlined,
                      size: 20,
                      color: controller.shopStatus == ShopStatus.close
                          ? theme.colorScheme.onPrimaryContainer
                          : null),
                  FxSpacing.width(8),
                  FxText.bodySmall("Close",
                      color: controller.shopStatus == ShopStatus.close
                          ? theme.colorScheme.onPrimaryContainer
                          : null)
                ],
              ),
            ),
            FxSpacing.width(16),
            FxContainer(
              onTap: () {
                controller.changeShopStatus(ShopStatus.open);
              },
              color: controller.shopStatus == ShopStatus.open
                  ? theme.colorScheme.primaryContainer
                  : null,
              padding: FxSpacing.fromLTRB(12, 8, 12, 8),
              child: Row(
                children: [
                  Icon(Icons.work_outline,
                      size: 20,
                      color: controller.shopStatus == ShopStatus.open
                          ? theme.colorScheme.onPrimaryContainer
                          : null),
                  FxSpacing.width(8),
                  FxText.bodySmall("Open",
                      color: controller.shopStatus == ShopStatus.open
                          ? theme.colorScheme.onPrimaryContainer
                          : null)
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget other() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FxText.bodySmall(
          'Activity',
          fontWeight: 600,
          muted: true,
        ),
        FxSpacing.height(20),
        Row(
          children: [
            FxContainer(
              paddingAll: 8,
              color: Constant.softColors.blue.color,
              child: Icon(
                Icons.account_balance_wallet_outlined,
                size: 20,
                color: Constant.softColors.blue.onColor,
              ),
            ),
            FxSpacing.width(16),
            Expanded(child: FxText.bodyMedium('Payments')),
            FxSpacing.width(16),
            Row(
              children: [
                FxContainer.rounded(
                  height: 24,
                  width: 24,
                  paddingAll: 0,
                  color: theme.colorScheme.primary,
                  child: Center(
                    child: FxText.bodySmall(
                      '4',
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
                FxSpacing.width(4),
                Icon(
                  FeatherIcons.chevronRight,
                  size: 18,
                  color: theme.colorScheme.primary,
                )
              ],
            )
          ],
        ),
        FxSpacing.height(16),
        Row(
          children: [
            FxContainer(
              paddingAll: 8,
              color: Constant.softColors.green.color,
              child: Icon(
                Icons.location_on_outlined,
                size: 20,
                color: Constant.softColors.green.onColor,
              ),
            ),
            FxSpacing.width(16),
            Expanded(child: FxText.bodyMedium('Shop Location')),
            FxSpacing.width(16),
            Icon(
              FeatherIcons.chevronRight,
              size: 20,
            )
          ],
        ),
        FxSpacing.height(16),
        Row(
          children: [
            FxContainer(
              paddingAll: 8,
              color: Constant.softColors.orange.color,
              child: Icon(
                Icons.privacy_tip_outlined,
                size: 20,
                color: Constant.softColors.orange.onColor,
              ),
            ),
            FxSpacing.width(16),
            Expanded(child: FxText.bodyMedium('Privacy')),
            FxSpacing.width(16),
            Row(
              children: [
                FxText.bodySmall(
                  'Action Needed',
                  color: theme.colorScheme.error,
                  fontWeight: 600,
                ),
                FxSpacing.width(4),
                Icon(
                  FeatherIcons.chevronRight,
                  size: 18,
                  color: theme.colorScheme.error,
                )
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget account() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FxText.bodySmall(
          'My Account',
          fontWeight: 600,
          xMuted: true,
        ),
        FxSpacing.height(8),
        FxButton.text(
            padding: FxSpacing.zero,
            onPressed: () {},
            child: FxText.bodyMedium(
              'Switch to another account',
              color: theme.colorScheme.primary,
              fontWeight: 600,
            )),
        FxSpacing.height(20),
        Center(
          child: FxButton(
              backgroundColor: theme.colorScheme.errorContainer,
              elevation: 0,
              borderRadiusAll: Constant.buttonRadius.small,
              onPressed: () {
                controller.logout();
              },
              child: FxText(
                'Logout',
                color: theme.colorScheme.onErrorContainer,
                fontWeight: 600,
              )),
        )
      ],
    );
  }
}
