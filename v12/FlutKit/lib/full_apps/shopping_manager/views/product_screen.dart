import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/constant.dart';

import '../controllers/product_controller.dart';
import '../model/product.dart';

class ProductScreen extends StatefulWidget {
  final Product product;

  const ProductScreen(this.product, {Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late ThemeData theme;
  late ProductController controller;
  late OutlineInputBorder outlineInputBorder;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.shoppingManagerTheme;
    controller = FxControllerStore.putOrFind(ProductController(widget.product));
    outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide.none,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<ProductController>(
        controller: controller,
        theme: theme,
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: InkWell(
                onTap: () {
                  controller.goBack();
                },
                child: Icon(
                  FeatherIcons.chevronLeft,
                  size: 20,
                ),
              ),
              title: FxText.titleMedium(
                controller.product.name,
              ),
              actions: [
                InkWell(
                    onTap: () {
                      controller.goBack();
                    },
                    child: Icon(
                      FeatherIcons.check,
                      size: 20,
                    )),
                FxSpacing.width(20)
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: FxSpacing.fromLTRB(20, 4, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        FxContainer.none(
                          width: MediaQuery.of(context).size.width,
                          borderRadiusAll: Constant.containerRadius.small,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image(
                            image: AssetImage(controller.product.image),
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: 8,
                          bottom: 8,
                          child: FxContainer.rounded(
                            paddingAll: 8,
                            onTap: () {},
                            splashColor:
                                theme.colorScheme.onPrimary.withAlpha(40),
                            color: theme.colorScheme.primary,
                            borderRadiusAll: Constant.containerRadius.small,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Icon(
                              FeatherIcons.edit2,
                              size: 16,
                              color: theme.colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    FxSpacing.height(20),
                    FxText.bodySmall(
                      'NAME',
                      fontWeight: 600,
                      muted: true,
                    ),
                    FxSpacing.height(8),
                    nameField(),
                    FxSpacing.height(20),
                    FxText.bodySmall(
                      'DESCRIPTION',
                      fontWeight: 600,
                      muted: true,
                    ),
                    FxSpacing.height(8),
                    descriptionField(),
                    FxSpacing.height(20),
                    FxText.bodySmall(
                      'PRICE',
                      fontWeight: 600,
                      muted: true,
                    ),
                    FxSpacing.height(8),
                    priceField(),
                    FxSpacing.height(20),
                    Row(
                      children: [
                        FxText.bodySmall(
                          'QUANTITY',
                          fontWeight: 600,
                          muted: true,
                        ),
                        FxSpacing.width(20),
                        Expanded(child: quantityField())
                      ],
                    ),
                    FxSpacing.height(20),
                    agreementField(),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget nameField() {
    return TextFormField(
      style: FxTextStyle.bodyMedium(),
      cursorColor: theme.colorScheme.primary,
      decoration: InputDecoration(
        // hintText: "Search by Products",
        hintStyle: FxTextStyle.bodySmall(color: theme.colorScheme.onBackground),
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        fillColor: theme.cardTheme.color,
        isDense: true,
      ),
      controller: controller.nameTE,
      textCapitalization: TextCapitalization.sentences,
    );
  }

  Widget descriptionField() {
    return TextFormField(
      style: FxTextStyle.bodyMedium(),
      cursorColor: theme.colorScheme.primary,
      decoration: InputDecoration(
          // hintText: "Search by Products",
          hintStyle: FxTextStyle.bodySmall(color: theme.colorScheme.onBackground),
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          filled: true,
          fillColor: theme.cardTheme.color,
          isDense: true,
          contentPadding: FxSpacing.xy(8, 8)),
      minLines: 3,
      maxLines: 5,
      controller: controller.descriptionTE,
      textCapitalization: TextCapitalization.sentences,
    );
  }

  Widget priceField() {
    return TextFormField(
      style: FxTextStyle.bodyMedium(),
      cursorColor: theme.colorScheme.primary,
      decoration: InputDecoration(
        hintStyle: FxTextStyle.bodySmall(color: theme.colorScheme.onBackground),
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        fillColor: theme.cardTheme.color,
        isDense: true,
      ),
      controller: controller.priceTE,
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.number,
    );
  }

  Widget quantityField() {
    return Row(
      children: [
        FxContainer(
          paddingAll: 8,
          color: controller.isQuanDecreable()
              ? theme.colorScheme.primaryContainer
              : theme.disabledColor,
          onTap: () {
            controller.decreaseQuan();
          },
          child: Icon(
            FeatherIcons.minus,
            size: 16,
            color: controller.isQuanDecreable()
                ? theme.colorScheme.onPrimaryContainer
                : theme.colorScheme.onBackground,
          ),
        ),
        SizedBox(
            width: 28,
            child: Center(child: FxText.bodyMedium(controller.quantity.toString()))),
        FxContainer(
          onTap: () {
            controller.increaseQuan();
          },
          paddingAll: 8,
          color: theme.colorScheme.primary,
          child: Icon(
            FeatherIcons.plus,
            size: 16,
            color: theme.colorScheme.onPrimary,
          ),
        ),
      ],
    );
  }

  Widget agreementField() {
    return Row(
      children: [
        SizedBox(
          width: 28,
          height: 28,
          child: Checkbox(
            activeColor: theme.colorScheme.primary,
            value: controller.agreementChecked,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onChanged: (bool? value) {
              controller.toggleAgreement();
            },
          ),
        ),
        FxSpacing.width(8),
        Expanded(
            child: FxText.bodySmall(
          'I accept all terms & condition for these item changes',
          maxLines: 2,
        ))
      ],
    );
  }
}
