import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/generator.dart';
import 'package:flutkit/helpers/utils/my_color_utils.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_star_rating.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class GroceryProductReviewScreen extends StatefulWidget {
  @override
  _GroceryProductReviewScreenState createState() =>
      _GroceryProductReviewScreenState();
}

class _GroceryProductReviewScreenState extends State<GroceryProductReviewScreen>
    with SingleTickerProviderStateMixin {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: customTheme.groceryPrimary)),
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                LucideIcons.chevronLeft,
                size: 20,
                color: theme.colorScheme.onBackground,
              ),
            ),
            title: MyText("Reviews", fontWeight: 600),
          ),
          body: ListView(
            padding: MySpacing.fromLTRB(24, 8, 24, 0),
            children: <Widget>[
              _buildRatingWidget(),
              MySpacing.height(24),
              _singleReview(
                  image: "./assets/images/profile/avatar_4.jpg",
                  name: "Tegan Payne",
                  rating: 5,
                  review: Generator.getDummyText(32),
                  time: "1 day ago"),
              _singleReview(
                  image: "./assets/images/profile/avatar_3.jpg",
                  name: "Jamal Rossi",
                  rating: 4,
                  review: Generator.getDummyText(25),
                  time: "7 days ago"),
              _singleReview(
                  image: "./assets/images/profile/avatar_2.jpg",
                  name: "Harvie Duncan",
                  rating: 4,
                  review: Generator.getDummyText(30),
                  time: "1 month ago"),
              // Space.height(8),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: MyText.bodyMedium("Write a Review",
                      letterSpacing: 0,
                      color: customTheme.groceryPrimary,
                      fontWeight: 600),
                ),
              )
            ],
          )),
    );
  }

  Widget _singleReview(
      {required String image,
      required String name,
      required double rating,
      required String time,
      required String review}) {
    return Container(
      margin: MySpacing.bottom(16),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.fill),
                ),
              ),
              Expanded(
                child: Container(
                  margin: MySpacing.left(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MyText.bodyMedium(name, fontWeight: 600),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          MyStarRating(
                              rating: rating,
                              activeColor: customTheme.groceryPrimary,
                              showInactive: false,
                              spacing: 0),
                          MySpacing.width(4),
                          MyText.bodyMedium(rating.toString(), fontWeight: 600)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              MyText.bodySmall(
                time,
                muted: true,
                fontWeight: 600,
              )
            ],
          ),
          MySpacing.height(8),
          MyText.bodySmall(
            "- $review",
          )
        ],
      ),
    );
  }

  Widget _buildRatingWidget() {
    List<int> ratingList = [0, 1, 2, 3, 4, 5];
    List<Widget> list = [];
    int maxRating = 5;
    for (int i = 5; i > 0; i--) {
      int progress = ((ratingList[i] / maxRating) * 100).ceil();
      list.add(Row(
        children: [
          MyText.bodySmall(i.toString(),
              color: theme.colorScheme.onBackground, fontWeight: 600),
          MySpacing.width(4),
          Icon(
            LucideIcons.star,
            color: theme.colorScheme.onBackground,
            size: 10,
          ),
          Expanded(
            child: Container(
              margin: MySpacing.left(8),
              height: 4,
              decoration: BoxDecoration(
                  color: theme.colorScheme.onBackground.withAlpha(60),
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: progress,
                    child: Container(
                      height: 4,
                      decoration: BoxDecoration(
                          color: MyColorUtils.getColorByRating()[i],
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                    ),
                  ),
                  Expanded(
                    flex: 100 - progress,
                    child: Container(),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: MySpacing.left(8),
            child: MyText.bodySmall(ratingList[i].toString(),
                color: theme.colorScheme.onBackground, muted: true),
          )
        ],
      ));
    }

    return MyContainer(
      padding: MySpacing.all(16),
      bordered: true,
      border: Border.all(color: customTheme.border),
      color: customTheme.card,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin: MySpacing.fromLTRB(8, 0, 16, 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: MySpacing.fromLTRB(0, 4, 2, 0),
                          child: MyText.titleSmall("4.6",
                              fontWeight: 600, letterSpacing: 0.25),
                        ),
                        Icon(
                          LucideIcons.star,
                          color: theme.colorScheme.onBackground,
                          size: 16,
                        )
                      ],
                    ),
                    Container(
                      margin: MySpacing.top(4),
                      child: MyText.bodySmall("15 Ratings", muted: true),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: list,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
