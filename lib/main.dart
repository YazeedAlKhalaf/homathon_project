import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homathon_project/src/managers/dialog_manager.dart';
import 'package:homathon_project/src/locator.dart';
import 'package:homathon_project/src/services/dialog_service.dart';
import 'package:homathon_project/src/services/navigation_service.dart';
import 'package:homathon_project/src/ui/router.dart';
import 'package:homathon_project/src/ui/shared/app_colors.dart';
import 'package:homathon_project/src/ui/views/startup_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kollona Masoal',
      builder: (
        BuildContext context,
        Widget child,
      ) {
        return Navigator(
          key: locator<DialogService>().dialogNavigationKey,
          onGenerateRoute: (RouteSettings settings) {
            return MaterialPageRoute(
              builder: (BuildContext context) {
                return DialogManager(
                  child: child,
                );
              },
            );
          },
        );
      },
      navigatorKey: locator<NavigationService>().navigationKey,
      theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: accentColor,
        backgroundColor: backgroundColor,
        scaffoldBackgroundColor: backgroundColor,
        primaryIconTheme: IconThemeData(
          color: backgroundColor,
        ),
        fontFamily: 'Gibson',
      ),
      home: StartupView(),
      onGenerateRoute: generateRoute,
    );
  }
}
