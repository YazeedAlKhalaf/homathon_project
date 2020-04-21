import 'package:flutter/material.dart';
import 'package:homathon_project/src/providers/notifications_provider.dart';
import 'package:homathon_project/src/ui/shared/ui_helpers.dart';
import 'package:provider_architecture/provider_architecture.dart';

class NotificationsView extends StatefulWidget {
  @override
  _NotificationsViewState createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      viewModelBuilder: () => NotificationsProvider(),
      builder: (
        BuildContext context,
        NotificationsProvider provider,
        Widget child,
      ) {
        return Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: Center(
              child: Text(
                'Notifications View',
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
