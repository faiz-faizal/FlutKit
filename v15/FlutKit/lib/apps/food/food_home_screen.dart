import 'package:flutkit/apps/food/food_notification_dialog_screen.dart';
import 'package:flutkit/apps/food/food_product_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FoodHomeScreen extends StatefulWidget {
  @override
  _FoodHomeScreenState createState() => _FoodHomeScreenState();
}

class _FoodHomeScreenState extends State<FoodHomeScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  double findAspectRatio(double width) {
    //Logic for aspect ratio of grid view
    return (width / 2 - 20) / ((width / 2 - 20) + 50);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        Container(
          margin: MySpacing.x(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MyText.titleMedium("Hey hungry",
                  color: theme.colorScheme.onBackground,
                  letterSpacing: 0,
                  fontWeight: 600),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationDialog()));
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    Icon(
                      LucideIcons.bell,
                      color: theme.colorScheme.onBackground.withAlpha(200),
                    ),
                    Positioned(
                      right: -2,
                      top: -2,
                      child: Container(
                        padding: EdgeInsets.all(0),
                        height: 14,
                        width: 14,
                        decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        child: Center(
                          child: MyText.labelSmall(
                            "2",
                            color: theme.colorScheme.onPrimary,
                            fontSize: 9,
                            fontWeight: 500,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        MyContainer.bordered(
          color: Colors.transparent,
          paddingAll: 16,
          margin: EdgeInsets.only(left: 20, right: 20, top: 16),
          child: Row(
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  height: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: customTheme.card,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        child: MyText.bodySmall("Special",
                            color: theme.colorScheme.onBackground,
                            muted: true,
                            letterSpacing: 0.3,
                            fontWeight: 600),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          MyText.titleSmall("\$ ",
                              color: theme.colorScheme.onBackground,
                              fontWeight: 700,
                              letterSpacing: 0),
                          MyText.bodySmall("59",
                              fontSize: 12,
                              color: theme.colorScheme.onBackground,
                              fontWeight: 600,
                              muted: true,
                              letterSpacing: 0,
                              decoration: TextDecoration.lineThrough),
                          MyText.titleSmall(" 39",
                              color: theme.colorScheme.onBackground,
                              fontWeight: 700,
                              letterSpacing: 0),
                        ],
                      ),
                      MyText.titleSmall("Chinese Nood",
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600,
                          letterSpacing: 0)
                    ],
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                child: Image(
                  image: AssetImage('./assets/images/apps/food/food-9.jpg'),
                  width: 125,
                  height: 125,
                ),
              )
            ],
          ),
        ),
        Container(
          margin: MySpacing.fromLTRB(20, 20, 20, 0),
          child: MyText.bodyLarge("Category", fontWeight: 600),
        ),
        Container(
          margin: MySpacing.top(20),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: singleCategory(
                      image: './assets/images/apps/food/food-5.jpg',
                      title: "Chinese"),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: singleCategory(
                      image: './assets/images/apps/food/food-6.jpg',
                      title: "Italian"),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: singleCategory(
                      image: './assets/images/apps/food/food-7.jpg',
                      title: "American"),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: singleCategory(
                      image: './assets/images/apps/food/food-8.jpg',
                      title: "Punjabi"),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MyText.bodyLarge("Recommended", fontWeight: 600),
              MyText.bodyMedium("View all",
                  color: theme.colorScheme.primary, fontWeight: 500),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 16),
          child: GridView.count(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: 16, left: 20, right: 20),
            crossAxisCount: 2,
            childAspectRatio:
                findAspectRatio(MediaQuery.of(context).size.width),
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            children: <Widget>[
              singleFood(
                  image: './assets/images/apps/food/food-1.jpg',
                  name: 'Salad dish',
                  price: 16.59),
              singleFood(
                  image: './assets/images/apps/food/food-2.jpg',
                  name: 'Food dish',
                  price: 29.99),
              singleFood(
                  image: './assets/images/apps/food/food-3.jpg',
                  name: 'Pan Cake',
                  price: 20.29),
              singleFood(
                  image: './assets/images/apps/food/food-7.jpg',
                  name: 'Salad',
                  price: 14.99),
            ],
          ),
        ),
      ],
    ));
  }

  Widget singleFood(
      {required String image, required String name, double? price}) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FoodProductScreen()));
      },
      child: MyContainer.none(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image(
                image: AssetImage(image),
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 6, left: 8),
              child: MyText.bodyMedium(name, muted: true, fontWeight: 600),
            ),
            Container(
              margin: EdgeInsets.only(top: 2, left: 8),
              child: MyText.bodyMedium("\$$price",
                  fontWeight: 500, letterSpacing: 0),
            )
          ],
        ),
      ),
    );
  }

  Widget singleCategory({required String image, required String title}) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FoodProductScreen()));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        child: Stack(
          children: <Widget>[
            SizedBox(
              width: 140,
              height: 140,
              child: Image(
                image: AssetImage(image),
                width: 140,
                height: 140,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: 140,
              height: 140,
              color: Colors.black.withOpacity(0.5),
            ),
            SizedBox(
              width: 140,
              height: 140,
              child: Center(
                child: MyText.titleMedium(title,
                    fontWeight: 600, color: Colors.white, letterSpacing: 0.3),
              ),
            )
          ],
        ),
      ),
    );
  }
}
