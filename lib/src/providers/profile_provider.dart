import 'package:homathon_project/src/constants/route_names.dart';
import 'package:homathon_project/src/providers/base_provider.dart';

class ProfileProvider extends BaseProvider {
  String profileViewTranslate(String keyWithoutViewName) {
    return kTranslate(ProfileViewRoute, keyWithoutViewName);
  }
}
