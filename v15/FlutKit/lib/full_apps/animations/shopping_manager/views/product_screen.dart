import 'package:flutkit/full_apps/animations/shopping_manager/controllers/product_controller.dart';
import 'package:flutkit/full_apps/animations/shopping_manager/model/product.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

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
    controller = ProductController(widget.product);
    outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide.none,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
        init: controller,
        tag: 'product_controller',
        // theme: theme,
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: InkWell(
                onTap: () {
                  controller.goBack();
                },
                child: Icon(
                  LucideIcons.chevronLeft,
                  size: 20,
                ),
              ),
              title: MyText.titleMedium(
                controller.product.name,
              ),
              actions: [
                InkWell(
                    onTap: () {
                      controller.goBack();
                    },
                    child: Icon(
                      LucideIcons.check,
                      size: 20,
                    )),
                MySpacing.width(20)
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: MySpacing.fromLTRB(20, 4, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        MyContainer.none(
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
                          child: MyContainer.rounded(
                            paddingAll: 8,
                            onTap: () {},
                            splashColor:
                                theme.colorScheme.onPrimary.withAlpha(40),
                            color: theme.colorScheme.primary,
                            borderRadiusAll: Constant.containerRadius.small,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Icon(
                              LucideIcons.edit2,
                              size: 16,
                              color: theme.colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    MySpacing.height(20),
                    MyText.bodySmall(
                      'NAME',
                      fontWeight: 600,
                      muted: true,
                    ),
                    MySpacing.height(8),
                    nameField(),
                    MySpacing.height(20),
                    MyText.bodySmall(
                      'DESCRIPTION',
                      fontWeight: 600,
                      muted: true,
                    ),
                    MySpacing.height(8),
                    descriptionField(),
                    MySpacing.height(20),
                    MyText.bodySmall(
                      'PRICE',
                      fontWeight: 600,
                      muted: true,
                    ),
                    MySpacing.height(8),
                    priceField(),
                    MySpacing.height(20),
                    Row(
                      children: [
                        MyText.bodySmall(
                          'QUANTITY',
                          fontWeight: 600,
                          muted: true,
                        ),
                        MySpacing.width(20),
                        Expanded(child: quantityField())
                      ],
                    ),
                    MySpacing.height(20),
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
      style: MyTextStyle.bodyMedium(),
      cursorColor: theme.colorScheme.primary,
      decoration: InputDecoration(
        // hintText: "Search by Products",
        hintStyle: MyTextStyle.bodySmall(color: theme.colorScheme.onBackground),
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
      style: MyTextStyle.bodyMedium(),
      cursorColor: theme.colorScheme.primary,
      decoration: InputDecoration(
          // hintText: "Search by Products",
          hintStyle:
              MyTextStyle.bodySmall(color: theme.colorScheme.onBackground),
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          filled: true,
          fillColor: theme.cardTheme.color,
          isDense: true,
          contentPadding: MySpacing.xy(8, 8)),
      minLines: 3,
      maxLines: 5,
      controller: controller.descriptionTE,
      textCapitalization: TextCapitalization.sentences,
    );
  }

  Widget priceField() {
    return TextFormField(
      style: MyTextStyle.bodyMedium(),
      cursorColor: theme.colorScheme.primary,
      decoration: InputDecoration(
        hintStyle: MyTextStyle.bodySmall(color: theme.colorScheme.onBackground),
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
        MyContainer(
          paddingAll: 8,
          color: controller.isQuanDecreable()
              ? theme.colorScheme.primaryContainer
              : theme.disabledColor,
          onTap: () {
            controller.decreaseQuan();
          },
          child: Icon(
            LucideIcons.minus,
            size: 16,
            color: controller.isQuanDecreable()
                ? theme.colorScheme.onPrimaryContainer
                : theme.colorScheme.onBackground,
          ),
        ),
        SizedBox(
            width: 28,
            child: Center(
                child: MyText.bodyMedium(controller.quantity.toString()))),
        MyContainer(
          onTap: () {
            controller.increaseQuan();
          },
          paddingAll: 8,
          color: theme.colorScheme.primary,
          child: Icon(
            LucideIcons.plus,
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
        MySpacing.width(8),
        Expanded(
            child: MyText.bodySmall(
          'I accept all terms & condition for these item changes',
          maxLines: 2,
        ))
      ],
    );
  }
}
