import 'package:flutter/material.dart';
import 'package:homathon_project/src/constants/route_names.dart';
import 'package:homathon_project/src/providers/base_provider.dart';

class LoginProvider extends BaseProvider {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  Future login() async {
    setBusy(true);

    var result = await authenticationService.loginWithEmail(
      email: emailController.text,
      password: passwordController.text,
    );

    if (result is bool) {
      if (result) {
        navigationService.navigateToAndRemoveUntill(HomeViewRoute);
      } else {
        await dialogService.showDialog(
          title: loginViewTranslate('dialog.serverError.title'),
          description: loginViewTranslate('dialog.serverError.description'),
        );
      }
    } else {
      switch (result) {
        case 'Given String is empty or null':
          await dialogService.showDialog(
            title: loginViewTranslate('dialog.fieldsEmptyError.title'),
            description:
                loginViewTranslate('dialog.fieldsEmptyError.description'),
          );
          setBusy(false);
          break;
        case 'The email address is badly formatted.':
          await dialogService.showDialog(
            title: loginViewTranslate('dialog.emailErrorBad.title'),
            description: loginViewTranslate('dialog.emailErrorBad.description'),
          );
          setBusy(false);
          break;
        case 'The given password is invalid. [ Password should be at least 6 characters ]':
          await dialogService.showDialog(
            title: loginViewTranslate('dialog.passwordError.title'),
            description: loginViewTranslate('dialog.passwordError.description'),
          );
          setBusy(false);
          break;
        case 'There is no user record corresponding to this identifier. The user may have been deleted.':
          await dialogService.showDialog(
            title: loginViewTranslate('dialog.noUserError.title'),
            description: loginViewTranslate('dialog.noUserError.description'),
          );
          setBusy(false);
          break;
        default:
          print(result);
          await dialogService.showDialog(
            title: loginViewTranslate('dialog.defaultError.title'),
            description: loginViewTranslate('dialog.defaultError.description'),
          );
          setBusy(false);
      }
    }
  }

  void navigateToSignUp() {
    navigationService.navigateToAndRemoveUntill(SignupViewRoute);
  }

  String loginViewTranslate(String keyWithoutViewName) {
    return kTranslate(LoginViewRoute, keyWithoutViewName);
  }
}
