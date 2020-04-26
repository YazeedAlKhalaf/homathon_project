import 'dart:async';

import 'package:homathon_project/src/constants/route_names.dart';
import 'package:homathon_project/src/providers/base_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class StartupProvider extends BaseProvider {
  Future handleStartUpLogic() async {
    switch (await Permission.location.status) {
      case PermissionStatus.granted:
        await handleLogin();
        break;
      case PermissionStatus.undetermined:
        PermissionStatus permissionStatus = await Permission.location.request();

        if (permissionStatus == PermissionStatus.granted) {
          await handleLogin();
        } else {
          dialogService.showDialog(
            title: 'OOPS!',
            description: '''
                You can\'t use the app without allowing the locations service.
                Please relaunch the app or go to settings and allow location usage.
                ''',
          );
        }
        break;
      case PermissionStatus.restricted:
        dialogService.showDialog(
          title: 'OOPS!',
          description: '''
                You can\'t use the app without allowing the locations service.
                The location is restricted on your device, please tell you parent or administartor to allow it so that you can use the app.
                ''',
        );

        break;
      case PermissionStatus.denied:
        PermissionStatus permissionStatus = await Permission.location.request();

        if (permissionStatus == PermissionStatus.granted) {
          await handleLogin();
        } else {
          dialogService.showDialog(
            title: 'OOPS!',
            description: '''
                You can\'t use the app without allowing the locations service.\nPlease relaunch the app or go to settings and allow location usage.
                ''',
          );
        }
        break;
      case PermissionStatus.permanentlyDenied:
        dialogService.showDialog(
          title: 'OOPS!',
          description: '''
                You can\'t use the app without allowing the locations service,
                Please go to settings and allow location usage.
                ''',
        );
        break;
      default:
    }
  }

  handleLogin() async {
    bool hasLoggedInUser = await authenticationService.isUserLoggedIn();
    if (hasLoggedInUser) {
      navigationService.navigateToAndRemoveUntill(HomeViewRoute);
    } else {
      navigationService.navigateToAndRemoveUntill(LoginViewRoute);
    }
  }
}
