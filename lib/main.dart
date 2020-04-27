import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:homathon_project/src/managers/dialog_manager.dart';
import 'package:homathon_project/src/locator.dart';
import 'package:homathon_project/src/services/dialog_service.dart';
import 'package:homathon_project/src/services/navigation_service.dart';
import 'package:homathon_project/src/ui/router.dart';
import 'package:homathon_project/src/ui/shared/app_colors.dart';
import 'package:homathon_project/src/ui/views/startup_view.dart';
import 'package:homathon_project/src/services/sharedprefs/translate_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  setupLocator();

  var delegate = await LocalizationDelegate.create(
    fallbackLocale: 'en_US',
    basePath: 'assets/i18n/',
    preferences: TranslatePreferences(),
    supportedLocales: [
      'en_US',
      'ar',
    ],
  );

  runApp(
    LocalizedApp(
      delegate,
      MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    print(localizationDelegate.currentLocale);
    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: translate(
          'AppInfo.appName',
        ),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate, // English
          localizationDelegate, // Arabic
        ],
        supportedLocales: localizationDelegate.supportedLocales,
        locale: localizationDelegate.currentLocale,
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
          fontFamily: 'Tajawal',
        ),
        home: StartupView(),
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
