import 'package:homathon_project/src/constants/route_names.dart';
import 'package:flutter/material.dart';
import 'package:homathon_project/src/providers/base_provider.dart';

class SignupProvider extends BaseProvider {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final idNumberController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future signup() async {
    setBusy(true);

    var result = await authenticationService.signUpWithEmail(
      email: emailController.text,
      password: passwordController.text,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      username: usernameController.text,
      idNumber: idNumberController.text,
    );

    setBusy(false);

    if (result is bool) {
      if (result) {
        navigationService.navigateToAndRemoveUntill(HomeViewRoute);
      } else {
        await dialogService.showDialog(
          title: signUpViewTranslate('dialog.serverError.title'),
          description: signUpViewTranslate('dialog.serverError.description'),
        );
      }
    } else {
      switch (result) {
        case 'Given String is empty or null':
          await dialogService.showDialog(
            title: signUpViewTranslate('dialog.fieldsEmptyError.title'),
            description:
                signUpViewTranslate('dialog.fieldsEmptyError.description'),
          );
          break;
        case 'The email address is badly formatted.':
          await dialogService.showDialog(
            title: signUpViewTranslate('dialog.emailErrorBad.title'),
            description:
                signUpViewTranslate('dialog.emailErrorBad.description'),
          );
          break;
        case 'The given password is invalid. [ Password should be at least 6 characters ]':
          await dialogService.showDialog(
            title: signUpViewTranslate('dialog.passwordError.title'),
            description:
                signUpViewTranslate('dialog.passwordError.description'),
          );
          break;
        case 'The email address is already in use by another account.':
          await dialogService.showDialog(
            title: signUpViewTranslate('dialog.emailErrorUsed.title'),
            description:
                signUpViewTranslate('dialog.emailErrorUsed.description'),
          );
          break;
        default:
          print(result);
          await dialogService.showDialog(
            title: signUpViewTranslate('dialog.defaultError.title'),
            description: signUpViewTranslate('dialog.defaultError.description'),
          );
      }
    }
  }

  void navigateToLogin() {
    navigationService.navigateToAndRemoveUntill(LoginViewRoute);
  }

  String signUpViewTranslate(String keyWithoutViewName) {
    return kTranslate(SignupViewRoute, keyWithoutViewName);
  }
}
