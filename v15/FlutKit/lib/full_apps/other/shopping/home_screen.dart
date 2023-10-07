import 'package:flutkit/full_apps/other/shopping/product_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/generator.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_star_rating.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ShoppingHomeScreen extends StatefulWidget {
  @override
  _ShoppingHomeScreenState createState() => _ShoppingHomeScreenState();
}

class _ShoppingHomeScreenState extends State<ShoppingHomeScreen>
    with SingleTickerProviderStateMixin {
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
    return SafeArea(
      child: Scaffold(
          body: ListView(
        padding: MySpacing.zero,
        children: <Widget>[
          Container(
            padding: MySpacing.nBottom(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MyText.titleMedium("Welcome",
                    letterSpacing: 0, fontWeight: 600),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return NotificationDialog();
                        },
                        fullscreenDialog: true));
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
                        child: MyContainer.rounded(
                          padding: MySpacing.zero,
                          height: 14,
                          width: 14,
                          color: theme.colorScheme.primary,
                          child: Center(
                            child: MyText.labelSmall(
                              "2",
                              color: theme.colorScheme.onPrimary,
                              fontSize: 9,
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
            paddingAll: 16,
            borderRadiusAll: 4,
            margin: MySpacing.nBottom(24),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        MyContainer(
                          padding: MySpacing.xy(12, 8),
                          color: theme.colorScheme.primary.withAlpha(28),
                          borderRadiusAll: 4,
                          child: MyText.bodySmall("Trending",
                              color: theme.colorScheme.primary,
                              letterSpacing: 0.3,
                              fontWeight: 600),
                        ),
                        MyText.labelMedium("Colorful Sandal",
                            fontWeight: 600, letterSpacing: 0),
                        MyText.bodySmall("\$ 49.99",
                            fontWeight: 600, letterSpacing: 0)
                      ],
                    ),
                  ),
                ),
                MyContainer(
                  paddingAll: 0,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  borderRadiusAll: 4,
                  child: Image(
                    image: AssetImage(
                        './assets/images/apps/shopping/product/product-8.jpg'),
                    width: 125,
                    height: 125,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: MySpacing.nBottom(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MyText.bodyLarge("Popular Deals",
                    fontWeight: 600, letterSpacing: 0),
                MyText.bodySmall("View all",
                    color: theme.colorScheme.primary, letterSpacing: 0)
              ],
            ),
          ),
          MySpacing.height(24),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                Container(
                  margin: MySpacing.left(24),
                  child: singleItemWidget(
                      image:
                          './assets/images/apps/shopping/product/product-10.jpg',
                      name: "Pop corn",
                      rate: 45.99),
                ),
                Container(
                  margin: MySpacing.left(24),
                  child: singleItemWidget(
                      image:
                          './assets/images/apps/shopping/product/product-7.jpg',
                      name: "Cosmic bang",
                      rate: 78.99),
                ),
                Container(
                  margin: MySpacing.left(24),
                  child: singleItemWidget(
                      image:
                          './assets/images/apps/shopping/product/product-5.jpg',
                      name: "Sweet Gems",
                      rate: 35.99),
                ),
                Container(
                  margin: MySpacing.left(24),
                  child: singleItemWidget(
                      image:
                          './assets/images/apps/shopping/product/product-2.jpg',
                      name: "Toffees",
                      rate: 28.49),
                ),
                Container(
                  margin: MySpacing.x(24),
                  child: singleItemWidget(
                      image:
                          './assets/images/apps/shopping/product/product-3.jpg',
                      name: "Candies",
                      rate: 15.99),
                ),
              ],
            ),
          ),
          Container(
            margin: MySpacing.nBottom(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MyText.bodyLarge("For you", fontWeight: 600, letterSpacing: 0),
                MyText.bodySmall(
                  "View all",
                  letterSpacing: 0,
                  color: theme.colorScheme.primary,
                ),
              ],
            ),
          ),
          Container(
            margin: MySpacing.nBottom(24),
            child: Column(
              children: <Widget>[
                Container(
                  child: singleForYouWidget(
                    name: "Sweet Gems",
                    image:
                        './assets/images/apps/shopping/product/product-5.jpg',
                    shopName: 'El Primo',
                    star: 4.5,
                    price: 1470,
                  ),
                ),
                Container(
                  child: singleForYouWidget(
                    name: "Lipsticks",
                    image:
                        './assets/images/apps/shopping/product/product-4.jpg',
                    shopName: 'Bee Lipstore',
                    star: 3.8,
                    price: 1486,
                  ),
                ),
                Container(
                  child: singleForYouWidget(
                    name: "Candies",
                    image:
                        './assets/images/apps/shopping/product/product-3.jpg',
                    shopName: 'Bee Lipstore',
                    star: 4,
                    price: 1456,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: MySpacing.nBottom(24),
            child: MyText.titleMedium("Best sellers",
                fontWeight: 600, letterSpacing: 0),
          ),
          Container(
            margin: MySpacing.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                singleSellerWidget(
                    image: './assets/images/profile/avatar_1.jpg',
                    name: 'Liss\'s Shop'),
                singleSellerWidget(
                    image: './assets/images/profile/avatar_2.jpg',
                    name: 'Ekk Shop'),
                singleSellerWidget(
                    image: './assets/images/profile/avatar_3.jpg',
                    name: 'Shop Center'),
                singleSellerWidget(
                    image: './assets/images/profile/avatar_4.jpg',
                    name: 'Sweety')
              ],
            ),
          ),
        ],
      )),
    );
  }

  Widget singleItemWidget(
      {required String image, required String name, double? rate}) {
    String key = Generator.randomString(10);
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ShoppingProductScreen(
                      heroTag: key,
                      image: image,
                    )));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            child: Image.asset(
              image,
              height: 120,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: MySpacing.top(8),
            child: MyText.bodyMedium(name,
                letterSpacing: 0, muted: true, fontWeight: 600),
          ),
          MyText.bodyMedium("\$ $rate"),
        ],
      ),
    );
  }

  Widget singleSellerWidget({required String image, required String name}) {
    return Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          child: Image(
            image: AssetImage(image),
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        MySpacing.height(8),
        MyText.bodySmall(name)
      ],
    );
  }

  Widget singleForYouWidget(
      {required String name,
      required String image,
      required String shopName,
      required double star,
      int? price}) {
    String key = Generator.randomString(10);
    return MyContainer.bordered(
      color: Colors.transparent,
      paddingAll: 16,
      borderRadiusAll: 4,
      margin: MySpacing.bottom(16),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ShoppingProductScreen(
                      heroTag: key,
                      image: image,
                    )));
      },
      child: Row(
        children: <Widget>[
          Hero(
            tag: key,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              child: Image.asset(
                image,
                height: 90,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: MyContainer.none(
              height: 90,
              color: Colors.transparent,
              margin: MySpacing.left(16),
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
                      Container(
                        margin: MySpacing.left(8),
                        child:
                            MyText.bodyMedium(star.toString(), fontWeight: 600),
                      ),
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
                          MyText.bodyMedium(shopName)
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

class NotificationDialog extends StatefulWidget {
  @override
  _NotificationDialogState createState() => _NotificationDialogState();
}

class _NotificationDialogState extends State<NotificationDialog> {
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
        automaticallyImplyLeading: false,
        title: MyText.titleMedium("Notification", fontWeight: 600),
        actions: <Widget>[
          Container(
            margin: MySpacing.right(16),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                LucideIcons.x,
                size: 24,
                color: theme.colorScheme.onBackground,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        padding: MySpacing.all(16),
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              MyText.bodyLarge(
                "Offers",
                fontWeight: 600,
              ),
              MyContainer.rounded(
                margin: MySpacing.left(8),
                width: 18,
                paddingAll: 0,
                height: 18,
                color: theme.colorScheme.primary.withAlpha(40),
                child: Center(
                    child: MyText.labelSmall(
                  "2",
                  fontWeight: 600,
                  color: theme.colorScheme.primary,
                )),
              )
            ],
          ),
          MySpacing.height(24),
          singleNotification(
              image: './assets/images/apps/grocery/product-5.png',
              text: RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "50% OFF ",
                      style: MyTextStyle.labelMedium(
                          color: theme.colorScheme.primary,
                          fontWeight: 600,
                          letterSpacing: 0.2)),
                  TextSpan(
                    text: "in ultraboost all puma ltd shoes",
                    style: MyTextStyle.labelMedium(
                        color: theme.colorScheme.onBackground,
                        fontWeight: 500,
                        letterSpacing: 0.2),
                  )
                ]),
              ),
              time: "9:35 AM"),
          MySpacing.height(24),
          singleNotification(
              image: './assets/images/apps/grocery/product-2.png',
              text: RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "30% OFF ",
                      style: MyTextStyle.labelMedium(
                          color: theme.colorScheme.primary,
                          fontWeight: 600,
                          letterSpacing: 0.2)),
                  TextSpan(
                      text: "in all cake till 31 july",
                      style: MyTextStyle.labelMedium(
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500,
                          letterSpacing: 0.2))
                ]),
              ),
              time: "9:35 AM"),
          MySpacing.height(24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              MyText.bodyLarge(
                "Orders",
                fontWeight: 600,
              ),
              MyContainer.rounded(
                margin: MySpacing.left(8),
                width: 18,
                paddingAll: 0,
                height: 18,
                color: theme.colorScheme.primary.withAlpha(40),
                child: Center(
                    child: MyText.labelSmall(
                  "8",
                  fontWeight: 600,
                  color: theme.colorScheme.primary,
                )),
              )
            ],
          ),
          MySpacing.height(24),
          singleNotification(
              image: './assets/images/apps/grocery/product-3.png',
              text: MyText.labelMedium(
                  "Your cake order has been delivered at Himalaya",
                  color: theme.colorScheme.onBackground,
                  fontWeight: 500,
                  letterSpacing: 0),
              time: "Just Now"),
          MySpacing.height(24),
          singleNotification(
              image: './assets/images/apps/grocery/product-2.png',
              text: MyText.labelMedium(
                  "last order has been cancelled by seller",
                  color: theme.colorScheme.onBackground,
                  fontWeight: 500,
                  letterSpacing: 0),
              time: "14 July"),
          MySpacing.height(24),
          Center(
            child: MyButton.text(
              splashColor: theme.colorScheme.primary.withAlpha(40),
              child: MyText.labelMedium("View all",
                  color: theme.colorScheme.primary,
                  fontWeight: 600,
                  letterSpacing: 0.2),
              onPressed: () {},
            ),
          ),
          MySpacing.height(24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              MyText.bodyLarge(
                "Security",
                fontWeight: 600,
              ),
              MyContainer.rounded(
                margin: MySpacing.left(8),
                width: 18,
                paddingAll: 0,
                height: 18,
                color: theme.colorScheme.primary.withAlpha(40),
                child: Center(
                    child: MyText.labelSmall(
                  "1",
                  fontWeight: 600,
                  color: theme.colorScheme.primary,
                )),
              )
            ],
          ),
          MySpacing.height(24),
          singleNotification(
              image: './assets/images/apps/grocery/profile.png',
              text: MyText.labelMedium("Your account password has been changed",
                  color: theme.colorScheme.onBackground,
                  fontWeight: 500,
                  letterSpacing: 0),
              time: "2 days ago"),
        ],
      ),
    );
  }

  Widget singleNotification(
      {required String image, Widget? text, required String time}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        MyContainer.rounded(
          width: 52,
          height: 52,
          padding: MySpacing.all(10),
          color: theme.colorScheme.primary.withAlpha(40),
          child: Image.asset(image),
        ),
        Expanded(
          child: Container(margin: MySpacing.horizontal(16), child: text),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            MyText.bodySmall(time,
                muted: true, fontWeight: 500, letterSpacing: -0.2),
          ],
        )
      ],
    );
  }
}
