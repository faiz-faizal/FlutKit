import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ShoppingFavouriteScreen extends StatefulWidget {
  const ShoppingFavouriteScreen({Key? key}) : super(key: key);

  @override
  _ShoppingFavouriteScreenState createState() =>
      _ShoppingFavouriteScreenState();
}

class _ShoppingFavouriteScreenState extends State<ShoppingFavouriteScreen>
    with SingleTickerProviderStateMixin {
  ScrollController? _scrollController;
  late AnimationController _hideFabAnimController;
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    _scrollController = ScrollController();
    _hideFabAnimController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
      value: 1, // initially visible
    );

    _scrollController!.addListener(() {
      switch (_scrollController!.position.userScrollDirection) {
        case ScrollDirection.forward:
          _hideFabAnimController.forward();
          break;
        case ScrollDirection.reverse:
          _hideFabAnimController.reverse();
          break;
        case ScrollDirection.idle:
          break;
      }
    });
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    _hideFabAnimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              LucideIcons.chevronLeft,
              size: 20,
              color: theme.colorScheme.onBackground,
            ),
          ),
          title: MyText.titleMedium("Orders", fontWeight: 600),
        ),
        floatingActionButton: FadeTransition(
          opacity: _hideFabAnimController,
          child: ScaleTransition(
            scale: _hideFabAnimController,
            child: FloatingActionButton.extended(
              label: MyText("Create List",
                  color: theme.colorScheme.onPrimary,
                  fontWeight: 600,
                  letterSpacing: 0.8),
              onPressed: () {},
              icon: Icon(
                LucideIcons.plus,
                color: theme.colorScheme.onPrimary,
              ),
              backgroundColor: theme.colorScheme.primary,
              splashColor: Colors.white.withAlpha(100),
            ),
          ),
        ),
        body: ListView(
          padding: MySpacing.nTop(20),
          controller: _scrollController,
          children: <Widget>[
            MyContainer.bordered(
              paddingAll: 16,
              borderRadiusAll: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MyText.titleMedium("List 1",
                          fontWeight: 700, letterSpacing: -0.2, muted: true),
                      MyText.bodySmall(
                        "Remove",
                        letterSpacing: 0,
                        color: theme.colorScheme.primary,
                      )
                    ],
                  ),
                  MySpacing.height(8),
                  Column(
                    children: [
                      singleProduct(
                          name: "Cup Cake",
                          price: 35.79,
                          image:
                              './assets/images/apps/shopping/product/product-1.jpg'),
                      singleProduct(
                          name: "Roll",
                          price: 45.89,
                          image:
                              './assets/images/apps/shopping/product/product-2.jpg'),
                      singleProduct(
                          name: "Biscuit",
                          price: 14.29,
                          image:
                              './assets/images/apps/shopping/product/product-3.jpg')
                    ],
                  ),
                ],
              ),
            ),
            MySpacing.height(20),
            MyContainer.bordered(
              borderRadiusAll: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MyText.titleMedium("List 2",
                          fontWeight: 700, letterSpacing: -0.2, muted: true),
                      MyText.bodySmall(
                        "Remove",
                        color: theme.colorScheme.primary,
                        fontWeight: 500,
                      )
                    ],
                  ),
                  MySpacing.height(8),
                  Column(
                    children: [
                      singleProduct(
                          name: "Unsought",
                          price: 17.89,
                          image:
                              './assets/images/apps/shopping/product/product-5.jpg'),
                      singleProduct(
                          name: "Roll",
                          price: 25.89,
                          image:
                              './assets/images/apps/shopping/product/product-8.jpg'),
                      singleProduct(
                          name: "Biscuit",
                          price: 89.29,
                          image:
                              './assets/images/apps/shopping/product/product-7.jpg'),
                      singleProduct(
                          name: "Toy Car",
                          price: 89.29,
                          image:
                              './assets/images/apps/shopping/product/product-9.jpg'),
                    ],
                  ),
                ],
              ),
            ),
            MySpacing.height(20),
            MyContainer.bordered(
              borderRadiusAll: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MyText.titleMedium("List 3",
                          fontWeight: 700, letterSpacing: -0.2, muted: true),
                      MyText.bodySmall(
                        "Remove",
                        color: theme.colorScheme.primary,
                        fontWeight: 500,
                      )
                    ],
                  ),
                  MySpacing.height(8),
                  Column(
                    children: [
                      singleProduct(
                          name: "Unsought",
                          price: 17.89,
                          image:
                              './assets/images/apps/shopping/product/product-10.jpg'),
                      singleProduct(
                          name: "Roll",
                          price: 25.89,
                          image:
                              './assets/images/apps/shopping/product/product-11.jpg')
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget singleProduct(
      {required String image, required String name, double? price}) {
    List<String> textIconChoice = ["Remove", "Other"];

    return Container(
      margin: MySpacing.y(8),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: Image.asset(
              image,
              height: 52,
              fit: BoxFit.fill,
            ),
          ),
          MySpacing.width(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MyText.titleMedium(name, letterSpacing: -0.3, fontWeight: 600),
                MySpacing.height(4),
                MyText.bodyMedium("\$$price",
                    letterSpacing: -0.3, muted: true, fontWeight: 600),
              ],
            ),
          ),
          PopupMenuButton(
            padding: EdgeInsets.all(0),
            itemBuilder: (BuildContext context) {
              return textIconChoice.map((String choice) {
                return PopupMenuItem(
                  value: choice,
                  child: Row(
                    children: <Widget>[
                      MyText.labelMedium(
                        choice,
                      )
                    ],
                  ),
                );
              }).toList();
            },
            icon: Icon(LucideIcons.moreVertical,
                color: theme.colorScheme.onBackground.withAlpha(220)),
            color: customTheme.card,
          )
        ],
      ),
    );
  }
}
