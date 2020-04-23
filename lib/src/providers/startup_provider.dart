import 'dart:async';

import 'package:homathon_project/src/constants/route_names.dart';
import 'package:homathon_project/src/providers/base_provider.dart';

class StartupProvider extends BaseProvider {
  Future handleStartUpLogic() async {
    bool hasLoggedInUser = await authenticationService.isUserLoggedIn();

    if (hasLoggedInUser) {
      navigationService.navigateToAndRemoveUntill(HomeViewRoute);
    } else {
      navigationService.navigateToAndRemoveUntill(LoginViewRoute);
    }
  }
}
