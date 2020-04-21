import 'package:flutter/material.dart';
import 'package:homathon_project/src/providers/notifications_provider.dart';
import 'package:homathon_project/src/ui/shared/app_colors.dart';
import 'package:homathon_project/src/ui/shared/ui_helpers.dart';
import 'package:homathon_project/src/ui/widgets/custom_card.dart';
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
          backgroundColor: primaryColor,
          appBar: AppBar(
            elevation: 0,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: backgroundColor,
                  size: blockSizeHorizontal(context) * 7,
                ),
                onPressed: () {},
              ),
            ],
            bottom: PreferredSize(
              child: Padding(
                padding: EdgeInsets.all(
                  blockSizeHorizontal(context) * 3,
                ),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Notifications',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: textColorWhite,
                        fontSize: blockSizeHorizontal(context) * 10,
                      ),
                    ),
                  ],
                ),
              ),
              preferredSize: Size(
                screenWidth(context),
                blockSizeHorizontal(context) * 15,
              ),
            ),
          ),
          body: SafeArea(
            child: Center(
              child: ListView(
                children: <Widget>[
                  CustomCard(
                    leadingIcon: Icons.notifications_active,
                    titleText: 'New Case Detected!',
                    onTap: () {},
                  ),
                  CustomCard(
                    leadingIcon: Icons.notifications,
                    titleText: 'New Case Detected!',
                    onTap: () {},
                  ),
                  CustomCard(
                    leadingIcon: Icons.notifications,
                    titleText: 'New Case Detected!',
                    onTap: () {},
                  ),
                  CustomCard(
                    leadingIcon: Icons.notifications,
                    titleText: 'New Case Detected!',
                    onTap: () {},
                  ),
                  CustomCard(
                    leadingIcon: Icons.notifications,
                    titleText: 'New Case Detected!',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
