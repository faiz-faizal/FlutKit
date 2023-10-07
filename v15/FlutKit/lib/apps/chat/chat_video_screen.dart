import 'dart:async';

import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/generator.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ChatVideoScreen extends StatefulWidget {
  @override
  _ChatVideoScreenState createState() => _ChatVideoScreenState();
}

class _ChatVideoScreenState extends State<ChatVideoScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;
  late Timer _timer;
  int _nowTime = 0;
  String timeText = "00 : 00";

  bool isAudioOn = false, isVideoOn = true;

  @override
  void initState() {
    super.initState();
    startTimer();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
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
        body: Stack(
      children: <Widget>[
        Image(
          image: AssetImage('./assets/images/apps/chat/video-bg-1.jpg'),
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
          top: 48,
          left: 24,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: MySpacing.all(8),
              decoration: BoxDecoration(
                  color: customTheme.card.withAlpha(120),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  border: Border.all(width: 1, color: customTheme.card)),
              child: Icon(
                LucideIcons.chevronLeft,
                color: theme.colorScheme.onBackground,
              ),
            ),
          ),
        ),
        Positioned(
          top: 48,
          right: 24,
          child: secondCall(),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            margin: MySpacing.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                timeWidget(),
                bottomWidget(),
              ],
            ),
          ),
        )
      ],
    ));
  }

  Widget secondCall() {
    return Container(
      decoration: BoxDecoration(
          color: customTheme.card.withAlpha(130),
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
          border: Border.all(color: Colors.transparent, width: 3)),
      child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
          child: Stack(
            children: <Widget>[
              Image(
                image: AssetImage(
                  './assets/images/apps/chat/video-bg-2.jpg',
                ),
                width: MediaQuery.of(context).size.width * 0.33,
                height: MediaQuery.of(context).size.width * 0.5,
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Icon(
                  LucideIcons.arrowUpRight,
                  size: 20,
                  color: theme.colorScheme.primary,
                ),
              )
            ],
          )),
    );
  }

  Widget bottomWidget() {
    return Center(
      child: Container(
        padding: MySpacing.all(12),
        decoration: BoxDecoration(
          color: customTheme.card.withAlpha(236),
          borderRadius: BorderRadius.all(Radius.circular(64)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: MySpacing.bottom(8),
              padding: MySpacing.all(10),
              decoration: BoxDecoration(
                  color: customTheme.card,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: customTheme.shadowColor,
                        blurRadius: 6,
                        spreadRadius: 1,
                        offset: Offset(0, 2))
                  ]),
              child: InkWell(
                onTap: () {
                  setState(() {
                    isAudioOn = !isAudioOn;
                  });
                },
                child: Icon(
                  isAudioOn ? LucideIcons.mic : LucideIcons.micOff,
                  size: 26,
                  color: theme.colorScheme.onBackground,
                ),
              ),
            ),
            Container(
              padding: MySpacing.all(10),
              margin: MySpacing.vertical(8),
              decoration: BoxDecoration(
                  color: customTheme.card,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: customTheme.shadowColor,
                        blurRadius: 6,
                        spreadRadius: 1,
                        offset: Offset(0, 2))
                  ]),
              child: InkWell(
                onTap: () {
                  setState(() {
                    isVideoOn = !isVideoOn;
                  });
                },
                child: Icon(
                  isVideoOn ? LucideIcons.video : LucideIcons.videoOff,
                  color: theme.colorScheme.onBackground,
                  size: 26,
                ),
              ),
            ),
            Container(
              padding: MySpacing.all(10),
              margin: MySpacing.top(8),
              decoration: BoxDecoration(
                  color: customTheme.colorError,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: customTheme.colorError.withAlpha(100),
                        blurRadius: 6,
                        spreadRadius: 1,
                        offset: Offset(0, 2))
                  ]),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  LucideIcons.phoneCall,
                  color: customTheme.onError,
                  size: 26,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget timeWidget() {
    return Container(
      padding: MySpacing.fromLTRB(16, 12, 16, 12),
      decoration: BoxDecoration(
          color: Colors.black.withAlpha(70),
          borderRadius: BorderRadius.all(Radius.circular(32))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
                color: customTheme.colorError, shape: BoxShape.circle),
          ),
          Container(
            margin: MySpacing.left(12),
            child: MyText.bodyMedium(timeText,
                color: Colors.white, letterSpacing: 0.4, fontWeight: 600),
          ),
        ],
      ),
    );
  }
}
