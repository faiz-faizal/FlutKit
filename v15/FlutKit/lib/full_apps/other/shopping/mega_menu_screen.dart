import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ShoppingMegaMenuScreen extends StatefulWidget {
  @override
  _ShoppingMegaMenuScreenState createState() => _ShoppingMegaMenuScreenState();
}

class _ShoppingMegaMenuScreenState extends State<ShoppingMegaMenuScreen> {
  double findAspectRatio(double width) {
    //Logic for aspect ratio of grid view
    return (width / 2 - 24) / ((width / 2 - 24) - 20);
  }

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
          backgroundColor: theme.scaffoldBackgroundColor,
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              LucideIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: MyText.titleMedium("Mega menu", fontWeight: 600),
        ),
        body: GridView.count(
          padding: MySpacing.nTop(20),
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: findAspectRatio(MediaQuery.of(context).size.width),
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: <Widget>[
            singleItem(
                image: './assets/images/apps/shopping/vector/tshirt.png',
                title: "Top wear",
                listItem: [
                  "Formal shirts",
                  "Casual t-shirts",
                  "Suits & Blazers"
                ]),
            singleItem(
                image: './assets/images/apps/shopping/vector/dress.png',
                title: "Dress",
                listItem: ["Balloon Dress", "Cocktail Dress", "Denim Dress"]),
            singleItem(
                image: './assets/images/apps/shopping/vector/shoes.png',
                title: "Shoes",
                listItem: ["Sports Shoes", "Casual Shoes", "Formal Shoes"]),
            singleItem(
                image: './assets/images/apps/shopping/vector/laptop.png',
                title: "Laptop",
                listItem: ["Ultrabook", "Chromebook", "Macbook"]),
            singleItem(
                image: './assets/images/apps/shopping/vector/headphone.png',
                title: "Headphone",
                listItem: ["On Ear", "Over Ear", "Earbuds"]),
            singleItem(
                image: './assets/images/apps/shopping/vector/mobile.png',
                title: "Mobile",
                listItem: [
                  "Xiaomi",
                  "Samsung",
                  "Apple",
                ]),
            singleItem(
                image: './assets/images/apps/shopping/vector/watch.png',
                title: "Watches",
                listItem: ["Titan", "Fast Track", "Fossil"]),
          ],
        ));
  }

  Widget buildListItem(List<String> listItem) {
    List<Widget> list = [];

    for (int i = 0; i < listItem.length; i++) {
      list.add(Container(
        margin: EdgeInsets.only(bottom: 2),
        child:
            MyText.labelSmall(listItem[i], fontWeight: 500, letterSpacing: 0.2),
      ));
    }

    list.add(MyText.bodySmall("More ...", fontWeight: 500, letterSpacing: 0.2));

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: list,
    );
  }

  Widget singleItem(
      {required String image,
      required String title,
      required List<String> listItem}) {
    return MyContainer.bordered(
      paddingAll: 16,
      borderRadiusAll: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Image(
                image: AssetImage(image),
                height: 24,
                width: 24,
                color: theme.colorScheme.primary,
              ),
              MySpacing.width(8),
              MyText.bodyMedium(
                title,
                fontWeight: 600,
                letterSpacing: 0.2,
                color: theme.colorScheme.primary,
              ),
            ],
          ),
          Container(
              margin: MySpacing.fromLTRB(32, 8, 0, 0),
              child: buildListItem(listItem)),
        ],
      ),
    );
  }
}
