import 'package:flutter/material.dart';
import 'package:homathon_project/src/providers/map_provider.dart';
import 'package:homathon_project/src/ui/shared/ui_helpers.dart';
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
      builder: (
        BuildContext context,
        MapProvider provider,
        Widget child,
      ) {
        return Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: Center(
              child: Text(
                'Map View',
                style: TextStyle(
                  fontSize: blockSizeHorizontal(context) * 7,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
