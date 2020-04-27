import 'package:flutter_translate/flutter_translate.dart';
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
        return Directionality(
          textDirection:
              provider.getLocalizationDelegate(context).currentLocale ==
                      Locale('ar')
                  ? TextDirection.rtl
                  : TextDirection.ltr,
          child: Scaffold(
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              TextLink(
                                'EN',
                                onPressed: () {
                                  changeLocale(context, 'en_US');
                                },
                                style: TextStyle(
                                  fontSize: blockSizeHorizontal(context) * 5,
                                ),
                              ),
                              Text(
                                ' | ',
                                style: TextStyle(
                                  fontSize: blockSizeHorizontal(context) * 5,
                                ),
                              ),
                              TextLink(
                                'AR',
                                onPressed: () {
                                  changeLocale(context, 'ar');
                                },
                                style: TextStyle(
                                  fontSize: blockSizeHorizontal(context) * 5,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            provider.signUpViewTranslate('title'),
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
                                    labelText: provider.signUpViewTranslate(
                                      'firstNameLabelText',
                                    ),
                                    hintText: provider.signUpViewTranslate(
                                      'firstNameHintText',
                                    ),
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
                                    labelText: provider.signUpViewTranslate(
                                      'lastNameLabelText',
                                    ),
                                    hintText: provider.signUpViewTranslate(
                                      'lastNameHintText',
                                    ),
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
                              labelText: provider.signUpViewTranslate(
                                'idNumberOrIqamaLabelText',
                              ),
                              hintText: provider.signUpViewTranslate(
                                'idNumberOrIqamaHintText',
                              ),
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
                              labelText: provider.signUpViewTranslate(
                                'usernameLabelText',
                              ),
                              hintText: provider.signUpViewTranslate(
                                'usernameHintText',
                              ),
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
                              labelText: provider.signUpViewTranslate(
                                'emailLabelText',
                              ),
                              hintText: provider.signUpViewTranslate(
                                'emailHintText',
                              ),
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
                              labelText: provider.signUpViewTranslate(
                                'passwordLabelText',
                              ),
                              hintText: provider.signUpViewTranslate(
                                'passwordHintText',
                              ),
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
                                text: provider.signUpViewTranslate(
                                  'signupButtonText',
                                ),
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
                            provider.signUpViewTranslate(
                              'textLinkHaveAnAccount',
                            ),
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
          ),
        );
      },
    );
  }
}
