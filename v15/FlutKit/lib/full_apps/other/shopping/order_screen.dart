import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ShoppingOrderScreen extends StatefulWidget {
  @override
  _ShoppingOrderScreenState createState() => _ShoppingOrderScreenState();
}

class _ShoppingOrderScreenState extends State<ShoppingOrderScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
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
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              LucideIcons.chevronLeft,
              color: theme.colorScheme.onBackground,
            ),
          ),
          title: MyText.titleMedium("Orders", fontWeight: 600),
        ),
        body: ListView(
          padding: MySpacing.x(20),
          children: [
            singleOrderItem(
                price: 49.49,
                time: "12 April 2020, 1:45",
                listItem: [
                  "./assets/images/apps/shopping/product/product-1.jpg",
                  "./assets/images/apps/shopping/product/product-2.jpg",
                  "./assets/images/apps/shopping/product/product-3.jpg",
                  "./assets/images/apps/shopping/product/product-4.jpg"
                ],
                number: 4568,
                status: "In Progress"),
            singleOrderItem(
                price: 54.99,
                time: "14 Feb 2020, 12:04",
                listItem: [
                  "./assets/images/apps/shopping/product/product-5.jpg",
                  "./assets/images/apps/shopping/product/product-3.jpg"
                ],
                number: 1478,
                status: "Delivered"),
            singleOrderItem(
                price: 69.99,
                time: "16 Dec 2019, 8:48",
                listItem: [
                  "./assets/images/apps/shopping/product/product-9.jpg",
                  "./assets/images/apps/shopping/product/product-7.jpg",
                  "./assets/images/apps/shopping/product/product-10.jpg",
                ],
                number: 1123,
                status: "Delivered"),
          ],
        ));
  }

  Widget singleOrderItem(
      {required List<String> listItem,
      int? number,
      String? time,
      String? status,
      double? price}) {
    //Logic for row items
    double space = 16;
    double width = (MediaQuery.of(context).size.width - 83 - (2 * space)) / 3;

    List<Widget> itemWidget = [];
    for (int i = 0; i < listItem.length; i++) {
      if (i == 2 && listItem.length > 3) {
        itemWidget.add(
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            child: MyContainer.bordered(
              color: customTheme.cardDark,
              height: width,
              width: width,
              child: Center(
                  child: MyText.titleMedium("+${listItem.length - 2}",
                      letterSpacing: 0.5, fontWeight: 600)),
            ),
          ),
        );
        break;
      } else {
        itemWidget.add(
          Container(
            margin: (i == 2) ? EdgeInsets.zero : EdgeInsets.only(right: space),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              child: Image.asset(
                listItem[i],
                height: width,
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      }
    }

    return MyContainer.bordered(
      margin: MySpacing.bottom(16),
      borderRadiusAll: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MyText("Order $number",
                        fontWeight: 700, letterSpacing: -0.2),
                    MySpacing.width(4),
                    MyText.bodyMedium("\$ $price",
                        fontWeight: 600, letterSpacing: 0),
                  ],
                ),
              ),
              MyContainer(
                padding: MySpacing.all(10),
                color: customTheme.card,
                borderRadiusAll: 4,
                child: MyText.bodySmall(status!.toUpperCase(),
                    fontWeight: 700, letterSpacing: 0.2),
              )
            ],
          ),
          MySpacing.height(16),
          MyText.bodyMedium(
            time!,
            fontWeight: 600,
            letterSpacing: -0.2,
            xMuted: true,
          ),
          MySpacing.height(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: itemWidget,
          ),
        ],
      ),
    );
  }
}
