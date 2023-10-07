import 'package:flutkit/full_apps/other/dating/controllers/single_chat_controller.dart';
import 'package:flutkit/full_apps/other/dating/models/profile.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class DatingSingleChatScreen extends StatefulWidget {
  final Profile profile;

  const DatingSingleChatScreen(
    this.profile, {
    Key? key,
  }) : super(key: key);

  @override
  _DatingSingleChatScreenState createState() => _DatingSingleChatScreenState();
}

class _DatingSingleChatScreenState extends State<DatingSingleChatScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late DatingSingleChatController controller;

  @override
  void initState() {
    super.initState();
    controller = DatingSingleChatController(widget.profile);
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DatingSingleChatController>(
        init: controller,
        tag: 'dating_single_chat_controller',
        builder: (controller) {
          return Theme(
              data: theme.copyWith(
                  colorScheme: theme.colorScheme
                      .copyWith(secondary: customTheme.datingPrimary)),
              child: _buildBody());
        });
  }

  Widget _buildSingleTime(String time) {
    return Align(
        alignment: Alignment.center,
        child: MyText.labelSmall(
          time,
          xMuted: true,
          fontWeight: 600,
        ));
  }

  Widget _buildSingleMessage(String message,
      AlignmentGeometry alignmentGeometry, Color bgColor, Color textColor) {
    return Align(
      alignment: alignmentGeometry,
      child: MyContainer(
        color: bgColor,
        paddingAll: 12,
        borderRadiusAll: 8,
        margin: MySpacing.y(8),
        child: MyText.bodySmall(
          message,
          color: textColor,
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
          body: Container(
              margin: MySpacing.top(24),
              child: LoadingEffect.getProductLoadingScreen(
                context,
              )));
    } else {
      return Scaffold(
        body: Padding(
          padding: MySpacing.top(MySpacing.safeAreaTop(context) + 16),
          child: Column(
            children: [
              Padding(
                padding: MySpacing.x(20),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.goBack();
                      },
                      child: Icon(
                        LucideIcons.chevronLeft,
                        size: 20,
                        color: customTheme.datingPrimary,
                      ),
                    ),
                    MySpacing.width(12),
                    MyContainer.rounded(
                      paddingAll: 0,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image(
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                        image: AssetImage(controller.profile.image),
                      ),
                    ),
                    MySpacing.width(12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText.bodySmall(
                          '${controller.profile.name}, ${controller.profile.age}',
                          fontWeight: 600,
                        ),
                        MySpacing.height(4),
                        MyText.labelSmall(
                          '${controller.profile.profession}, ${controller.profile.companyName}',
                          xMuted: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(8),
              Divider(
                thickness: 1.2,
                color: customTheme.card,
              ),
              Expanded(
                child: ListView(
                  padding: MySpacing.all(24),
                  children: [
                    _buildSingleMessage(
                        'Are you free tonight?',
                        Alignment.centerLeft,
                        customTheme.card,
                        theme.colorScheme.onBackground),
                    _buildSingleTime('08:35'),
                    _buildSingleMessage(
                        'Yes, should we meet?',
                        Alignment.centerRight,
                        customTheme.datingPrimary.withAlpha(40),
                        customTheme.datingPrimary),
                    _buildSingleTime('08:37'),
                    _buildSingleMessage(
                        'For sure, how about this \nbeautiful place?',
                        Alignment.centerLeft,
                        customTheme.card,
                        theme.colorScheme.onBackground),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: MyContainer(
                        paddingAll: 0,
                        borderRadiusAll: 16,
                        margin: MySpacing.y(8),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image(
                          height: 120,
                          width: 250,
                          fit: BoxFit.cover,
                          image: AssetImage(
                              'assets/images/apps/dating/location.png'),
                        ),
                      ),
                    ),
                    _buildSingleMessage(
                        'Perfect!!',
                        Alignment.centerRight,
                        customTheme.datingPrimary.withAlpha(40),
                        customTheme.datingPrimary),
                    _buildSingleTime('08:42'),
                    _buildSingleMessage(
                        'What time should we be there?',
                        Alignment.centerLeft,
                        customTheme.card,
                        theme.colorScheme.onBackground),
                    _buildSingleMessage(
                        'Are you free tonight?',
                        Alignment.centerLeft,
                        customTheme.card,
                        theme.colorScheme.onBackground),
                    _buildSingleMessage(
                        'Yes, should we meet?',
                        Alignment.centerRight,
                        customTheme.datingPrimary.withAlpha(40),
                        customTheme.datingPrimary),
                  ],
                ),
              ),
              MyContainer(
                paddingAll: 0,
                margin: MySpacing.nTop(16),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Type Something ...',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelStyle: MyTextStyle.bodySmall(
                        color: theme.colorScheme.onBackground, muted: true),
                    focusColor: customTheme.datingPrimary,
                    filled: true,
                    fillColor: customTheme.card,
                    contentPadding: MySpacing.all(12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        style: BorderStyle.none,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        style: BorderStyle.none,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        style: BorderStyle.none,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        style: BorderStyle.none,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        style: BorderStyle.none,
                      ),
                    ),
                    suffixIcon: Icon(
                      LucideIcons.send,
                      color: customTheme.datingPrimary,
                      size: 20,
                    ),
                  ),
                  cursorColor: customTheme.datingPrimary,
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}
