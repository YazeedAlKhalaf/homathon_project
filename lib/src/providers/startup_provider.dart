import 'dart:async';

import 'package:homathon_project/src/constants/route_names.dart';
import 'package:homathon_project/src/providers/base_provider.dart';

class StartupProvider extends BaseProvider {
  handleStartUpLogic() {
    Timer(
      Duration(
        seconds: 2,
      ),
      () {
        navigationService.navigateToAndRemoveUntill(LoginViewRoute);
      },
    );
  }
}
