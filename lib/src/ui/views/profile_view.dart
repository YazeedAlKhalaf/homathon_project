import 'package:flutter/material.dart';
import 'package:homathon_project/src/providers/profile_provider.dart';
import 'package:homathon_project/src/ui/shared/ui_helpers.dart';
import 'package:provider_architecture/provider_architecture.dart';

class ProfileView extends StatefulWidget {
  @override
  ProfileViewState createState() => ProfileViewState();
}

class ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      viewModelBuilder: () => ProfileProvider(),
      builder: (
        BuildContext context,
        ProfileProvider provider,
        Widget child,
      ) {
        return Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: Center(
              child: Text(
                'Profile View',
                style: TextStyle(
                  fontSize: blockSizeHorizontal(context) * 7,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
