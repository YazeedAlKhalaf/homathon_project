import 'package:homathon_project/src/constants/route_names.dart';
import 'package:homathon_project/src/providers/base_provider.dart';

class HomeProvider extends BaseProvider {
  navigateToNotificationsView() {
    navigationService.navigateTo(NotificationsViewRoute);
  }

  navigateToProfileView() {
    navigationService.navigateTo(ProfileViewRoute);
  }

  navigateToMapView() {
    navigationService.navigateTo(MapViewRoute);
  }

  navigateToHistoryView() {
    navigationService.navigateTo(HistoryViewRoute);
  }
}
