import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:homathon_project/src/providers/profile_provider.dart';
import 'package:homathon_project/src/ui/shared/app_colors.dart';
import 'package:homathon_project/src/ui/shared/ui_helpers.dart';
import 'package:homathon_project/src/ui/widgets/custom_square.dart';
import 'package:homathon_project/src/ui/widgets/rounded_button.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(
              color: primaryColor,
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.edit,
                  color: primaryColor,
                ),
                onPressed: () {
                  provider.navigateToEditProfileView();
                },
              ),
            ],
          ),
          body: SafeArea(
            child: Center(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: blockSizeHorizontal(context) * 20,
                    backgroundImage: provider.currentUser.profilePhoto == null
                        ? AssetImage(
                            'assets/images/defaults/default_profile_image.png',
                          )
                        : CachedNetworkImageProvider(
                            provider.currentUser.profilePhoto,
                          ),
                  ),
                  SizedBox(
                    height: blockSizeHorizontal(context) * 5,
                  ),
                  Text(
                    provider.utils.getFullName(
                      currentUser: provider.currentUser,
                    ),
                    style: TextStyle(
                      fontSize: blockSizeHorizontal(context) * 10,
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: blockSizeHorizontal(context) * 2,
                  ),
                  Text(
                    provider.currentUser.email,
                    style: TextStyle(
                      fontSize: blockSizeHorizontal(context) * 5,
                      color: lynchColor,
                    ),
                  ),
                  SizedBox(
                    height: blockSizeHorizontal(context) * 8,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CustomSquare(
                            onTap: () {},
                            iconData: FontAwesomeIcons.comments,
                            iconColor: pictonBlueColor,
                            text: 'Chats',
                            textStyle: TextStyle(
                              fontSize: blockSizeHorizontal(context) * 5,
                              color: lynchColor,
                            ),
                          ),
                          CustomSquare(
                            onTap: () {},
                            iconData: FontAwesomeIcons.archive,
                            iconColor: lightDodgerBlueColor,
                            text: 'Docks',
                            textStyle: TextStyle(
                              fontSize: blockSizeHorizontal(context) * 5,
                              color: lynchColor,
                            ),
                          ),
                          CustomSquare(
                            onTap: () {},
                            iconData: FontAwesomeIcons.locationArrow,
                            iconColor: cornFlowerBlueColor,
                            text: 'Location',
                            textStyle: TextStyle(
                              fontSize: blockSizeHorizontal(context) * 5,
                              color: lynchColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CustomSquare(
                            onTap: () {},
                            iconData: FontAwesomeIcons.userFriends,
                            iconColor: pictonBlueColor,
                            text: 'Friends',
                            textStyle: TextStyle(
                              fontSize: blockSizeHorizontal(context) * 5,
                              color: lynchColor,
                            ),
                          ),
                          CustomSquare(
                            onTap: () {},
                            iconData: FontAwesomeIcons.userLock,
                            iconColor: lightDodgerBlueColor,
                            text: 'Settings',
                            textStyle: TextStyle(
                              fontSize: blockSizeHorizontal(context) * 5,
                              color: lynchColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: blockSizeHorizontal(context) * 8,
                      ),
                      RoundedButton(
                        text: 'Sign Out',
                        buttonColor: Colors.redAccent,
                        fontSize: blockSizeHorizontal(context) * 5,
                        onPressed: () async {
                          await provider.signOut();
                        },
                      ),
                    ],
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
