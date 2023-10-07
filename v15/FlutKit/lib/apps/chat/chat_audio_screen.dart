import 'dart:async';

import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/generator.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ChatAudioScreen extends StatefulWidget {
  @override
  _ChatAudioScreenState createState() => _ChatAudioScreenState();
}

class _ChatAudioScreenState extends State<ChatAudioScreen> {
  late Timer _timer;
  int _nowTime = 0;
  String timeText = "00 : 00";

  bool isAudioOn = false, isVideoOn = true;
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    startTimer();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          _nowTime = _nowTime + 1;
          timeText = Generator.getTextFromSeconds(time: _nowTime);
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: MySpacing.top(MySpacing.safeAreaTop(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: topWidget(),
          ),
          Expanded(
            child: Container(
              padding: MySpacing.all(24),
              child: Wrap(
                spacing: 24,
                runSpacing: 24,
                children: [
                  singleCall(
                      name: "You",
                      image: './assets/images/profile/avatar_1.jpg',
                      cameraOn: isVideoOn,
                      micOn: isAudioOn),
                  singleCall(
                      name: "Zaine Sumner",
                      image: './assets/images/profile/avatar_2.jpg',
                      micOn: true),
                  singleCall(
                      name: "Kaja Langley",
                      image: './assets/images/profile/avatar_3.jpg',
                      cameraOn: true),
                  singleCall(
                      name: "Clifford Carey",
                      image: './assets/images/profile/avatar_4.jpg',
                      cameraOn: true,
                      micOn: true),
                ],
              ),
            ),
          ),
          Container(
            child: bottomWidget(),
          )
        ],
      ),
    ));
  }

  Widget singleCall(
      {required String name,
      required String image,
      bool micOn = false,
      bool cameraOn = false}) {
    return MyContainer.bordered(
      width: (MediaQuery.of(context).size.width - 74) / 2,
      height: 180,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(34)),
            child: Image(
              image: AssetImage(image),
              height: 68,
              width: 68,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: MySpacing.top(8),
            child: MyText(
              name,
            ),
          ),
          Container(
            margin: MySpacing.top(8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  micOn ? LucideIcons.mic : LucideIcons.micOff,
                  color: micOn
                      ? theme.colorScheme.onBackground
                      : theme.colorScheme.onBackground.withAlpha(180),
                  size: 22,
                ),
                Container(
                  margin: MySpacing.left(8),
                  child: Icon(
                      cameraOn ? LucideIcons.video : LucideIcons.videoOff,
                      color: cameraOn
                          ? theme.colorScheme.onBackground
                          : theme.colorScheme.onBackground.withAlpha(180),
                      size: 22),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget topWidget() {
    return MyContainer(
      height: 60,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(16),
        bottomRight: Radius.circular(16),
      ),
      border: Border.all(width: 1, color: customTheme.border),
      padding: MySpacing.fromLTRB(24, 0, 24, 0),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              LucideIcons.chevronLeft,
              size: 24,
              color: theme.colorScheme.onBackground,
            ),
          ),
          Expanded(
            child: Container(
              margin: MySpacing.left(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyText.titleSmall("Group Call",
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                  MyText.bodySmall(timeText,
                      color: theme.colorScheme.onBackground)
                ],
              ),
            ),
          ),
          Icon(
            LucideIcons.userPlus,
            color: theme.colorScheme.onBackground,
            size: 22,
          )
        ],
      ),
    );
  }

  Widget bottomWidget() {
    return MyContainer(
      height: 68,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyContainer.rounded(
            onTap: () {
              setState(() {
                isAudioOn = !isAudioOn;
              });
            },
            clipBehavior: Clip.antiAliasWithSaveLayer,
            paddingAll: 8,
            color: theme.colorScheme.primary.withAlpha(isAudioOn ? 40 : 0),
            child: Icon(
              isAudioOn ? LucideIcons.mic : LucideIcons.micOff,
              color: isAudioOn
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onBackground.withAlpha(200),
            ),
          ),
          MyContainer.rounded(
            onTap: () {
              setState(() {
                isVideoOn = !isVideoOn;
              });
            },
            paddingAll: 8,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: theme.colorScheme.primary.withAlpha(isVideoOn ? 40 : 0),
            child: Icon(
              isVideoOn ? LucideIcons.video : LucideIcons.videoOff,
              color: isVideoOn
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onBackground.withAlpha(200),
            ),
          ),
          MyContainer.rounded(
            onTap: () {
              Navigator.pop(context);
            },
            paddingAll: 8,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: customTheme.colorError,
            child: Center(
              child: Icon(
                LucideIcons.phoneCall,
                color: customTheme.onError,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
