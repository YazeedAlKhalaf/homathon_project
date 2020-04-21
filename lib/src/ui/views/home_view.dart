import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:homathon_project/src/providers/home_provider.dart';
import 'package:homathon_project/src/ui/shared/app_colors.dart';
import 'package:homathon_project/src/ui/shared/ui_helpers.dart';
import 'package:homathon_project/src/ui/widgets/busy_overlay.dart';
import 'package:homathon_project/src/ui/widgets/custom_card.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      viewModelBuilder: () => HomeProvider(),
      builder: (
        BuildContext context,
        HomeProvider provider,
        Widget child,
      ) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: backgroundColor,
            elevation: 0.3,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'APP NAME',
                  style: TextStyle(
                    color: textColorBlack,
                    fontSize: blockSizeHorizontal(context) * 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: BusyOverlay(
              show: provider.busy,
              child: Column(
                children: <Widget>[],
              ),
            ),
          ),
        );
      },
    );
  }
}
