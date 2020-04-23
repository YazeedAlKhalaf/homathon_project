import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:homathon_project/src/models/user.dart';
import 'package:homathon_project/src/services/authentication_service.dart';
import 'package:homathon_project/src/services/firestore_service.dart';
import 'package:homathon_project/src/services/storage_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:homathon_project/src/locator.dart';
import 'package:homathon_project/src/services/dialog_service.dart';
import 'package:homathon_project/src/services/navigation_service.dart';
import 'package:homathon_project/src/utils/utilities.dart';

class BaseProvider extends ChangeNotifier {
  final NavigationService navigationService = locator<NavigationService>();
  final DialogService dialogService = locator<DialogService>();
  final Utils utils = locator<Utils>();
  final AuthenticationService authenticationService =
      locator<AuthenticationService>();
  final FirestoreService firestoreService = locator<FirestoreService>();
  final StorageService storageService = locator<StorageService>();

  User get currentUser => authenticationService.currentUser;

  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  void copyText({
    @required String text,
  }) {
    Clipboard.setData(
      ClipboardData(
        text: text,
      ),
    );
  }

  launchUrl({
    @required String url,
  }) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      dialogService.showDialog(
        title: 'Something went wrong!',
        description:
            'We have no clue what happened! You can copy the short url from the home screen.',
        buttonTitle: 'Ok, Thanks!',
        image: 'assets/images/gif/something_went_wrong.gif',
      );
    }
  }

  launchEmail({
    @required String email,
  }) async {
    await launch(
      'mailto:$email?subject=Error%20in%20WE%20PASS%20App&body=Describe%20your%20issue%20here.',
    );
  }

  void popCurrentContext() {
    navigationService.pop();
  }

  void removeFocus(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
