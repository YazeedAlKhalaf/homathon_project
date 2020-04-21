import 'package:homathon_project/src/constants/route_names.dart';
import 'package:homathon_project/src/providers/base_provider.dart';

class LoginProvider extends BaseProvider {
  login() {
    navigationService.navigateToAndRemoveUntill(HomeViewRoute);
  }
}
