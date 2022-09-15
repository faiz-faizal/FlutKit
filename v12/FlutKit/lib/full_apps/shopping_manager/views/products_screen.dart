import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/extensions/double_extension.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/constant.dart';

import '../controllers/products_controller.dart';
import '../model/product.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late ThemeData theme;
  late ProductsController controller;
  late OutlineInputBorder outlineInputBorder;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.shoppingManagerTheme;
    controller = FxControllerStore.putOrFind(ProductsController());
    outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide.none,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<ProductsController>(
        controller: controller,
        theme: theme,
        builder: (controller) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                padding: FxSpacing.fromLTRB(
                    20, FxSpacing.safeAreaTop(context) + 12, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleRow(),
                    FxSpacing.height(16),
                    search(),
                    FxSpacing.height(16),
                    productsView()
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
          "Products",
          fontWeight: 600,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FxContainer(
                color: controller.viewType == ProductViewType.list
                    ? theme.colorScheme.primaryContainer
                    : Colors.transparent,
                paddingAll: 8,
                onTap: () {
                  controller.changeProductView(ProductViewType.list);
                },
                child: Icon(
                  FeatherIcons.list,
                  size: 18,
                  color: controller.viewType == ProductViewType.list
                      ? theme.colorScheme.onPrimaryContainer
                      : theme.colorScheme.onBackground,
                ),
              ),
              // FxSpacing.width(8),
              FxContainer(
                color: controller.viewType == ProductViewType.grid
                    ? theme.colorScheme.primaryContainer
                    : Colors.transparent,
                paddingAll: 8,
                onTap: () {
                  controller.changeProductView(ProductViewType.grid);
                },
                child: Icon(
                  FeatherIcons.grid,
                  size: 18,
                  color: controller.viewType == ProductViewType.grid
                      ? theme.colorScheme.onPrimaryContainer
                      : theme.colorScheme.onBackground,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget search() {
    return TextFormField(
      style: FxTextStyle.bodyMedium(),
      cursorColor: theme.colorScheme.primary,
      decoration: InputDecoration(
        hintText: "Search by Products",
        hintStyle: FxTextStyle.bodySmall(color: theme.colorScheme.onBackground),
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        fillColor: theme.cardTheme.color,
        prefixIcon: Icon(
          FeatherIcons.search,
          size: 16,
          color: theme.colorScheme.outline,
        ),
        isDense: true,
      ),
      // controller: controller.searchTE,
      textCapitalization: TextCapitalization.sentences,
    );
  }

  Widget productsView() {
    return Column(
      children:
          controller.products.map((product) => productView(product)).toList(),
    );
  }

  Widget productView(Product product) {
    return FxContainer(
      onTap: () {
        controller.goToProduct(product);
      },
      margin: FxSpacing.bottom(16),
      child: Column(
        children: [
          FxContainer.none(
            width: MediaQuery.of(context).size.width,
            borderRadiusAll: Constant.containerRadius.small,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image(
              image: AssetImage(product.image),
              height: 160,
              fit: BoxFit.cover,
            ),
          ),
          FxSpacing.height(16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText.bodySmall(
                    product.name,
                    fontWeight: 600,
                  ),
                  FxSpacing.height(4),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: Constant.softColors.star,
                        size: 20,
                      ),
                      FxSpacing.width(4),
                      FxText.bodyMedium(
                        product.rating.precise,
                        fontWeight: 600,
                      ),
                      FxSpacing.width(2),
                      FxText.bodySmall(
                        "(" + product.ratingCount.toString() + ")",
                        muted: true,
                        fontWeight: 600,
                      ),
                    ],
                  )
                ],
              )),
              FxContainer(
                paddingAll: 8,
                color: theme.colorScheme.primaryContainer,
                child: FxText.bodySmall(
                  '\$' + product.price.precise,
                  color: theme.colorScheme.onPrimaryContainer,
                  fontWeight: 700,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
