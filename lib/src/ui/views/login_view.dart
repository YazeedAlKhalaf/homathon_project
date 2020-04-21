import 'package:homathon_project/src/ui/shared/app_colors.dart';
import 'package:homathon_project/src/ui/shared/ui_helpers.dart';
import 'package:homathon_project/src/ui/widgets/busy_overlay.dart';
import 'package:homathon_project/src/ui/widgets/rounded_button.dart';
import 'package:homathon_project/src/ui/widgets/text_link.dart';
import 'package:homathon_project/src/providers/login_provider.dart';
import 'package:flutter/material.dart';
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
        return Scaffold(
          backgroundColor: backgroundColor,
          body: Center(
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
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: blockSizeHorizontal(context) * 15,
                          fontWeight: FontWeight.bold,
                          color: textColorBlack,
                        ),
                      ),
                      SizedBox(
                        height: blockSizeHorizontal(context) * 15,
                      ),
                      RoundedButton(
                        padding: EdgeInsets.symmetric(
                          horizontal: blockSizeHorizontal(context) * 7,
                          vertical: blockSizeHorizontal(context) * 2,
                        ),
                        text: 'Login',
                        isBusy: provider.busy,
                        fontSize: blockSizeHorizontal(context) * 7,
                        onPressed: () async {
                          provider.removeFocus(context);
                          await provider.login();
                        },
                      ),
                      SizedBox(
                        height: blockSizeHorizontal(context) * 5,
                      ),
                    ],
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
