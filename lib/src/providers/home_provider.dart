import 'package:homathon_project/src/constants/route_names.dart';
import 'package:homathon_project/src/providers/base_provider.dart';

class HomeProvider extends BaseProvider {
  navigateToNotificationsView() {
    navigationService.navigateTo(NotificationsViewRoute);
  }

  navigateToProfileView() {
    navigationService.navigateTo(ProfileViewRoute);
  }

  navigateToMapView() async {
    setBusy(true);
    await navigationService.navigateTo(MapViewRoute);
    setBusy(false);
  }

  navigateToHistoryView() async {
    setBusy(true);
    await navigationService.navigateTo(HistoryViewRoute);
    setBusy(false);
  }
}
