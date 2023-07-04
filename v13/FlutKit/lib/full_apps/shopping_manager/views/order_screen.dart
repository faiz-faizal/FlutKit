import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutkit/images.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/constant.dart';

import '../controllers/order_controller.dart';
import '../model/order.dart';

class OrderScreen extends StatefulWidget {
  final Order order;

  const OrderScreen(this.order, {Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  late ThemeData theme;
  late OrderController controller;
  late OutlineInputBorder outlineInputBorder;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.shoppingManagerTheme;
    controller = FxControllerStore.put(OrderController(widget.order));
    outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        color: theme.dividerColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<OrderController>(
        controller: controller,
        theme: theme,
        builder: (controller) {
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: GoogleMap(
                    polylines: controller.polylines,
                    markers: controller.markers,
                    onMapCreated: controller.onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: controller.center,
                      zoom: 16,
                      bearing: 116,
                    ),
                    buildingsEnabled: false,
                    compassEnabled: false,
                  ),
                ),
                Container(
                  padding: FxSpacing.all(20),
                  child: Column(
                    children: [status()],
                  ),
                )
              ],
            ),
          );
        });
  }

  Widget status() {
    return FxContainer(
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                  onTap: () {
                    controller.goBack();
                  },
                  child: Icon(
                    FeatherIcons.chevronLeft,
                    size: 20,
                  )),
              FxSpacing.width(8),
              ClipRRect(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  borderRadius: BorderRadius.circular(28),
                  child: Image(
                    image: AssetImage(Images.profiles[1]),
                    height: 32,
                    width: 32,
                  )),
              FxSpacing.width(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FxText.bodyMedium(
                      "John nikol",
                      fontWeight: 600,
                    ),
                    FxSpacing.height(2),
                    FxText.bodySmall(
                      "On the way",
                      fontWeight: 600,
                      muted: true,
                      fontSize: 11,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star_rounded,
                    color: Constant.softColors.star,
                    size: 20,
                  ),
                  FxSpacing.width(4),
                  FxText.bodyMedium(
                    "4.6",
                    fontWeight: 600,
                  ),
                  FxSpacing.width(2),
                  FxText.bodySmall(
                    "(30)",
                    muted: true,
                    fontWeight: 600,
                  ),
                ],
              )
            ],
          ),
          Divider(
            height: 36,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText.bodySmall(
                    'Estimate Time',
                    xMuted: true,
                    fontWeight: 600,
                  ),
                  FxSpacing.height(8),
                  Row(
                    children: [
                      FxText.titleLarge(
                        '30-35',
                        fontWeight: 600,
                      ),
                      FxSpacing.width(4),
                      FxText.bodySmall(
                        'minute',
                        fontWeight: 600,
                        muted: true,
                        letterSpacing: 0,
                      ),
                    ],
                  ),
                ],
              ),
              FxContainer.bordered(
                padding: FxSpacing.xy(12, 8),
                child: Column(
                  children: [
                    FxText.bodySmall(
                      'Today',
                      fontWeight: 600,
                    ),
                    FxSpacing.height(4),
                    FxText.bodyMedium(
                      '10:48',
                      fontWeight: 700,
                    ),
                  ],
                ),
              )
            ],
          ),
          FxSpacing.height(8),
          Row(
            children: [
              Row(
                children: [
                  FxContainer.bordered(
                    paddingAll: 4,
                    child: Icon(
                      FeatherIcons.chevronDown,
                      size: 10,
                    ),
                  ),
                  FxSpacing.width(4),
                  FxText.bodySmall(
                    'Details',
                    fontWeight: 600,
                    xMuted: true,
                  )
                ],
              ),
              FxSpacing.width(16),
              Expanded(
                  child: FxButton(
                onPressed: () {},
                elevation: 0,
                borderRadiusAll: Constant.buttonRadius.small,
                backgroundColor: theme.colorScheme.primary,
                padding: FxSpacing.y(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FeatherIcons.phoneCall,
                      color: theme.colorScheme.onPrimary,
                      size: 16,
                    ),
                    FxSpacing.width(8),
                    FxText.bodyMedium(
                      "Connect",
                      color: theme.colorScheme.onPrimary,
                    )
                  ],
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}
