import 'package:flutkit/full_apps/other/estate/controllers/search_controller.dart';
import 'package:flutkit/full_apps/other/estate/models/house.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_card.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lucide_icons/lucide_icons.dart';

class EstateSearchScreen extends StatefulWidget {
  const EstateSearchScreen({Key? key}) : super(key: key);

  @override
  _EstateSearchScreenState createState() => _EstateSearchScreenState();
}

class _EstateSearchScreenState extends State<EstateSearchScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;
  late EstateSearchController estateSearchController;

  @override
  void initState() {
    super.initState();

    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    estateSearchController = EstateSearchController();
    estateSearchController.addMarkers();
  }

  List<Widget> _buildHouseList() {
    List<Widget> list = [];

    for (House house in estateSearchController.houses!) {
      list.add(_SinglePosition(house));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EstateSearchController>(
        init: estateSearchController,
        tag: 'estate_search_controller',
        builder: (estateSearchController) {
          return Scaffold(
            body: Column(
              children: [
                SizedBox(
                  height: 2,
                  child: estateSearchController.showLoading
                      ? LinearProgressIndicator(
                          color: customTheme.estatePrimary,
                          minHeight: 2,
                        )
                      : Container(
                          height: 0,
                        ),
                ),
                Expanded(
                  child: _buildBody(),
                ),
              ],
            ),
          );
        });
  }

  Widget _buildBody() {
    if (estateSearchController.uiLoading) {
      return Container(
          margin: MySpacing.top(16),
          child: LoadingEffect.getSearchLoadingScreen(
            context,
          ));
    } else {
      return Stack(
        children: [
          GoogleMap(
            markers: estateSearchController.marker,
            onMapCreated: estateSearchController.onMapCreated,
            mapToolbarEnabled: false,
            zoomControlsEnabled: false,
            gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
              Factory<OneSequenceGestureRecognizer>(
                () => EagerGestureRecognizer(),
              ),
            },
            initialCameraPosition: CameraPosition(
              target: estateSearchController.center,
              zoom: 7.0,
            ),
          ),
          Positioned(
            top: MySpacing.safeAreaTop(context) + 20,
            left: 24,
            right: 24,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      focusColor: customTheme.estatePrimary,
                      labelText: 'Search Location',
                      labelStyle: MyTextStyle.bodySmall(
                          color: customTheme.estatePrimary, xMuted: true),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      fillColor: customTheme.border,
                      prefixIcon: Icon(
                        LucideIcons.mapPin,
                        color: customTheme.estatePrimary,
                        size: 20,
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: MySpacing.all(8),
                    ),
                    cursorColor: customTheme.estatePrimary,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            child: Container(
              height: 100,
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              child: PageView(
                pageSnapping: true,
                physics: ClampingScrollPhysics(),
                controller: estateSearchController.pageController,
                onPageChanged: estateSearchController.onPageChange,
                children: _buildHouseList(),
              ),
            ),
          ),
        ],
      );
    }
  }
}

class _SinglePosition extends StatelessWidget {
  final House house;

  const _SinglePosition(this.house);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return MyCard(
      color: themeData.colorScheme.background,
      borderRadiusAll: 8,
      padding: EdgeInsets.only(top: 16, bottom: 16, left: 16),
      margin: EdgeInsets.only(bottom: 8, left: 8, right: 8),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image(
              image: AssetImage(house.image),
              fit: BoxFit.cover,
              width: 72,
              height: 72,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyText.bodyLarge(house.name,
                      fontWeight: 600, overflow: TextOverflow.ellipsis),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          LucideIcons.mapPin,
                          color: themeData.colorScheme.onBackground,
                          size: 14,
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.only(left: 2),
                              child: MyText.bodySmall(house.location,
                                  fontWeight: 400)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
