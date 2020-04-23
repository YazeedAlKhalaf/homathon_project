import 'package:homathon_project/src/ui/shared/app_colors.dart';
import 'package:homathon_project/src/ui/shared/ui_helpers.dart';
import 'package:homathon_project/src/ui/widgets/busy_overlay.dart';
import 'package:homathon_project/src/ui/widgets/rounded_button.dart';
import 'package:homathon_project/src/providers/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:homathon_project/src/ui/widgets/text_link.dart';
import 'package:provider_architecture/provider_architecture.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SignupProvider>.withConsumer(
      viewModelBuilder: () => SignupProvider(),
      builder: (
        BuildContext context,
        SignupProvider provider,
        Widget child,
      ) {
        return Scaffold(
          backgroundColor: backgroundColor,
          body: GestureDetector(
            onTap: () => provider.removeFocus(context),
            child: Center(
              child: BusyOverlay(
                show: provider.busy,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: blockSizeHorizontal(context) * 10,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: blockSizeHorizontal(context) * 15,
                            fontWeight: FontWeight.bold,
                            color: textColorBlack,
                          ),
                        ),
                        SizedBox(
                          height: blockSizeHorizontal(context) * 5,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: TextFormField(
                                controller: provider.firstNameController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      50,
                                    ),
                                  ),
                                  labelText: 'First Name',
                                  hintText: 'Enter your first name',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: blockSizeHorizontal(context) * 5,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: provider.lastNameController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      50,
                                    ),
                                  ),
                                  labelText: 'Last Name',
                                  hintText: 'Enter your last name',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: blockSizeHorizontal(context) * 5,
                        ),
                        TextFormField(
                          controller: provider.idNumberController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                50,
                              ),
                            ),
                            labelText: 'ID Number or Iqama',
                            hintText: 'Enter your own ID Number or Iqama',
                          ),
                        ),
                        SizedBox(
                          height: blockSizeHorizontal(context) * 5,
                        ),
                        TextFormField(
                          controller: provider.usernameController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                50,
                              ),
                            ),
                            labelText: 'Username',
                            hintText: 'Enter your own username',
                          ),
                        ),
                        SizedBox(
                          height: blockSizeHorizontal(context) * 5,
                        ),
                        TextFormField(
                          controller: provider.emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                50,
                              ),
                            ),
                            labelText: 'Email',
                            hintText: 'e.g example@example.com',
                          ),
                        ),
                        SizedBox(
                          height: blockSizeHorizontal(context) * 5,
                        ),
                        TextFormField(
                          controller: provider.passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                50,
                              ),
                            ),
                            labelText: 'Password',
                            hintText: 'Enter your own password :-)',
                          ),
                          obscureText: true,
                        ),
                        SizedBox(
                          height: blockSizeHorizontal(context) * 5,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RoundedButton(
                              padding: EdgeInsets.symmetric(
                                horizontal: blockSizeHorizontal(context) * 7,
                                vertical: blockSizeHorizontal(context) * 2,
                              ),
                              text: 'Sign Up',
                              isBusy: provider.busy,
                              fontSize: blockSizeHorizontal(context) * 7,
                              onPressed: () async {
                                provider.removeFocus(context);
                                await provider.signup();
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: blockSizeHorizontal(context) * 5,
                        ),
                        TextLink(
                          'Already have an account? Login now!',
                          style: TextStyle(
                            color: textColorLink,
                            fontSize: blockSizeHorizontal(context) * 4,
                            fontWeight: FontWeight.bold,
                          ),
                          onPressed: () {
                            provider.navigateToLogin();
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
