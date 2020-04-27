import 'package:flutter_translate/flutter_translate.dart';
import 'package:homathon_project/src/ui/shared/app_colors.dart';
import 'package:homathon_project/src/ui/shared/ui_helpers.dart';
import 'package:homathon_project/src/ui/widgets/busy_overlay.dart';
import 'package:homathon_project/src/ui/widgets/rounded_button.dart';
import 'package:homathon_project/src/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:homathon_project/src/ui/widgets/text_link.dart';
import 'package:provider_architecture/provider_architecture.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<LoginProvider>.withConsumer(
      viewModelBuilder: () => LoginProvider(),
      builder: (
        BuildContext context,
        LoginProvider provider,
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
                      horizontal: screenWidth(context) * 0.1,
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
                            provider.loginViewTranslate('title'),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: blockSizeHorizontal(context) * 15,
                              fontWeight: FontWeight.bold,
                              color: textColorBlack,
                            ),
                          ),
                          SizedBox(
                            height: blockSizeHorizontal(context) * 15,
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
                              labelText:
                                  provider.loginViewTranslate('emailLabelText'),
                              hintText:
                                  provider.loginViewTranslate('emailHintText'),
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
                              labelText: provider
                                  .loginViewTranslate('passwordLabelText'),
                              hintText: provider
                                  .loginViewTranslate('passwordHintText'),
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
                                text: provider
                                    .loginViewTranslate('loginButtonText'),
                                isBusy: provider.busy,
                                fontSize: blockSizeHorizontal(context) * 7,
                                onPressed: () async {
                                  provider.removeFocus(context);
                                  await provider.login();
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: blockSizeHorizontal(context) * 5,
                          ),
                          TextLink(
                            provider.loginViewTranslate('textLinkNoAccount'),
                            style: TextStyle(
                              color: textColorLink,
                              fontSize: blockSizeHorizontal(context) * 4,
                              fontWeight: FontWeight.bold,
                            ),
                            onPressed: () {
                              provider.navigateToSignUp();
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
