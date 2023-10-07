import 'package:flutkit/full_apps/animations/shopping_manager/controllers/products_controller.dart';
import 'package:flutkit/full_apps/animations/shopping_manager/model/product.dart';
import 'package:flutkit/helpers/extensions/double_extension.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

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
    controller = ProductsController();
    outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide.none,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(
        init: controller,
        tag: 'products_controller',
        // theme: theme,
        builder: (controller) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                padding: MySpacing.fromLTRB(
                    20, MySpacing.safeAreaTop(context) + 12, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleRow(),
                    MySpacing.height(16),
                    search(),
                    MySpacing.height(16),
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
        MyContainer(
          width: 10,
          height: 24,
          color: theme.colorScheme.primaryContainer,
          borderRadiusAll: 2,
        ),
        MySpacing.width(8),
        MyText.titleMedium(
          "Products",
          fontWeight: 600,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyContainer(
                color: controller.viewType == ProductViewType.list
                    ? theme.colorScheme.primaryContainer
                    : Colors.transparent,
                paddingAll: 8,
                onTap: () {
                  controller.changeProductView(ProductViewType.list);
                },
                child: Icon(
                  LucideIcons.list,
                  size: 18,
                  color: controller.viewType == ProductViewType.list
                      ? theme.colorScheme.onPrimaryContainer
                      : theme.colorScheme.onBackground,
                ),
              ),
              // MySpacing.width(8),
              MyContainer(
                color: controller.viewType == ProductViewType.grid
                    ? theme.colorScheme.primaryContainer
                    : Colors.transparent,
                paddingAll: 8,
                onTap: () {
                  controller.changeProductView(ProductViewType.grid);
                },
                child: Icon(
                  LucideIcons.grid,
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
      style: MyTextStyle.bodyMedium(),
      cursorColor: theme.colorScheme.primary,
      decoration: InputDecoration(
        hintText: "Search by Products",
        hintStyle: MyTextStyle.bodySmall(color: theme.colorScheme.onBackground),
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        fillColor: theme.cardTheme.color,
        prefixIcon: Icon(
          LucideIcons.search,
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
    return MyContainer(
      onTap: () {
        controller.goToProduct(product);
      },
      margin: MySpacing.bottom(16),
      child: Column(
        children: [
          MyContainer.none(
            width: MediaQuery.of(context).size.width,
            borderRadiusAll: Constant.containerRadius.small,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image(
              image: AssetImage(product.image),
              height: 160,
              fit: BoxFit.cover,
            ),
          ),
          MySpacing.height(16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText.bodySmall(
                    product.name,
                    fontWeight: 600,
                  ),
                  MySpacing.height(4),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: Constant.softColors.star,
                        size: 20,
                      ),
                      MySpacing.width(4),
                      MyText.bodyMedium(
                        product.rating.precise,
                        fontWeight: 600,
                      ),
                      MySpacing.width(2),
                      MyText.bodySmall(
                        "(${product.ratingCount})",
                        muted: true,
                        fontWeight: 600,
                      ),
                    ],
                  )
                ],
              )),
              MyContainer(
                paddingAll: 8,
                color: theme.colorScheme.primaryContainer,
                child: MyText.bodySmall(
                  '\$${product.price.precise}',
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
