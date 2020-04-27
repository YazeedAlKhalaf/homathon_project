import 'package:homathon_project/src/constants/route_names.dart';
import 'package:homathon_project/src/providers/base_provider.dart';

class HistoryProvider extends BaseProvider {
  String historyViewTranslate(String keyWithoutViewName) {
    return kTranslate(HistoryViewRoute, keyWithoutViewName);
  }
}
