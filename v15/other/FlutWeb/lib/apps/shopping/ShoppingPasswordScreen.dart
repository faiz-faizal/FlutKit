
import 'package:flutkit/style/MyCard.dart';
import 'package:flutkit/style/MyCol.dart';
import 'package:flutkit/style/MyRow.dart';
import 'package:flutkit/style/ScreenMedia.dart';
import 'package:flutkit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppNotifier.dart';
import '../../AppTheme.dart';
import 'ShoppingFullApp.dart';
import 'ShoppingRegisterScreen.dart';

class ShoppingPasswordScreen extends StatefulWidget {
  @override
  _ShoppingPasswordScreenState createState() => _ShoppingPasswordScreenState();
}

class _ShoppingPasswordScreenState extends State<ShoppingPasswordScreen> {
  ThemeData themeData;


  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return buildScreen(
                    ScreenMedia.getScreenMediaType(constraints.maxWidth));
              },
            ));
      },
    );
  }

  Widget buildScreen(ScreenMediaType screenMediaType) {
    return Scaffold(
        body: Container(
          margin: Spacing.x(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyRow(
                wrapAlignment: WrapAlignment.center,
                children: [
                  MyCol(
                    flex: {
                      ScreenMediaType.SM: 16,
                      ScreenMediaType.MD: 12,
                      ScreenMediaType.XL: 10,
                      ScreenMediaType.XXL: 8,
                      ScreenMediaType.XXXL: 6,
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Reset Password",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.headline5,
                              fontWeight: 700),
                        ),
                        Spacing.height(40),

                        Text(
                          "Enter your email address to reset your password",
                          softWrap: true,
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              fontWeight: 500,
                              height: 1.2,
                              color: themeData.colorScheme.onBackground
                                  .withAlpha(200)),
                          textAlign: TextAlign.center,
                        ),
                        Spacing.height(40),

                        MyCard(
                          paddingAll: 0,

                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              TextFormField(
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    fontWeight: 500,
                                    letterSpacing: 0.2),
                                decoration: InputDecoration(
                                  hintStyle: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      fontWeight: 500,
                                      letterSpacing: 0,
                                      color: themeData
                                          .colorScheme.onBackground
                                          .withAlpha(180)),
                                  hintText: "Email Address",
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  isDense: true,
                                  contentPadding: Spacing.all(16),

                                ),
                                autofocus: false,
                                textInputAction: TextInputAction.search,
                                textCapitalization:
                                TextCapitalization.sentences,

                              ),
                            ],
                          ),
                        ),
                        Spacing.height(40),

                        ElevatedButton.icon(
                          icon: Icon(
                            MdiIcons.arrowRight,
                            color: themeData
                                .colorScheme.onPrimary,
                            size: 18,
                          ),
                          label: Text(
                            "RESET PASSWORD",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                color:
                                themeData.colorScheme.onPrimary,
                                letterSpacing: 0.6,
                                fontWeight: 700),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ShoppingFullApp()));
                          },
                          style: ButtonStyle(
                              padding:
                              MaterialStateProperty.all(Spacing.xy(56, 16))),
                        ),
                        Spacing.height(8),

                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ShoppingRegisterScreen()));
                          },
                          child: Text(
                            "I haven't an account",
                            style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }


}
