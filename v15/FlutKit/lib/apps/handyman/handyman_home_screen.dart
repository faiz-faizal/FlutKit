import 'package:flutkit/apps/handyman/select_service_screen.dart';
import 'package:flutkit/apps/handyman/worker_information_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/generator.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HandymanHomeScreen extends StatefulWidget {
  @override
  _HandymanHomeScreenState createState() => _HandymanHomeScreenState();
}

class _HandymanHomeScreenState extends State<HandymanHomeScreen> {
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: theme.colorScheme.primary,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SelectServiceScreen()));
          },
          child: Icon(
            LucideIcons.plus,
            color: theme.colorScheme.onPrimary,
          ),
        ),
        body: ListView(
          padding: MySpacing.top(48),
          children: [
            Container(
              margin: MySpacing.fromLTRB(24, 0, 24, 0),
              alignment: Alignment.centerRight,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Image(
                  image: AssetImage('./assets/images/profile/avatar_1.jpg'),
                  width: 44,
                  height: 44,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: MySpacing.fromLTRB(24, 16, 0, 0),
              child: MyText.titleMedium("Hello",
                  xMuted: true, color: theme.colorScheme.onBackground),
            ),
            Container(
              margin: MySpacing.left(24),
              child: MyText.headlineMedium("Denish",
                  letterSpacing: -0.5,
                  color: theme.colorScheme.onBackground,
                  fontWeight: 700),
            ),
            Container(
              margin: MySpacing.fromLTRB(24, 16, 24, 0),
              child: Column(
                children: [
                  singleWorker(
                      image: './assets/images/profile/avatar.jpg',
                      name: "Dolcie Pineda",
                      profession: "Plumber",
                      perHour: 9.5,
                      rate: 4.5,
                      status: "Pending",
                      statusColor: customTheme.disabledColor),
                  singleWorker(
                      image: './assets/images/profile/avatar_1.jpg',
                      name: "Dainton Mccoy",
                      profession: "Home Painter",
                      perHour: 15,
                      rate: 5,
                      status: "Approved",
                      statusColor: theme.colorScheme.primary),
                  singleWorker(
                      image: './assets/images/profile/avatar_2.jpg',
                      name: "Sid Moore",
                      profession: "Cleaner",
                      perHour: 8,
                      rate: 4,
                      status: "Rejected",
                      statusColor: customTheme.colorError),
                  singleWorker(
                      image: './assets/images/profile/avatar_3.jpg',
                      name: "Eliana Rees",
                      profession: "Cook",
                      perHour: 10,
                      rate: 4.2,
                      status: "In Process",
                      statusColor: customTheme.colorInfo),
                ],
              ),
            ),
          ],
        ));
  }

  Widget singleWorker(
      {required String image,
      required String name,
      required String profession,
      double? perHour,
      double? rate,
      required String status,
      Color? statusColor}) {
    return Container(
      margin: MySpacing.bottom(16),
      decoration: BoxDecoration(
          border: Border.all(color: customTheme.borderDark, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      padding: MySpacing.all(16),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WorkerInformationScreen()));
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
                        MyText.bodyMedium(status,
                            color: statusColor, fontWeight: 600)
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
