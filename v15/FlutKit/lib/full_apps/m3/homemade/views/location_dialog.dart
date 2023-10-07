import 'package:flutkit/full_apps/m3/homemade/controllers/location_dialog_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class LocationDialog extends StatefulWidget {
  const LocationDialog({Key? key}) : super(key: key);

  @override
  _LocationDialogState createState() => _LocationDialogState();
}

class _LocationDialogState extends State<LocationDialog> {
  late ThemeData theme;

  late LocationDialogController locationDialogController;

  @override
  void initState() {
    super.initState();
    locationDialogController = LocationDialogController();
    theme = AppTheme.homemadeTheme;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: locationDialogController,
        tag: 'location_dialog_controller',
        builder: (controller) {
          return Dialog(
            insetPadding: MySpacing.x(16),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: Container(
              padding: MySpacing.xy(16, 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyText.bodyLarge(
                    "Choose Location",
                    color: theme.colorScheme.primary,
                    fontWeight: 600,
                    textAlign: TextAlign.center,
                  ),
                  MySpacing.height(24),
                  MyContainer.bordered(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    paddingAll: 0,
                    border: Border.all(color: theme.cardTheme.color!, width: 1),
                    child: Column(
                      children: [
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Expanded(
                                child: MyContainer(
                                  padding: MySpacing.all(20),
                                  child: Row(
                                    children: [
                                      Icon(
                                        LucideIcons.mapPin,
                                        size: 20,
                                        color: theme.colorScheme.primary,
                                      ),
                                      MySpacing.width(16),
                                      MyText.bodyMedium(
                                        "Current",
                                        color: theme.colorScheme.onBackground,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              VerticalDivider(
                                color: theme.cardTheme.color,
                                thickness: 0.9,
                                width: 0,
                              ),
                              MyContainer(
                                borderRadiusAll: 0,
                                color: theme.colorScheme.primary.withAlpha(48),
                                padding: MySpacing.all(20),
                                child: Row(
                                  children: [
                                    Icon(
                                      LucideIcons.home,
                                      size: 20,
                                      color: theme.colorScheme.primary,
                                    ),
                                    MySpacing.width(16),
                                    MyText.bodyMedium(
                                      "Home",
                                      color: theme.colorScheme.primary,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 0,
                          thickness: 0.9,
                          color: theme.cardTheme.color,
                        ),
                        MyContainer(
                          padding: MySpacing.fromLTRB(16, 16, 16, 20),
                          child: Row(
                            children: [
                              Icon(
                                LucideIcons.search,
                                size: 20,
                                color: theme.colorScheme.primary,
                              ),
                              MySpacing.width(16),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                      isDense: true,
                                      hintStyle: MyTextStyle.bodyMedium(),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      hintText: "Search by Location",
                                      contentPadding: MySpacing.zero),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  MySpacing.height(24),
                  MyButton(
                      borderRadiusAll: 4,
                      elevation: 0,
                      onPressed: () {
                        locationDialogController.confirm();
                      },
                      backgroundColor: theme.colorScheme.primary,
                      child: MyText(
                        "Confirm",
                        color: theme.colorScheme.onPrimary,
                      ))
                ],
              ),
            ),
          );
        });
  }
}
