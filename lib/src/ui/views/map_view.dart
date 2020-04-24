import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homathon_project/src/providers/map_provider.dart';
import 'package:homathon_project/src/ui/shared/app_colors.dart';
import 'package:homathon_project/src/ui/shared/ui_helpers.dart';
import 'package:homathon_project/src/ui/widgets/rounded_button.dart';
import 'package:provider_architecture/provider_architecture.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      viewModelBuilder: () => MapProvider(),
      onModelReady: (MapProvider provider) {
        provider.initialize(
          contextFromFunc: context,
        );
      },
      builder: (
        BuildContext context,
        MapProvider provider,
        Widget child,
      ) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: GoogleMap(
                      mapType: provider.mapType,
                      trafficEnabled: provider.showTraffic,
                      onMapCreated: provider.onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                          40.5,
                          60.7,
                        ),
                      ),
                      myLocationEnabled: true,
                      myLocationButtonEnabled: false,
                      zoomControlsEnabled: false,
                      zoomGesturesEnabled: true,
                      scrollGesturesEnabled: true,
                      compassEnabled: true,
                      rotateGesturesEnabled: true,
                      tiltGesturesEnabled: true,
                      markers: Set<Marker>.of(provider.markers.values),
                    ),
                  ),

                  // The Upper Layer
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.all(
                        blockSizeHorizontal(context) * 3,
                      ),
                      child: FloatingActionButton(
                        heroTag: 'Layers Button',
                        mini: true,
                        onPressed: () {
                          if (provider.showLayers) {
                            provider.setLayers(false);
                          } else {
                            provider.setLayers(true);
                          }
                        },
                        child: Icon(
                          Icons.layers,
                        ),
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.all(
                        blockSizeHorizontal(context) * 3,
                      ),
                      child: FloatingActionButton(
                        onPressed: provider.currentLocation,
                        child: Icon(
                          Icons.my_location,
                        ),
                      ),
                    ),
                  ),

                  // Layers Bottom Sheet
                  provider.showLayers
                      ? Align(
                          alignment: Alignment.bottomCenter,
                          child: BottomSheet(
                            backgroundColor: backgroundColor,
                            onClosing: () {},
                            builder: (BuildContext context) {
                              return Container(
                                width: screenWidth(context),
                                height: blockSizeHorizontal(context) * 60,
                                child: Padding(
                                  padding: EdgeInsets.all(
                                    blockSizeHorizontal(context) * 3,
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Map Type',
                                            style: TextStyle(
                                              color: lynchColor,
                                              fontSize:
                                                  blockSizeHorizontal(context) *
                                                      5,
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.close,
                                            ),
                                            onPressed: () {
                                              provider.setLayers(false);
                                            },
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          RoundedButton(
                                            text: 'Default',
                                            buttonColor: provider.mapType ==
                                                    MapType.normal
                                                ? dangerColor
                                                : primaryColor,
                                            onPressed: () {
                                              provider
                                                  .setMapType(MapType.normal);
                                            },
                                            fontSize:
                                                blockSizeHorizontal(context) *
                                                    5,
                                          ),
                                          RoundedButton(
                                            text: 'Satellite',
                                            buttonColor: provider.mapType ==
                                                    MapType.satellite
                                                ? dangerColor
                                                : primaryColor,
                                            onPressed: () {
                                              provider.setMapType(
                                                  MapType.satellite);
                                            },
                                            fontSize:
                                                blockSizeHorizontal(context) *
                                                    5,
                                          ),
                                          RoundedButton(
                                            text: 'Terrain',
                                            buttonColor: provider.mapType ==
                                                    MapType.terrain
                                                ? dangerColor
                                                : primaryColor,
                                            onPressed: () {
                                              provider
                                                  .setMapType(MapType.terrain);
                                            },
                                            fontSize:
                                                blockSizeHorizontal(context) *
                                                    5,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Settings',
                                            style: TextStyle(
                                              color: lynchColor,
                                              fontSize:
                                                  blockSizeHorizontal(context) *
                                                      5,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          RoundedButton(
                                            text: 'Traffic',
                                            buttonColor: provider.showTraffic
                                                ? dangerColor
                                                : primaryColor,
                                            onPressed: () {
                                              if (provider.showTraffic) {
                                                provider.setTraffic(false);
                                              } else {
                                                provider.setTraffic(true);
                                              }
                                            },
                                            fontSize:
                                                blockSizeHorizontal(context) *
                                                    5,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
