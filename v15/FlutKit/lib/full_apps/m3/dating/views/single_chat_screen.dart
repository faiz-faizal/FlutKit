import 'package:flutkit/full_apps/m3/dating/controllers/single_chat_controller.dart';
import 'package:flutkit/full_apps/m3/dating/models/profile.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SingleChatScreen extends StatefulWidget {
  final Profile profile;

  const SingleChatScreen(
    this.profile, {
    Key? key,
  }) : super(key: key);

  @override
  _SingleChatScreenState createState() => _SingleChatScreenState();
}

class _SingleChatScreenState extends State<SingleChatScreen> {
  late ThemeData theme;

  late SingleChatController controller;

  @override
  void initState() {
    super.initState();
    controller = SingleChatController(widget.profile);
    theme = AppTheme.datingTheme;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingleChatController>(
        init: controller,
        tag: 'single_chat_controller',
        builder: (controller) {
          return Theme(
              data: theme.copyWith(
                  colorScheme: theme.colorScheme
                      .copyWith(secondary: theme.colorScheme.primary)),
              child: _buildBody());
        });
  }

  Widget _buildSingleTime(String time) {
    return Align(
        alignment: Alignment.center,
        child: MyText.bodySmall(
          time,
          xMuted: true,
          fontWeight: 600,
          fontSize: 10,
        ));
  }

  Widget _buildSingleMessage(String message,
      AlignmentGeometry alignmentGeometry, Color bgColor, Color textColor) {
    return Align(
      alignment: alignmentGeometry,
      child: MyContainer(
        color: bgColor,
        paddingAll: 12,
        borderRadiusAll: Constant.containerRadius.medium,
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
                        color: theme.colorScheme.primary,
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
                        MyText.bodySmall(
                          '${controller.profile.profession}, ${controller.profile.companyName}',
                          fontSize: 10,
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
                color: theme.cardTheme.color,
              ),
              Expanded(
                child: ListView(
                  padding: MySpacing.all(24),
                  children: [
                    _buildSingleMessage(
                        'Are you free tonight?',
                        Alignment.centerLeft,
                        theme.cardTheme.color!,
                        theme.colorScheme.onBackground),
                    _buildSingleTime('08:35'),
                    _buildSingleMessage(
                        'Yes, should we meet?',
                        Alignment.centerRight,
                        theme.colorScheme.primaryContainer,
                        theme.colorScheme.primary),
                    _buildSingleTime('08:37'),
                    _buildSingleMessage(
                        'For sure, how about this \nbeautiful place?',
                        Alignment.centerLeft,
                        theme.cardTheme.color!,
                        theme.colorScheme.onBackground),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: MyContainer(
                        paddingAll: 0,
                        borderRadiusAll: Constant.containerRadius.medium,
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
                        theme.colorScheme.primaryContainer,
                        theme.colorScheme.primary),
                    _buildSingleTime('08:42'),
                    _buildSingleMessage(
                        'What time should we be there?',
                        Alignment.centerLeft,
                        theme.cardTheme.color!,
                        theme.colorScheme.onBackground),
                    _buildSingleMessage(
                        'Are you free tonight?',
                        Alignment.centerLeft,
                        theme.cardTheme.color!,
                        theme.colorScheme.onBackground),
                    _buildSingleMessage(
                        'Yes, should we meet?',
                        Alignment.centerRight,
                        theme.colorScheme.primaryContainer,
                        theme.colorScheme.primary),
                  ],
                ),
              ),
              MyContainer(
                paddingAll: 0,
                margin: MySpacing.nTop(16),
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        LucideIcons.send,
                        color: theme.colorScheme.primary,
                        size: 20,
                      ),
                      labelText: "Type SomeThing...",
                      labelStyle: MyTextStyle.bodySmall(
                          color: theme.colorScheme.onBackground, muted: true),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      fillColor: theme.cardTheme.color!,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none),
                      contentPadding: MySpacing.all(12)),
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}
