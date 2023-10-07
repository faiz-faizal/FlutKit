import 'package:flutkit/apps/handyman/handyman_rating_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/generator.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HandymanPastScreen extends StatefulWidget {
  @override
  _HandymanPastScreenState createState() => _HandymanPastScreenState();
}

class _HandymanPastScreenState extends State<HandymanPastScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: MyText.titleLarge("Past Work",
              color: theme.colorScheme.onBackground, fontWeight: 600),
          centerTitle: true,
        ),
        body: ListView(
          padding: MySpacing.zero,
          children: [
            Container(
              margin: MySpacing.fromLTRB(24, 8, 24, 0),
              child: Column(
                children: [
                  pastWork(
                      image: './assets/images/profile/avatar_4.jpg',
                      name: "Sid Moore",
                      profession: "Plumber",
                      bill: 19,
                      rate: 4.5,
                      isRated: true),
                  pastWork(
                    image: './assets/images/profile/avatar_5.jpg',
                    name: "Dainton Mccoy",
                    profession: "Home Painter",
                    bill: 15,
                    rate: 5,
                    isRated: true,
                  ),
                  pastWork(
                    image: './assets/images/profile/avatar.jpg',
                    name: "Dolcie Pineda",
                    profession: "Cleaner",
                    bill: 8,
                    rate: 4,
                    isRated: false,
                  ),
                  pastWork(
                    image: './assets/images/profile/avatar_5.jpg',
                    name: "Eliana Rees",
                    profession: "Cook",
                    bill: 27,
                    rate: 4.2,
                    isRated: false,
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget pastWork(
      {required String image,
      required String name,
      required String profession,
      double? bill,
      double? rate,
      required bool isRated}) {
    return Container(
      margin: MySpacing.bottom(16),
      decoration: BoxDecoration(
          border: Border.all(color: customTheme.border, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      padding: MySpacing.all(16),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HandymanRatingScreen()));
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Image(
                image: AssetImage(image),
                width: 72,
                height: 72,
              ),
            ),
            Expanded(
              child: Container(
                margin: MySpacing.left(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText.bodyMedium(
                          name,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600,
                        ),
                        isRated
                            ? MyText.bodyMedium("Rated",
                                color: customTheme.disabledColor,
                                fontWeight: 600)
                            : MyText.bodyMedium("Rate",
                                color: theme.colorScheme.primary,
                                fontWeight: 600)
                      ],
                    ),
                    MyText.bodySmall(profession,
                        color: theme.colorScheme.onBackground,
                        fontWeight: 600,
                        xMuted: true),
                    Container(
                      margin: MySpacing.top(4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                LucideIcons.star,
                                color: Generator.starColor,
                                size: 18,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              MyText.bodyMedium(rate.toString(),
                                  color: theme.colorScheme.onBackground,
                                  fontWeight: 600)
                            ],
                          ),
                          MyText.bodyMedium("Payed \$$bill",
                              color: theme.colorScheme.onBackground,
                              fontWeight: 500,
                              letterSpacing: 0)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
