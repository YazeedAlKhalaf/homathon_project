import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homathon_project/src/providers/map_provider.dart';
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
          appBar: AppBar(),
          body: SafeArea(
            child: Center(
              child: Stack(
                children: <Widget>[
                  GoogleMap(
                    mapType: MapType.normal,
                    trafficEnabled: provider.showTraffic,
                    onMapCreated: provider.onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        40.5,
                        60.7,
                      ),
                    ),
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    // onTap: (latLng) {
                    //   provider.add(context, latLng);
                    // },
                    markers: Set<Marker>.of(provider.markers.values),
                  ),

                  // The Upper Layer
                  Padding(
                    padding: EdgeInsets.all(
                      blockSizeHorizontal(context) * 3,
                    ),
                    child: Column(
                      children: <Widget>[
                        RoundedButton(
                          text: 'Traffic',
                          onPressed: () {
                            if (provider.showTraffic) {
                              provider.setTraffic(false);
                            } else {
                              provider.setTraffic(true);
                            }
                          },
                          fontSize: blockSizeHorizontal(context) * 5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
