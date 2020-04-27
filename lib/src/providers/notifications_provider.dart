import 'package:homathon_project/src/providers/base_provider.dart';
import 'package:homathon_project/src/constants/route_names.dart';

class NotificationsProvider extends BaseProvider {
  String notificationsViewTranslate(String keyWithoutViewName) {
    return kTranslate(NotificationsViewRoute, keyWithoutViewName);
  }
}
