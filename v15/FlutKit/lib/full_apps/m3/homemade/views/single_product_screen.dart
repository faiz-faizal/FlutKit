import 'package:flutkit/full_apps/m3/homemade/controllers/single_product_controller.dart';
import 'package:flutkit/full_apps/m3/homemade/models/product_image.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_card.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_star_rating.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SingleProductScreen extends StatefulWidget {
  const SingleProductScreen({Key? key}) : super(key: key);

  @override
  _SingleProductScreenState createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {
  late ThemeData theme;
  late SingleProductController singleProductController;

  @override
  void initState() {
    super.initState();
    singleProductController = SingleProductController();
    theme = AppTheme.homemadeTheme;
  }

  List<Widget> _buildThumbnails() {
    List<Widget> list = [];

    for (int i = 0; i < singleProductController.images.length; i++) {
      bool selected = singleProductController.currentPage == i;
      list.add(MyCard(
        onTap: () {
          singleProductController.onPageChanged(i, fromUser: true);
        },
        borderRadiusAll: 4,
        bordered: selected,
        border: selected
            ? Border.all(color: theme.colorScheme.primary, width: 3)
            : null,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Colors.transparent,
        paddingAll: 0,
        margin: MySpacing.x(8),
        child: Image(
          height: 40,
          width: 40,
          image: AssetImage(singleProductController.images[i].url),
          fit: BoxFit.fill,
        ),
      ));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingleProductController>(
        init: singleProductController,
        tag: 'single_product_controller',
        builder: (singleProductController) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (singleProductController.uiLoading) {
      return Scaffold(
        backgroundColor: theme.cardTheme.color,
        body: Container(
            margin: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
            child: LoadingEffect.getSearchLoadingScreen(
              context,
            )),
      );
    } else {
      return Scaffold(
        backgroundColor: theme.cardTheme.color,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: MyText.titleLarge(
            singleProductController.product == null
                ? 'Please Wait for sometime'
                : singleProductController.product!.name,
            fontWeight: 600,
          ),
          backgroundColor: theme.cardTheme.color,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                LucideIcons.chevronLeft,
                size: 20,
                color: theme.colorScheme.onBackground,
              )),
        ),
        body: Column(
          children: [
            MyContainer(
              color: Colors.transparent,
              paddingAll: 0,
              borderRadiusAll: 0,
              clipBehavior: Clip.hardEdge,
              marginAll: 0,
              height: singleProductController.containerType ==
                      ImageResType.landscape
                  ? 200
                  : 350,
              width: MediaQuery.of(context).size.width,
              child: PageView(
                allowImplicitScrolling: true,
                pageSnapping: true,
                physics: ClampingScrollPhysics(),
                controller: singleProductController.pageController,
                onPageChanged: (int page) {
                  singleProductController.onPageChanged(page);
                },
                children:
                    singleProductController.images.map((ProductImage image) {
                  return MyContainer(
                    borderRadiusAll: 8,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Colors.transparent,
                    paddingAll: 0,
                    margin: MySpacing.x(singleProductController.containerType ==
                            ImageResType.landscape
                        ? 0
                        : 8),
                    child: Image(
                      image: AssetImage(image.url),
                      fit: singleProductController.containerType ==
                              ImageResType.landscape
                          ? BoxFit.fill
                          : BoxFit.cover,
                    ),
                  );
                }).toList(),
              ),
            ),
            MySpacing.height(16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _buildThumbnails(),
              ),
            ),
            MySpacing.height(24),
            Expanded(
              child: MyContainer(
                paddingAll: 16,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24),
                    topLeft: Radius.circular(24)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText.titleMedium(
                                singleProductController.product!.name,
                                fontWeight: 600,
                                color: theme.colorScheme.onBackground,
                              ),
                              MySpacing.height(6),
                              Row(
                                children: [
                                  MyStarRating(
                                      rating: singleProductController
                                          .product!.rating,
                                      size: 16,
                                      activeColor: theme.colorScheme.secondary,
                                      inactiveColor: theme
                                          .colorScheme.onBackground
                                          .withAlpha(140),
                                      inactiveStarFilled: false,
                                      showInactive: true),
                                  MySpacing.width(8),
                                  MyText.bodySmall(
                                    "${singleProductController.product!.rating}/5",
                                    xMuted: true,
                                  ),
                                  MySpacing.width(8),
                                  MyText.bodySmall(
                                    "(${singleProductController.product!.ratingCount} Reviews)",
                                    muted: true,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        MyContainer.rounded(
                            paddingAll: 12,
                            color: theme.colorScheme.secondary.withAlpha(40),
                            child: Icon(
                              LucideIcons.heart,
                              size: 16,
                              color: theme.colorScheme.secondary,
                            ))
                      ],
                    ),
                    MySpacing.height(6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText.titleSmall(
                          "\$ ${singleProductController.product!.price}",
                          fontWeight: 600,
                        ),
                        MyText.titleSmall(
                          "Available stock : ${singleProductController.product!.quantity}",
                          fontWeight: 600,
                        ),
                      ],
                    ),
                    MySpacing.height(16),
                    Expanded(
                        child: MyText.bodyMedium(
                      singleProductController.product!.description,
                      color: theme.colorScheme.onBackground,
                    )),
                    MySpacing.height(16),
                    MyButton.block(
                      elevation: 0,
                      borderRadiusAll: 8,
                      onPressed: () {
                        /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EstateFullAppScreen()),
                        );*/
                      },
                      backgroundColor: theme.colorScheme.primary,
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Center(
                                child: MyText.labelLarge(
                                  "Add to Cart",
                                  fontWeight: 700,
                                  color: theme.colorScheme.onPrimary,
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ),
                            VerticalDivider(
                              color: theme.colorScheme.onPrimary.withAlpha(200),
                            ),
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: MyText.labelLarge(
                                  "\$600",
                                  fontWeight: 700,
                                  color: theme.colorScheme.onPrimary,
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
