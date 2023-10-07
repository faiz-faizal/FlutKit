import 'package:flutkit/apps/handyman/book_service_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/generator.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SingleServiceScreen extends StatefulWidget {
  @override
  _SingleServiceScreenState createState() => _SingleServiceScreenState();
}

class _SingleServiceScreenState extends State<SingleServiceScreen> {
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
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              LucideIcons.chevronLeft,
              color: theme.colorScheme.onBackground,
            ),
          ),
          title: MyText.titleLarge("Cleaning",
              color: theme.colorScheme.onBackground, fontWeight: 600),
        ),
        body: ListView(
          padding: MySpacing.fromLTRB(24, 16, 24, 0),
          children: [
            singleWorker(
                image: './assets/images/profile/avatar.jpg',
                name: "Dolcie Pineda",
                profession: "Plumber",
                perHour: 9.5,
                rate: 4.5),
            singleWorker(
                image: './assets/images/profile/avatar_1.jpg',
                name: "Dainton Mccoy",
                profession: "Home Painter",
                perHour: 15,
                rate: 5),
            singleWorker(
                image: './assets/images/profile/avatar_2.jpg',
                name: "Sid Moore",
                profession: "Cleaner",
                perHour: 8,
                rate: 4),
            singleWorker(
                image: './assets/images/profile/avatar_3.jpg',
                name: "Eliana Rees",
                profession: "Cook",
                perHour: 10,
                rate: 4.2),
            singleWorker(
                image: './assets/images/profile/avatar_4.jpg',
                name: "Giles Nunez",
                profession: "Carpenter",
                perHour: 11,
                rate: 4.8),
            Container(
              alignment: Alignment.center,
              child: MyText.bodyLarge("More", color: theme.colorScheme.primary),
            )
          ],
        ));
  }

  Widget singleWorker(
      {required String image,
      required String name,
      required String profession,
      double? perHour,
      double? rate}) {
    return Container(
      margin: MySpacing.bottom(16),
      decoration: BoxDecoration(
          border: Border.all(color: customTheme.border, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      padding: MySpacing.all(16),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => BookServiceScreen()));
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
                    MyText.bodyMedium(
                      name,
                      color: theme.colorScheme.onBackground,
                      fontWeight: 600,
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
                          MyText.bodyMedium("\$$perHour per Hour",
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
