import 'package:flutkit/full_apps/other/shopping/single_category_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ShoppingCategoryScreen extends StatefulWidget {
  @override
  _ShoppingCategoryScreenState createState() => _ShoppingCategoryScreenState();
}

class _ShoppingCategoryScreenState extends State<ShoppingCategoryScreen> {
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: MyText.titleMedium("Category", fontWeight: 600),
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
          centerTitle: true,
        ),
        body: ListView(
          padding: MySpacing.fromLTRB(20, 0, 20, 20),
          children: <Widget>[
            singleCategory(
                image: './assets/images/apps/shopping/technology.jpg',
                title: "Technology",
                description: '241 Item'),
            MySpacing.height(16),
            singleCategory(
                image: './assets/images/apps/shopping/lifestyle.jpg',
                title: "Life Style",
                description: '325 Item'),
            MySpacing.height(16),
            singleCategory(
                image: './assets/images/apps/shopping/fashion.jpg',
                title: "Fashion",
                description: '784 Item'),
            MySpacing.height(16),
            singleCategory(
                image: './assets/images/apps/shopping/art.jpg',
                title: "Art",
                description: '124 Item'),
          ],
        ));
  }

  Widget singleCategory(
      {required String image, String? title, String? description}) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ShoppingSingleCategoryScreen()));
        },
        child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.all(Radius.circular(4)),
          child: Stack(
            children: <Widget>[
              Image(
                image: AssetImage(image),
                height: 160,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black.withAlpha(150),
                  padding: MySpacing.xy(16, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MyText.bodyLarge(description.toString(),
                          color: Colors.white,
                          fontWeight: 600,
                          letterSpacing: 0.2),
                      MyText.titleMedium(title.toString(),
                          color: Colors.white,
                          fontWeight: 600,
                          letterSpacing: 0.2)
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
