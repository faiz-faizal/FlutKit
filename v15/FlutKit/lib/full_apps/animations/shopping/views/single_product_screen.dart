import 'package:flutkit/full_apps/animations/shopping/controllers/single_product_controller.dart';
import 'package:flutkit/full_apps/animations/shopping/models/product.dart';
import 'package:flutkit/helpers/extensions/extensions.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SingleProductScreen extends StatefulWidget {
  final Product product;

  const SingleProductScreen(
    this.product, {
    Key? key,
  }) : super(key: key);

  @override
  _SingleProductScreenState createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen>
    with TickerProviderStateMixin {
  late ThemeData theme;

  late SingleProductController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.shoppingTheme;
    controller = SingleProductController(this, widget.product);
  }

  Widget _buildProductList() {
    List<Widget> list = [];

    list.add(MySpacing.width(20));

    for (Product product in controller.products!) {
      if (controller.product == product) continue;
      list.add(MyContainer(
        onTap: () {
          controller.goToSingleProduct(product);
        },
        borderRadiusAll: 8,
        paddingAll: 8,
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyContainer(
              paddingAll: 0,
              borderRadiusAll: 4,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                children: [
                  Image(
                    image: AssetImage(product.image),
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Icon(
                      Icons.favorite_outline,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            MySpacing.height(8),
            MyText.labelLarge(
              product.name,
              fontWeight: 600,
            ),
            MySpacing.height(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText.labelLarge(
                  '\$${product.price}',
                  fontWeight: 700,
                ),
                MyContainer.bordered(
                  paddingAll: 2,
                  borderRadiusAll: 4,
                  child: Icon(
                    LucideIcons.plus,
                    size: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ));
      list.add(MySpacing.width(20));
    }

    return Row(
      children: list,
    );
  }

  Widget _buildSizeWidget() {
    List<Widget> list = [];

    for (String size in controller.sizes) {
      bool selected = size == controller.selectedSize;
      list.add(
        MyContainer.roundBordered(
          paddingAll: 8,
          width: 36,
          height: 36,
          onTap: () {
            controller.selectSize(size);
          },
          border: Border.all(
              color: selected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onBackground),
          color: selected ? theme.colorScheme.primary : null,
          child: Center(
            child: MyText.bodySmall(
              size,
              fontWeight: 600,
              color: selected
                  ? theme.colorScheme.onSecondary
                  : theme.colorScheme.onBackground,
            ),
          ),
        ),
      );

      list.add(MySpacing.width(8));
    }

    return Wrap(
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingleProductController>(
        init: controller,
        tag: 'single_product_controller',
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    /*if (controller.uiLoading) {
      return Scaffold(
          body: Padding(
        padding: MySpacing.top(MySpacing.safeAreaTop(context)),
        child:
            LoadingEffect.getProductLoadingScreen(context, theme, theme.colorScheme),
      ));
    } else {*/
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            controller.goBack();
          },
          child: Icon(
            LucideIcons.chevronLeft,
            size: 20,
            color: theme.colorScheme.onBackground,
          ).autoDirection(),
        ),
        actions: [
          AnimatedBuilder(
            animation: controller.animationController,
            builder: (BuildContext context, _) {
              return InkWell(
                onTap: () {
                  controller.isFav
                      ? controller.animationController.reverse()
                      : controller.animationController.forward();
                },
                child: Icon(
                  Icons.favorite,
                  color: controller.colorAnimation.value,
                  size: controller.sizeAnimation.value,
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: controller.animationController,
            builder: (BuildContext context, _) {
              return MySpacing.width(
                  20 - (controller.sizeAnimation.value! - 24) / 2);
            },
          )
        ],
        title: MyText.titleMedium(
          controller.product.name,
          fontWeight: 600,
        ),
      ),
      body: ListView(
        padding: MySpacing.fromLTRB(0, 4, 0, 20),
        children: [
          Hero(
            tag: "product_image_${controller.product.name}",
            child: MyContainer(
              margin: MySpacing.x(20),
              paddingAll: 0,
              borderRadiusAll: 4,
              height: 250,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(controller.product.image),
              ),
            ),
          ),
          MySpacing.height(20),
          MyContainer(
            margin: MySpacing.x(20),
            paddingAll: 0,
            borderRadiusAll: 0,
            color: theme.scaffoldBackgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Hero(
                        tag: "product_${controller.product.name}",
                        child: MyText.titleMedium(
                          controller.product.name,
                          fontWeight: 700,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Hero(
                        tag:
                            "${controller.product.name}_${controller.product.rating}",
                        child: MyContainer(
                          borderRadiusAll: 4,
                          padding: MySpacing.xy(10, 6),
                          color: theme.colorScheme.primary,
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  LucideIcons.star,
                                  color: theme.colorScheme.onPrimary,
                                  size: 14,
                                ),
                                MySpacing.width(6),
                                MyText.labelLarge(
                                  controller.product.rating.toString(),
                                  fontWeight: 600,
                                  color: theme.colorScheme.onSecondary,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Hero(
                  tag: "${controller.product.name}_${controller.product.price}",
                  child: MyText.titleMedium(
                    '\$${controller.product.price}',
                    fontWeight: 600,
                  ),
                ),
                MySpacing.height(20),
                MyText.bodySmall(
                  controller.product.description.toParagraph(true),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                MySpacing.height(20),
                MyText.bodyMedium(
                  'Size',
                  fontWeight: 600,
                ),
                MySpacing.height(8),
                _buildSizeWidget(),
              ],
            ),
          ),
          MySpacing.height(20),
          Container(
            margin: MySpacing.x(20),
            child: Row(
              children: [
                AnimatedBuilder(
                  animation: controller.cartController,
                  builder: (BuildContext context, _) {
                    return Stack(
                      children: [
                        MyContainer(
                          color: theme.colorScheme.primaryContainer,
                          paddingAll: controller.paddingAnimation.value,
                          child: Icon(
                            LucideIcons.shoppingBag,
                            color: theme.colorScheme.primary,
                            size: controller.cartAnimation.value,
                          ),
                        ),
                        controller.addCart
                            ? Positioned(
                                right: 10,
                                top: 8,
                                child: MyContainer.rounded(
                                  color: theme.colorScheme.primary,
                                  paddingAll: 4,
                                  child: MyText.bodySmall(
                                    "1",
                                    color: theme.colorScheme.onPrimary,
                                    fontSize: 8,
                                    fontWeight: 700,
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    );
                  },
                ),
                MySpacing.width(20),
                Expanded(
                  child: MyButton.block(
                    splashColor: theme.colorScheme.onPrimary.withAlpha(40),
                    backgroundColor: theme.colorScheme.primary,
                    elevation: 0,
                    borderRadiusAll: 4,
                    onPressed: () {
                      controller.addCart
                          ? controller.cartController.reverse()
                          : controller.cartController.forward();
                      controller.goToCheckout();
                    },
                    child: MyText.bodyLarge(
                      'Add to Cart',
                      fontWeight: 600,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          MySpacing.height(20),
          Container(
            padding: MySpacing.x(20),
            child: Row(
              children: [
                MyText.bodyLarge(
                  'Related',
                  letterSpacing: 0,
                  fontWeight: 600,
                ),
              ],
            ),
          ),
          MySpacing.height(20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: _buildProductList(),
          ),
        ],
      ),
    );
    //  }
  }
}
