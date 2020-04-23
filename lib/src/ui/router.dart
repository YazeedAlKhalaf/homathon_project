import 'package:flutter/material.dart';
import 'package:homathon_project/src/constants/route_names.dart';
import 'package:homathon_project/src/ui/views/edit_profile_view.dart';
import 'package:homathon_project/src/ui/views/history_view.dart';
import 'package:homathon_project/src/ui/views/home_view.dart';
import 'package:homathon_project/src/ui/views/login_view.dart';
import 'package:homathon_project/src/ui/views/map_view.dart';
import 'package:homathon_project/src/ui/views/notifications_view.dart';
import 'package:homathon_project/src/ui/views/profile_view.dart';
import 'package:homathon_project/src/ui/views/signup_view.dart.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomeView(),
      );
      break;
    case LoginViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginView(),
      );
      break;
    case SignupViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignupView(),
      );
      break;
    case NotificationsViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: NotificationsView(),
      );
      break;
    case ProfileViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: ProfileView(),
      );
      break;
    case EditProfileViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: EditProfileView(),
      );
      break;
    case MapViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: MapView(),
      );
      break;
    case HistoryViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HistoryView(),
      );
      break;
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text(
              'No route defined for ${settings.name}',
            ),
          ),
        ),
      );
  }
}

PageRoute _getPageRoute({
  String routeName,
  Widget viewToShow,
}) {
  return MaterialPageRoute(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => viewToShow,
  );
}
