/*
* File : Shopping Delivery
* Version : 1.0.0
* */


import 'package:flutkit/apps/shopping/ShoppingCheckoutScreen.dart';
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

class ShoppingDeliveryAddressScreen extends StatefulWidget {
  @override
  _ShoppingDeliveryAddressScreenState createState() =>
      _ShoppingDeliveryAddressScreenState();
}

class _ShoppingDeliveryAddressScreenState
    extends State<ShoppingDeliveryAddressScreen> {

  ThemeData themeData;
  CustomAppTheme customAppTheme;
  int themeType;


  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget child) {
        themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return buildScreen(
                  ScreenMedia.getScreenMediaType(constraints.maxWidth));
            },
          ),
        );
      },
    );
  }

  Widget buildScreen(ScreenMediaType screenMediaType) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: customAppTheme.bgLayer1,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              MdiIcons.chevronLeft,
              color: themeData.colorScheme.onBackground,
            ),
          ),
          centerTitle: true,
          title: Text("Delivery Address",
              style: AppTheme.getTextStyle(
                  themeData.textTheme.subtitle1,
                  fontWeight: 600)),
        ),
        backgroundColor: customAppTheme.bgLayer1,
        body: ListView(
          padding: Spacing.fromLTRB(8,24,8,24),
          children: <Widget>[
            MyRow(
              wrapCrossAlignment: WrapCrossAlignment.start,
              defaultFlex: {
                ScreenMediaType.MD: 12,
              },
              children: [
               MyCol(
                 child: MyCard(
                   paddingAll: 0,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       TextFormField(
                         style: AppTheme.getTextStyle(
                             themeData.textTheme.subtitle2,
                             fontWeight: 500,
                             letterSpacing: 0.2),
                         decoration: InputDecoration(
                           hintStyle: AppTheme.getTextStyle(
                               themeData.textTheme.subtitle2,
                               fontWeight: 500,
                               letterSpacing: 0,
                               color: themeData.colorScheme.onBackground
                                   .withAlpha(180)),
                           hintText: "Address 1",
                           border: OutlineInputBorder(
                               borderRadius: BorderRadius.all(
                                 Radius.circular(8.0),
                               ),
                               borderSide: BorderSide.none),
                           enabledBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.all(
                                 Radius.circular(8.0),
                               ),
                               borderSide: BorderSide.none),
                           focusedBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.all(
                                 Radius.circular(8.0),
                               ),
                               borderSide: BorderSide.none),
                           prefixIcon:
                           Icon(MdiIcons.mapMarkerOutline, size: 24),
                         ),
                         textCapitalization: TextCapitalization.sentences,
                       ),
                       Divider(
                         height: 0,
                       ),
                       TextFormField(
                         style: AppTheme.getTextStyle(
                             themeData.textTheme.subtitle2,
                             fontWeight: 500,
                             letterSpacing: 0.2),
                         decoration: InputDecoration(
                           hintStyle: AppTheme.getTextStyle(
                               themeData.textTheme.subtitle2,
                               fontWeight: 500,
                               letterSpacing: 0,
                               color: themeData.colorScheme.onBackground
                                   .withAlpha(180)),
                           hintText: "Address 2",
                           border: OutlineInputBorder(
                               borderRadius: BorderRadius.all(
                                 Radius.circular(8.0),
                               ),
                               borderSide: BorderSide.none),
                           enabledBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.all(
                                 Radius.circular(8.0),
                               ),
                               borderSide: BorderSide.none),
                           focusedBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.all(
                                 Radius.circular(8.0),
                               ),
                               borderSide: BorderSide.none),
                           prefixIcon: Icon(
                             MdiIcons.mapMarkerPlusOutline,
                             size: 24,
                           ),
                         ),
                         textCapitalization: TextCapitalization.sentences,
                       ),
                       Divider(
                         height: 0,
                       ),
                       Row(
                         children: <Widget>[
                           Expanded(
                             flex: 1,
                             child: TextFormField(
                               style: AppTheme.getTextStyle(
                                   themeData.textTheme.subtitle2,
                                   fontWeight: 500,
                                   letterSpacing: 0.2),
                               decoration: InputDecoration(
                                 hintStyle: AppTheme.getTextStyle(
                                     themeData.textTheme.subtitle2,
                                     fontWeight: 500,
                                     letterSpacing: 0,
                                     color: themeData
                                         .colorScheme.onBackground
                                         .withAlpha(180)),
                                 hintText: "City",
                                 border: OutlineInputBorder(
                                     borderRadius: BorderRadius.all(
                                       Radius.circular(8.0),
                                     ),
                                     borderSide: BorderSide.none),
                                 enabledBorder: OutlineInputBorder(
                                     borderRadius: BorderRadius.all(
                                       Radius.circular(8.0),
                                     ),
                                     borderSide: BorderSide.none),
                                 focusedBorder: OutlineInputBorder(
                                     borderRadius: BorderRadius.all(
                                       Radius.circular(8.0),
                                     ),
                                     borderSide: BorderSide.none),
                                 prefixIcon: Icon(
                                   MdiIcons.homeCityOutline,
                                   size: 24,
                                 ),
                               ),
                               textCapitalization:
                               TextCapitalization.sentences,
                             ),
                           ),
                           Expanded(
                             flex: 1,
                             child: Padding(
                               padding: EdgeInsets.only(left: 8),
                               child: TextFormField(
                                 style: AppTheme.getTextStyle(
                                     themeData.textTheme.subtitle2,
                                     fontWeight: 500,
                                     letterSpacing: 0.2),
                                 decoration: InputDecoration(
                                   hintStyle: AppTheme.getTextStyle(
                                       themeData.textTheme.subtitle2,
                                       fontWeight: 500,
                                       letterSpacing: 0,
                                       color: themeData
                                           .colorScheme.onBackground
                                           .withAlpha(180)),
                                   hintText: "PIN",
                                   border: OutlineInputBorder(
                                       borderRadius: BorderRadius.all(
                                         Radius.circular(8.0),
                                       ),
                                       borderSide: BorderSide.none),
                                   enabledBorder: OutlineInputBorder(
                                       borderRadius: BorderRadius.all(
                                         Radius.circular(8.0),
                                       ),
                                       borderSide: BorderSide.none),
                                   focusedBorder: OutlineInputBorder(
                                       borderRadius: BorderRadius.all(
                                         Radius.circular(8.0),
                                       ),
                                       borderSide: BorderSide.none),
                                   prefixIcon: Icon(
                                     MdiIcons.numeric,
                                     size: 24,
                                   ),
                                 ),
                                 textCapitalization:
                                 TextCapitalization.sentences,
                               ),
                             ),
                           ),
                         ],
                       ),
                     ],
                   ),
                 ),
               ),
                MyCol(
                  child: MyCard(
                    paddingAll: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2,
                              fontWeight: 500,
                              letterSpacing: 0.2),
                          decoration: InputDecoration(
                            hintStyle: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                fontWeight: 500,
                                letterSpacing: 0,
                                color: themeData.colorScheme.onBackground
                                    .withAlpha(180)),
                            hintText: "Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            prefixIcon:
                            Icon(MdiIcons.emailOutline, size: 24),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        Divider(
                          height: 0,
                        ),
                        TextFormField(
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2,
                              fontWeight: 500,
                              letterSpacing: 0.2),
                          decoration: InputDecoration(
                            hintStyle: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                fontWeight: 500,
                                letterSpacing: 0,
                                color: themeData.colorScheme.onBackground
                                    .withAlpha(180)),
                            hintText: "Contact",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            prefixIcon: Icon(
                              MdiIcons.phoneOutline,
                              size: 24,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        Divider(
                          height: 0,
                        ),
                        TextFormField(
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2,
                              fontWeight: 500,
                              letterSpacing: 0.2),
                          decoration: InputDecoration(
                            hintStyle: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                fontWeight: 500,
                                letterSpacing: 0,
                                color: themeData.colorScheme.onBackground
                                    .withAlpha(180)),
                            hintText: "Delivery note",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            prefixIcon: Icon(
                              MdiIcons.informationOutline,
                              size: 24,
                            ),
                          ),
                          textCapitalization: TextCapitalization.sentences,
                        ),
                      ],
                    ),
                  ),
                ),
                MyCol(
                  flex: {

                  },
                  child: Center(
                    child: ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(Spacing.xy(60, 16))
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ShoppingCheckoutScreen()));
                        },
                        child: Text("NEXT",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                fontWeight: 600,
                                color: themeData.colorScheme.onPrimary,
                                letterSpacing: 0.5))),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
