import 'package:homathon_project/src/constants/route_names.dart';
import 'package:homathon_project/src/models/dialog_models.dart';
import 'package:homathon_project/src/providers/base_provider.dart';

class HomeProvider extends BaseProvider {
  navigateToNotificationsView() {
    navigationService.navigateTo(NotificationsViewRoute);
  }

  navigateToProfileView() {
    navigationService.navigateTo(ProfileViewRoute);
  }

  navigateToHistoryView() async {
    setBusy(true);
    await navigationService.navigateTo(HistoryViewRoute);
    setBusy(false);
  }

  signOut() async {
    setBusy(true);
    DialogResponse dialogResponse = await dialogService.showConfirmationDialog(
      title: 'Are You Sure?',
      image: 'assets/images/gif/are_you_sure.gif',
      description: 'Are you sure you wanna sign out?',
      confirmationTitle: 'Yes, I\'m Pretty Sure!',
      cancelTitle: 'Nope',
    );

    if (dialogResponse.confirmed) {
      await authenticationService.signOut();
      await navigationService.navigateToAndRemoveUntill(LoginViewRoute);
    } else {
      setBusy(false);
    }
  }
}
