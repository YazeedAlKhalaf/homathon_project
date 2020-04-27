import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:homathon_project/src/providers/startup_provider.dart';
import 'package:homathon_project/src/ui/shared/app_colors.dart';
import 'package:homathon_project/src/ui/shared/ui_helpers.dart';

class StartupView extends StatefulWidget {
  @override
  _StartupViewState createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      viewModelBuilder: () => StartupProvider(),
      onModelReady: (StartupProvider provider) async {
        await provider.handleStartUpLogic();
      },
      builder: (
        BuildContext context,
        StartupProvider provider,
        Widget child,
      ) {
        return Directionality(
          textDirection:
              provider.getLocalizationDelegate(context).currentLocale ==
                      Locale('ar')
                  ? TextDirection.rtl
                  : TextDirection.ltr,
          child: Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // TODO(yazeed): add logo here
                  // Image.asset(
                  //   'assets/icon/icon.png',
                  //   width: blockSizeHorizontal(context) * 20,
                  // ),
                  SizedBox(
                    height: blockSizeHorizontal(context) * 5,
                  ),
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(
                      primaryColor,
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
