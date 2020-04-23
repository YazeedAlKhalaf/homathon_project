import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homathon_project/src/providers/base_provider.dart';

class HistoryProvider extends BaseProvider {
  BuildContext context;

  initialize({
    @required BuildContext contextFromFunc,
  }) {
    context = contextFromFunc;
    notifyListeners();
  }

  GoogleMapController googleMapController;
  String _mapStyle;

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  MarkerId selectedMarker;

  bool showTraffic = false;

  setTraffic(bool value) {
    showTraffic = value;
    notifyListeners();
  }

  onMapCreated(GoogleMapController mapController) async {
    googleMapController = mapController;
    notifyListeners();
    await rootBundle
        .loadString(
      'assets/map_styles/dark_map_style2.txt',
    )
        .then((string) {
      _mapStyle = string;
    });

    await googleMapController.setMapStyle(_mapStyle);

    seedMarkers();
  }

  seedMarkers() {
    for (var i = 0; i < 150; i++) {
      final String markerIdVal = 'marker_id_$i';
      final MarkerId markerId = MarkerId(markerIdVal);

      final Random random = Random();

      final double randomLat = -90 + random.nextDouble() * 90 * 2;
      final double randomLng = -180 + random.nextDouble() * 180 * 2;
      final LatLng latLng = LatLng(
        randomLat,
        randomLng,
      );
      final Marker marker = Marker(
        markerId: markerId,
        position: latLng,
        infoWindow: InfoWindow(
          title: markerIdVal,
          snippet: '$i Cases Found!',
        ),
        onTap: () {
          onMarkerTapped(markerId);
        },
        onDragEnd: (LatLng position) {
          onMarkerDragEnd(
            markerId,
            position,
            context,
          );
        },
      );

      markers[markerId] = marker;
      notifyListeners();
    }
  }

  // void add(BuildContext context, LatLng latLng) {
  //   final int markerCount = markers.length;

  //   if (markerCount == 12) {
  //     Fluttertoast.showToast(msg: 'Reached Maximum Number of Markers');
  //     return;
  //   } else {
  //     final String markerIdVal = 'marker_id_$_markerIdCounter';
  //     _markerIdCounter++;
  //     final MarkerId markerId = MarkerId(markerIdVal);

  //     final Marker marker = Marker(
  //       markerId: markerId,
  //       position: latLng,
  //       infoWindow: InfoWindow(
  //         title: markerIdVal,
  //         snippet: '*',
  //       ),
  //       onTap: () {
  //         onMarkerTapped(markerId);
  //       },
  //       onDragEnd: (LatLng position) {
  //         onMarkerDragEnd(
  //           markerId,
  //           position,
  //           context,
  //         );
  //       },
  //     );

  //     markers[markerId] = marker;
  //     notifyListeners();
  //   }
  // }

  void onMarkerTapped(MarkerId markerId) {
    final Marker tappedMarker = markers[markerId];
    if (tappedMarker != null) {
      if (markers.containsKey(selectedMarker)) {
        final Marker resetOld = markers[selectedMarker]
            .copyWith(iconParam: BitmapDescriptor.defaultMarker);
        markers[selectedMarker] = resetOld;
      }
      selectedMarker = markerId;
      final Marker newMarker = tappedMarker.copyWith(
        iconParam: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueGreen,
        ),
      );
      markers[markerId] = newMarker;
      notifyListeners();
    }
  }

  void onMarkerDragEnd(
      MarkerId markerId, LatLng newPosition, BuildContext context) async {
    final Marker tappedMarker = markers[markerId];
    if (tappedMarker != null) {
      await dialogService.showDialog(
        title: 'Marker Location Changed',
        description: '''
        Old position: ${tappedMarker.position}
        New position: $newPosition
        ''',
      );
    }
  }
}
