import 'package:flutkit/full_apps/m3/learning/controllers/edit_profile_controller.dart';
import 'package:flutkit/helpers/extensions/extensions.dart';
import 'package:flutkit/helpers/localizations/language.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_card.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutkit/images.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late ThemeData theme;
  late EditProfileController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.learningTheme;
    controller = EditProfileController();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(
        init: controller,
        tag: 'edit_profile_controller',
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
        body: Padding(
          padding: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
          child: LoadingEffect.getSearchLoadingScreen(context),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: MyText.bodyLarge(
            'Personal Data',
            fontWeight: 600,
          ),
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: InkWell(
            onTap: () {
              controller.goBack();
            },
            child: Icon(
              LucideIcons.chevronLeft,
              size: 20,
            ).autoDirection(),
          ),
        ),
        body: ListView(
          padding: MySpacing.nTop(20),
          children: [
            Center(
              child: MyContainer(
                color: Colors.transparent,
                paddingAll: 0,
                height: 100,
                width: 100,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipRRect(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderRadius: BorderRadius.all(Radius.circular(60)),
                      child: Image(
                        height: 100,
                        width: 100,
                        image: AssetImage(Images.learningProfile),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: Language.autoDirection(null, 0),
                      right: Language.autoDirection(0),
                      child: MyCard(
                        paddingAll: 2,
                        borderRadiusAll: 4,
                        clipBehavior: Clip.none,
                        child: MyContainer(
                          paddingAll: 4,
                          borderRadiusAll: 4,
                          color: theme.colorScheme.primaryContainer,
                          child: Icon(
                            LucideIcons.camera,
                            size: 16,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            MySpacing.height(20),
            MyText.bodyMedium(
              'Your Name',
            ),
            MySpacing.height(8),
            TextField(
              keyboardType: TextInputType.name,
              maxLines: 1,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                filled: true,
                isDense: true,
                hintText: "Name",
                hintStyle: MyTextStyle.bodySmall(
                    color: theme.colorScheme.onBackground, xMuted: true),
                fillColor: theme.colorScheme.primaryContainer,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  borderSide: BorderSide.none,
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  borderSide: BorderSide.none,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  borderSide: BorderSide.none,
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  borderSide: BorderSide.none,
                ),
                contentPadding: MySpacing.xy(12, 12),
              ),
              cursorColor: theme.colorScheme.onBackground,
            ),
            MySpacing.height(20),
            MyText.bodyMedium(
              'Address',
            ),
            MySpacing.height(8),
            TextField(
              keyboardType: TextInputType.streetAddress,
              maxLines: 1,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                filled: true,
                isDense: true,
                hintText: "Address",
                hintStyle: MyTextStyle.bodySmall(
                    color: theme.colorScheme.onBackground, xMuted: true),
                fillColor: theme.colorScheme.primaryContainer,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  borderSide: BorderSide.none,
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  borderSide: BorderSide.none,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  borderSide: BorderSide.none,
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  borderSide: BorderSide.none,
                ),
                contentPadding: MySpacing.xy(12, 12),
              ),
              cursorColor: theme.colorScheme.onBackground,
            ),
            MySpacing.height(20),
            MyText.bodyMedium(
              'Email',
            ),
            MySpacing.height(8),
            TextField(
              keyboardType: TextInputType.emailAddress,
              maxLines: 1,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                filled: true,
                isDense: true,
                hintText: "Email Address",
                hintStyle: MyTextStyle.bodySmall(
                    color: theme.colorScheme.onBackground, xMuted: true),
                fillColor: theme.colorScheme.primaryContainer,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  borderSide: BorderSide.none,
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  borderSide: BorderSide.none,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  borderSide: BorderSide.none,
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  borderSide: BorderSide.none,
                ),
                contentPadding: MySpacing.xy(12, 12),
              ),
              cursorColor: theme.colorScheme.onBackground,
            ),
            MySpacing.height(20),
            MyText.bodyMedium(
              'Mobile Number',
            ),
            MySpacing.height(8),
            TextField(
              maxLines: 1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                filled: true,
                isDense: true,
                hintText: "Number",
                hintStyle: MyTextStyle.bodySmall(
                    color: theme.colorScheme.onBackground, xMuted: true),
                fillColor: theme.colorScheme.primaryContainer,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  borderSide: BorderSide.none,
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  borderSide: BorderSide.none,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  borderSide: BorderSide.none,
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  borderSide: BorderSide.none,
                ),
                contentPadding: MySpacing.xy(12, 12),
              ),
              cursorColor: theme.colorScheme.onBackground,
            ),
            MySpacing.height(20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText.bodyMedium(
                        'Gender',
                      ),
                      MySpacing.height(8),
                      Row(
                        children: [
                          MyContainer.rounded(
                            onTap: () {
                              controller.changeGender(Gender.male);
                            },
                            paddingAll: 12,
                            color: controller.gender == Gender.male
                                ? theme.colorScheme.primary
                                : theme.colorScheme.primaryContainer,
                            child: Icon(
                              Icons.male,
                              color: controller.gender == Gender.male
                                  ? theme.colorScheme.onPrimary
                                  : theme.colorScheme.onBackground
                                      .withAlpha(150),
                            ),
                          ),
                          MySpacing.width(20),
                          MyContainer.rounded(
                            onTap: () {
                              controller.changeGender(Gender.female);
                            },
                            paddingAll: 12,
                            color: controller.gender == Gender.female
                                ? theme.colorScheme.primary
                                : theme.colorScheme.primaryContainer,
                            child: Icon(
                              Icons.female,
                              color: controller.gender == Gender.female
                                  ? theme.colorScheme.onPrimary
                                  : theme.colorScheme.onBackground
                                      .withAlpha(150),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                MySpacing.width(20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText.bodyMedium(
                        'Age',
                      ),
                      MySpacing.height(8),
                      TextField(
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          filled: true,
                          isDense: true,
                          hintText: "Age",
                          hintStyle: MyTextStyle.bodySmall(
                              color: theme.colorScheme.onBackground,
                              xMuted: true),
                          fillColor: theme.colorScheme.primaryContainer,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: MySpacing.xy(12, 12),
                        ),
                        cursorColor: theme.colorScheme.onBackground,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            MySpacing.height(24),
            MyButton.block(
              onPressed: () {
                controller.goBack();
              },
              elevation: 0,
              padding: MySpacing.y(20),
              borderRadiusAll: Constant.buttonRadius.large,
              splashColor: theme.colorScheme.onPrimary.withAlpha(40),
              backgroundColor: theme.colorScheme.primary,
              child: MyText.bodyMedium(
                'Submit',
                fontWeight: 600,
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      );
    }
  }
}
