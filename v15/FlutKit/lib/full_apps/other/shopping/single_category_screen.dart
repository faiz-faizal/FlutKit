import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_star_rating.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ShoppingSingleCategoryScreen extends StatefulWidget {
  @override
  _ShoppingSingleCategoryScreenState createState() =>
      _ShoppingSingleCategoryScreenState();
}

class _ShoppingSingleCategoryScreenState
    extends State<ShoppingSingleCategoryScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              LucideIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: MyText.titleMedium("Camera", fontWeight: 600),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              margin: MySpacing.left(24),
              child: MyText.bodyLarge("Top category",
                  fontWeight: 700, letterSpacing: 0),
            ),
            MySpacing.height(16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  MySpacing.width(24),
                  singleType(
                      title: 'Camera\nCompact',
                      image:
                          './assets/images/apps/shopping/camera/camera-1.jpg'),
                  MySpacing.width(16),
                  singleType(
                      title: 'DSLR',
                      image:
                          './assets/images/apps/shopping/camera/camera-2.jpg'),
                  MySpacing.width(16),
                  singleType(
                      title: 'Mirrorless',
                      image:
                          './assets/images/apps/shopping/camera/camera-3.jpg'),
                  MySpacing.width(24),
                ],
              ),
            ),
            Container(
              margin: MySpacing.fromLTRB(24, 16, 0, 0),
              child: MyText.bodyLarge(
                "Sub category",
                fontWeight: 700,
              ),
            ),
            MySpacing.height(16),
            Container(
              margin: MySpacing.x(24),
              child: Wrap(
                runSpacing: 12,
                spacing: 12,
                children: <Widget>[
                  singleSubCategory(subCategory: "Drone"),
                  singleSubCategory(subCategory: "Analog"),
                  singleSubCategory(subCategory: "Digital"),
                  singleSubCategory(subCategory: "Compact"),
                  singleSubCategory(subCategory: "Spy"),
                  singleSubCategory(subCategory: "CCTV"),
                  singleSubCategory(subCategory: "Accessories"),
                ],
              ),
            ),
            Container(
              margin: MySpacing.fromLTRB(24, 16, 0, 0),
              child: MyText.bodyLarge("Related",
                  fontWeight: 700, letterSpacing: 0),
            ),
            Container(
              margin: MySpacing.xy(24, 16),
              child: Column(
                children: <Widget>[
                  singleProduct(
                      name: 'Film Camera',
                      image:
                          './assets/images/apps/shopping/camera/camera-3.jpg',
                      shopName: 'G Camera',
                      star: 4.5,
                      price: 299),
                  MySpacing.height(16),
                  singleProduct(
                      name: 'Bridge Camera',
                      image:
                          './assets/images/apps/shopping/camera/camera-2.jpg',
                      shopName: 'Reliance',
                      star: 4.5,
                      price: 799),
                  MySpacing.height(16),
                  singleProduct(
                      name: 'Instant Camera',
                      image:
                          './assets/images/apps/shopping/camera/camera-1.jpg',
                      shopName: 'Sony',
                      star: 4.5,
                      price: 999),
                ],
              ),
            )
          ],
        ));
  }

  Widget singleType({required String image, required String title}) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          child: Image(
            image: AssetImage(image),
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.width * 0.4,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          child: Center(
            child:
                MyText.bodyMedium(title, color: Colors.white, fontWeight: 700),
          ),
        )
      ],
    );
  }

  Widget singleSubCategory({required String subCategory}) {
    return MyContainer(
      padding: MySpacing.xy(12, 8),
      borderRadiusAll: 16,
      child: MyText.bodyMedium(subCategory, letterSpacing: 0.2),
    );
  }

  Widget singleProduct(
      {required String name,
      required String image,
      required String shopName,
      required double star,
      int? price}) {
    return MyContainer.bordered(
      borderRadiusAll: 4,
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            child: Image.asset(
              image,
              height: 90,
              fit: BoxFit.fill,
            ),
          ),
          MySpacing.width(16),
          Expanded(
            child: SizedBox(
              height: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MyText.titleMedium(
                        name,
                        fontWeight: 600,
                      ),
                      Icon(
                        LucideIcons.heart,
                        color: theme.colorScheme.onBackground.withAlpha(75),
                        size: 22,
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      MyStarRating(
                          rating: star,
                          size: 16,
                          inactiveColor: theme.colorScheme.onBackground),
                      MySpacing.width(4),
                      MyText.bodyLarge(star.toString(), fontWeight: 600),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            LucideIcons.store,
                            color:
                                theme.colorScheme.onBackground.withAlpha(200),
                            size: 20,
                          ),
                          MySpacing.width(4),
                          MyText.bodyMedium(
                            shopName,
                            muted: true,
                          )
                        ],
                      ),
                      MyText.bodyMedium("\$ $price", fontWeight: 700)
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
