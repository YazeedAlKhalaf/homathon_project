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
            title: startupViewTranslate(
              'dialog.locationServiceDefault.title',
            ),
            description: startupViewTranslate(
              'dialog.locationServiceDefault.description',
            ),
          );
        }
        break;
      case PermissionStatus.restricted:
        dialogService.showDialog(
          title: startupViewTranslate(
            'dialog.locationServiceRestricted.title',
          ),
          description: startupViewTranslate(
            'dialog.locationServiceRestricted.description',
          ),
        );

        break;
      case PermissionStatus.denied:
        PermissionStatus permissionStatus = await Permission.location.request();

        if (permissionStatus == PermissionStatus.granted) {
          await handleLogin();
        } else {
          dialogService.showDialog(
            title: startupViewTranslate(
              'dialog.locationServiceDenied.description',
            ),
            description: startupViewTranslate(
              'dialog.locationServiceDenied.description',
            ),
          );
        }
        break;
      case PermissionStatus.permanentlyDenied:
        dialogService.showDialog(
          title: startupViewTranslate(
            'dialog.locationServicePermenantlyDenied.title',
          ),
          description: startupViewTranslate(
            'dialog.locationServicePermenantlyDenied.title',
          ),
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

  String startupViewTranslate(String keyWithoutViewName) {
    return kTranslate(StartupViewRoute, keyWithoutViewName);
  }
}
