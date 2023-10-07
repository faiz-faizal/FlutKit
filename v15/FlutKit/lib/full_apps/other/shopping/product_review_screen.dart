import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/my_utils.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_progress_bar.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_star_rating.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ShoppingProductReviewScreen extends StatefulWidget {
  @override
  _ShoppingProductReviewScreenState createState() =>
      _ShoppingProductReviewScreenState();
}

class _ShoppingProductReviewScreenState
    extends State<ShoppingProductReviewScreen> {
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
              Navigator.of(context).pop();
            },
            child: Icon(
              LucideIcons.chevronLeft,
              color: theme.colorScheme.onBackground,
            ),
          ),
          title: MyText.titleMedium("Reviews", fontWeight: 600),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                MyText.headlineMedium("4.0",
                    letterSpacing: 0.5, fontWeight: 700),
                MySpacing.height(8),
                MyStarRating(
                    rating: 4.0,
                    inactiveColor: customTheme.border,
                    size: 24,
                    spacing: 1,
                    inactiveStarFilled: true),
                MySpacing.height(4),
                MyText.bodySmall(
                  "Based on 23 reviews",
                  letterSpacing: 0,
                  muted: true,
                )
              ],
            ),
            Container(
              margin: MySpacing.fromLTRB(24, 16, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MyText.bodySmall(
                        "Excellent",
                        muted: true,
                      ),
                      MyProgressBar(
                          progress: 85,
                          activeColor: Colors.green,
                          inactiveColor: customTheme.border,
                          width: MediaQuery.of(context).size.width - 150,
                          height: 4),
                    ],
                  ),
                  MySpacing.height(4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MyText.bodySmall(
                        "Good",
                        muted: true,
                      ),
                      MyProgressBar(
                          progress: 65,
                          activeColor: Colors.green,
                          inactiveColor: customTheme.border,
                          width: MediaQuery.of(context).size.width - 150,
                          height: 4),
                    ],
                  ),
                  MySpacing.height(4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MyText.bodySmall(
                        "Average",
                        muted: true,
                      ),
                      MyProgressBar(
                          progress: 45,
                          activeColor: Colors.yellow,
                          inactiveColor: customTheme.border,
                          width: MediaQuery.of(context).size.width - 150,
                          height: 4),
                    ],
                  ),
                  MySpacing.height(4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MyText.bodySmall(
                        "Below Average",
                        muted: true,
                      ),
                      MyProgressBar(
                          progress: 12,
                          activeColor: Colors.orange,
                          inactiveColor: customTheme.border,
                          width: MediaQuery.of(context).size.width - 150,
                          height: 4),
                    ],
                  ),
                  MySpacing.height(4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MyText.bodySmall(
                        "Poor",
                        muted: true,
                      ),
                      MyProgressBar(
                          progress: 25,
                          activeColor: Colors.red,
                          inactiveColor: customTheme.border,
                          width: MediaQuery.of(context).size.width - 150,
                          height: 4),
                    ],
                  ),
                ],
              ),
            ),
            MySpacing.height(32),
            Container(
              margin: MySpacing.x(24),
              child: Column(
                children: <Widget>[
                  _singleReview(
                      image: "./assets/images/profile/avatar_4.jpg",
                      name: "Tegan Payne",
                      rating: 5,
                      review: MyTextUtils.getDummyText(32),
                      time: "1 day ago"),
                  MySpacing.height(24),
                  _singleReview(
                      image: "./assets/images/profile/avatar_3.jpg",
                      name: "Jamal Rossi",
                      rating: 4,
                      review: MyTextUtils.getDummyText(25),
                      time: "7 days ago"),
                  MySpacing.height(24),
                  _singleReview(
                      image: "./assets/images/profile/avatar_2.jpg",
                      name: "Harvie Duncan",
                      rating: 4,
                      review: MyTextUtils.getDummyText(30),
                      time: "1 month ago"),
                ],
              ),
            ),
            MySpacing.height(24),
            Center(
              child: MyButton.text(
                onPressed: () {},
                splashColor: theme.colorScheme.primary.withAlpha(40),
                child: MyText.bodyMedium(
                  "Write a Review",
                  color: theme.colorScheme.primary,
                  fontWeight: 600,
                ),
              ),
            )
          ],
        ));
  }

  Widget _singleReview(
      {required String image,
      required String name,
      required double rating,
      required String time,
      required String review}) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            MyContainer.rounded(
                width: 36,
                paddingAll: 0,
                height: 36,
                child: Image(image: AssetImage(image), fit: BoxFit.fill)),
            MySpacing.width(8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyText.bodyMedium(name, fontWeight: 600),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      MyStarRating(
                          rating: rating, showInactive: false, spacing: 0),
                      MySpacing.width(4),
                      MyText.bodyMedium(rating.toString(), fontWeight: 600)
                    ],
                  )
                ],
              ),
            ),
            MyText.bodySmall(
              time,
              muted: true,
              fontWeight: 600,
            )
          ],
        ),
        MySpacing.height(12),
        MyText.bodySmall("- $review"),
      ],
    );
  }
}
