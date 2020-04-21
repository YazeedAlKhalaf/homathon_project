import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:homathon_project/src/providers/home_provider.dart';
import 'package:homathon_project/src/ui/shared/app_colors.dart';
import 'package:homathon_project/src/ui/shared/ui_helpers.dart';
import 'package:homathon_project/src/ui/widgets/busy_overlay.dart';
import 'package:homathon_project/src/ui/widgets/custom_card.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      viewModelBuilder: () => HomeProvider(),
      builder: (
        BuildContext context,
        HomeProvider provider,
        Widget child,
      ) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0.3,
            title: Text(
              'APP NAME',
              style: TextStyle(
                color: textColorWhite,
                fontSize: blockSizeHorizontal(context) * 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.notifications_none,
                  color: backgroundColor,
                  size: blockSizeHorizontal(context) * 6,
                ),
                onPressed: () {
                  provider.navigateToNotificationsView();
                },
              ),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  margin: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        'assets/images/defaults/default_background_image.png',
                      ),
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: accentColor,
                    backgroundImage: AssetImage(
                      'assets/images/defaults/default_profile_image.png',
                    ),
                  ),
                  accountName: Text(
                    provider.utils.getFullName(
                      currentUser: provider.currentUser,
                    ),
                  ),
                  accountEmail: Text(
                    provider.currentUser.email,
                  ),
                ),
                Container(
                  height: blockSizeHorizontal(context) * 2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: primaryColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: (blockSizeHorizontal(context) * 73.7) / 4,
                        color: Color(0xff665EFF),
                      ),
                      Container(
                        width: (blockSizeHorizontal(context) * 73.7) / 4,
                        color: Color(0xff5773FF),
                      ),
                      Container(
                        width: (blockSizeHorizontal(context) * 73.7) / 4,
                        color: Color(0xff3497FD),
                      ),
                      Container(
                        width: (blockSizeHorizontal(context) * 73.7) / 4,
                        color: Color(0xff3ACCE1),
                      ),
                    ],
                  ),
                ),
                CustomCard(
                  leadingIcon: Icons.person,
                  titleText: 'Profile',
                  onTap: () {
                    provider.navigateToProfileView();
                  },
                ),
                CustomCard(
                  leadingIcon: Icons.map,
                  titleText: 'Map',
                  onTap: () {
                    provider.navigateToMapView();
                  },
                ),
                CustomCard(
                  leadingIcon: Icons.history,
                  titleText: 'History',
                  onTap: () {
                    provider.navigateToHistoryView();
                  },
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: BusyOverlay(
              show: provider.busy,
              child: Column(
                children: <Widget>[],
              ),
            ),
          ),
        );
      },
    );
  }
}
