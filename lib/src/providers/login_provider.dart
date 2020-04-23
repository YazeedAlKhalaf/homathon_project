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

    setBusy(false);

    if (result is bool) {
      if (result) {
        navigationService.navigateToAndRemoveUntill(HomeViewRoute);
      } else {
        await dialogService.showDialog(
          title: 'Login Failure',
          description:
              'Something went wrong! It not your fault, Please try again later.',
        );
      }
    } else {
      await dialogService.showDialog(
        title: 'Login Failure',
        description: result,
      );
    }
  }

  void navigateToSignUp() {
    navigationService.navigateToAndRemoveUntill(SignupViewRoute);
  }
}
