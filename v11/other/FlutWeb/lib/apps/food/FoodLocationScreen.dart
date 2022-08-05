
import 'package:flutkit/style/MyCard.dart';
import 'package:flutkit/utils/Generator.dart';
import 'package:flutkit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppNotifier.dart';
import '../../AppTheme.dart';
import 'FoodRestaurantScreen.dart';


class FoodLocationScreen extends StatefulWidget {

  final BuildContext rootContext;

  const FoodLocationScreen({Key key, @required this.rootContext}) : super(key: key);


  @override
  _FoodLocationScreenState createState() => _FoodLocationScreenState();
}

class _FoodLocationScreenState extends State<FoodLocationScreen>
   {
  GoogleMapController mapController;
  ThemeData themeData;
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 0.85);
  int _currentPage = 0;

  final Set<Marker> _marker = {};

  onMarkerTap(int position) {
    setState(() {
      _currentPage = position;
    });

    _pageController.animateToPage(
      _currentPage,
      duration: Duration(milliseconds: 800),
      curve: Curves.ease,
    );
  }

  onPageChange(int position) {
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: _marker.toList()[position].position, zoom: 10.5)));
  }

  @override
  void initState() {
    super.initState();
    _marker.add(
      Marker(
        markerId: MarkerId("id-1"),
        position: LatLng(45.121563, -122.977433),
        onTap: () {
          onMarkerTap(0);
        },
      ),
    );
    _marker.add(
      Marker(
          markerId: MarkerId("id-2"),
          position: LatLng(45.121563, -122.777433),
          onTap: () {
            onMarkerTap(1);
          }),
    );
    _marker.add(
      Marker(
          markerId: MarkerId("id-3"),
          position: LatLng(45.521563, -122.377433),
          onTap: () {
            onMarkerTap(2);
          }),
    );
    _marker.add(
      Marker(
          markerId: MarkerId("id-4"),
          position: LatLng(45.721563, -122.377433),
          onTap: () {
            onMarkerTap(3);
          }),
    );
    _marker.add(
      Marker(
          markerId: MarkerId("id-5"),
          position: LatLng(45.121563, -122.377433),
          onTap: () {
            onMarkerTap(4);
          }),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget child) {
        return Scaffold(
          body: Stack(
            children: <Widget>[
              GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(45.521563, -122.677433),
                  zoom: 7.0,
                ),
                mapToolbarEnabled: false,
                zoomControlsEnabled: false,
                markers: _marker,

              ),
              Positioned(
                bottom: 16,
                child: Container(
                  height: 125,
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,
                  child: PageView(
                    pageSnapping: true,
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: onPageChange,
                    children: <Widget>[
                      _SinglePosition(
                        rate: 4.7,
                        image: './assets/food/food-1.jpg',
                        name: "Chinese restro",
                        place: "London Bridge",
                        rateCount: 205,
                        rootContext: widget.rootContext,
                      ),

                      Container(
                        margin: Spacing.left(16),
                        child: _SinglePosition(
                          rate: 5,
                          image: './assets/food/food-2.jpg',
                          name: "Salad shop",
                          place: "Covent Garden",
                          rateCount: 87,rootContext: widget.rootContext,
                        ),
                      ),
                      Container(
                        margin: Spacing.left(16),
                        child: _SinglePosition(
                          rate: 3.8,
                          image: './assets/food/food-3.jpg',
                          name: "Layered",
                          place: "Oxford Street",
                          rateCount: 27,rootContext: widget.rootContext,
                        ),
                      ),
                      Container(
                        margin: Spacing.left(16),
                        child: _SinglePosition(
                          rate: 4,
                          image: './assets/food/food-4.jpg',
                          name: "Rampsons",
                          place: "Westminster",
                          rateCount: 114,rootContext: widget.rootContext,
                        ),
                      ),
                      Container(
                        margin: Spacing.left(16),
                        child: _SinglePosition(
                          rate: 3,
                          image: './assets/food/food-5.jpg',
                          name: "Bish Dish",
                          place: "East End",
                          rateCount: 478,rootContext: widget.rootContext,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
         );
      },
    );
  }

}

class _SinglePosition extends StatelessWidget {
  final String image, name, place;
  final double rate;
  final int rateCount;
  final BuildContext rootContext;

  const _SinglePosition(
      {Key key,
      @required this.name,
      @required this.place,
      @required this.rate,
      @required this.image,
      @required this.rateCount,
      @required this.rootContext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return MyCard(
      onTap: (){
        Navigator.push(
            rootContext, MaterialPageRoute(builder: (context) => FoodRestaurantScreen()));
      },
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image(
              image: AssetImage(image),
              fit: BoxFit.cover,
              width: 72,
              height: 72,
            ),
          ),
          Expanded(
            child: Container(
              margin: Spacing.x(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        fontWeight: 600),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    margin: Spacing.top(4),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          MdiIcons.mapMarker,
                          color: themeData.colorScheme.onBackground,
                          size: 14,
                        ),
                        Container(
                            margin: Spacing.left(2),
                            child: Text(place,
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    fontWeight: 400))),
                      ],
                    ),
                  ),
                  Container(
                    margin: Spacing.top(4),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Generator.buildRatingStar(
                              rating: rate,
                              inactiveColor:
                                  themeData.colorScheme.onBackground),
                        ),
                        Container(
                          margin: Spacing.left(8),
                          child: Text(
                            "($rateCount)",
                            style: themeData.textTheme.caption.merge(TextStyle(
                                color: themeData.colorScheme.onBackground)),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: Text(
                      "View menu",
                      style: AppTheme.getTextStyle(themeData.textTheme.caption,
                          fontWeight: 500,
                          color: themeData.colorScheme.primary,
                          letterSpacing: 0),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
