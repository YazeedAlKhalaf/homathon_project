import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:homathon_project/src/ui/views/map_view.dart';
import 'package:homathon_project/src/ui/widgets/custom_divider.dart';
import 'package:homathon_project/src/ui/widgets/rounded_button.dart';
import 'package:homathon_project/src/ui/widgets/text_link.dart';
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
        return Directionality(
          textDirection:
              provider.getLocalizationDelegate(context).currentLocale ==
                      Locale('ar')
                  ? TextDirection.rtl
                  : TextDirection.ltr,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              elevation: 0.3,
              title: Text(
                provider.homeViewTranslate(
                  'appBar.title',
                ),
                style: TextStyle(
                  color: textColorWhite,
                  fontSize: blockSizeHorizontal(context) * 7,
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
            drawer: BusyOverlay(
              show: provider.busy,
              child: Drawer(
                child: Column(
                  children: <Widget>[
                    Expanded(
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
                          CustomDivider(),
                          CustomCard(
                            leadingIcon: Icons.person,
                            titleText: provider.homeViewTranslate(
                              'drawer.profileCardTitle',
                            ),
                            onTap: () {
                              provider.navigateToProfileView();
                            },
                          ),
                          CustomCard(
                            leadingIcon: Icons.history,
                            titleText: provider.homeViewTranslate(
                              'drawer.historyCardTitle',
                            ),
                            onTap: () {
                              provider.navigateToHistoryView();
                            },
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          vertical: blockSizeHorizontal(context) * 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            RoundedButton(
                              text: provider.homeViewTranslate(
                                'drawer.signOutButtonText',
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: blockSizeHorizontal(context) * 3,
                                horizontal: blockSizeHorizontal(context) * 5,
                              ),
                              buttonColor: dangerColor,
                              fontSize: blockSizeHorizontal(context) * 5,
                              onPressed: () async {
                                await provider.signOut();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomDivider(),
                  ],
                ),
              ),
            ),
            body: MapView(),
          ),
        );
      },
    );
  }
}
