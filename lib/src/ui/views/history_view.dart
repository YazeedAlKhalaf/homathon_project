import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homathon_project/src/providers/history_provider.dart';
import 'package:homathon_project/src/ui/shared/app_colors.dart';
import 'package:homathon_project/src/ui/shared/ui_helpers.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class HistoryView extends StatefulWidget {
  @override
  _HistoryViewState createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      viewModelBuilder: () => HistoryProvider(),
      builder: (
        BuildContext context,
        HistoryProvider provider,
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
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                provider.historyViewTranslate(
                  'appBar.title',
                ),
                style: TextStyle(
                  color: textColorWhite,
                  fontSize: blockSizeHorizontal(context) * 8,
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.sort,
                    color: textColorWhite,
                  ),
                  onPressed: () {},
                ),
              ],
              bottom: PreferredSize(
                preferredSize: Size(
                  screenWidth(context),
                  blockSizeHorizontal(context) * 4,
                ),
                child: Center(
                  child: Container(),
                ),
              ),
            ),
            body: SafeArea(
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: screenWidth(context),
                      height: screenHeight(context) / 4,
                      child: PhotoView(
                        imageProvider: AssetImage(
                          'assets/images/history_map.png',
                        ),
                        initialScale: PhotoViewComputedScale.contained * 2,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            blockSizeHorizontal(context) * 5,
                          ),
                          topRight: Radius.circular(
                            blockSizeHorizontal(context) * 5,
                          ),
                        ),
                      ),
                      width: screenWidth(context),
                      height: screenHeight(context) / 2,
                      child: Padding(
                        padding: EdgeInsets.all(
                          blockSizeHorizontal(context) * 5,
                        ),
                        child: Timeline(
                          children: [
                            TimelineModel(
                              Card(
                                color: dangerColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    15,
                                  ),
                                ),
                                elevation: 4,
                                child: Padding(
                                  padding: EdgeInsets.all(
                                    blockSizeHorizontal(context) * 5,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        provider.historyViewTranslate(
                                          'body.card1.dateTimeText',
                                        ),
                                        style: TextStyle(
                                          color: textColorWhite,
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              blockSizeHorizontal(context) * 4,
                                        ),
                                      ),
                                      Text(
                                        provider.historyViewTranslate(
                                          'body.card1.title',
                                        ),
                                        style: TextStyle(
                                          color: textColorWhite,
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              blockSizeHorizontal(context) * 5,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          CircleAvatar(
                                            radius:
                                                blockSizeHorizontal(context) *
                                                    6,
                                            backgroundColor:
                                                lightDodgerBlueColor,
                                            child: Stack(
                                              children: <Widget>[
                                                Center(
                                                  child: Container(
                                                    child: Icon(
                                                      Icons.person,
                                                      size: blockSizeHorizontal(
                                                              context) *
                                                          9,
                                                    ),
                                                  ),
                                                ),
                                                Opacity(
                                                  opacity: 0.8,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: primaryColor,
                                                    ),
                                                  ),
                                                ),
                                                Center(
                                                  child: Container(
                                                    child: Text(
                                                      '+3',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            blockSizeHorizontal(
                                                                    context) *
                                                                5,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              position: TimelineItemPosition.left,
                              iconBackground: dodgerBlueColor,
                              icon: Icon(
                                Icons.fastfood,
                                color: backgroundColor,
                                size: blockSizeHorizontal(context) * 5,
                              ),
                              isFirst: true,
                            ),
                            TimelineModel(
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    15,
                                  ),
                                ),
                                elevation: 4,
                                child: Padding(
                                  padding: EdgeInsets.all(
                                    blockSizeHorizontal(context) * 5,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        provider.historyViewTranslate(
                                          'body.card2.title',
                                        ),
                                        style: TextStyle(
                                          color: lynchColor,
                                          fontSize:
                                              blockSizeHorizontal(context) * 4,
                                        ),
                                      ),
                                      Text(
                                        provider.historyViewTranslate(
                                          'body.card2.title',
                                        ),
                                        style: TextStyle(
                                          color: accentColor,
                                          fontSize:
                                              blockSizeHorizontal(context) * 6,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          CircleAvatar(
                                            radius:
                                                blockSizeHorizontal(context) *
                                                    6,
                                            backgroundColor:
                                                lightDodgerBlueColor,
                                            backgroundImage: AssetImage(
                                              'assets/images/defaults/default_avatar1_image.png',
                                            ),
                                          ),
                                          SizedBox(
                                            width:
                                                blockSizeHorizontal(context) *
                                                    3,
                                          ),
                                          CircleAvatar(
                                            radius:
                                                blockSizeHorizontal(context) *
                                                    6,
                                            backgroundColor: mediumPurpleColor,
                                            child: Text(
                                              '+5',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: textColorWhite,
                                                fontWeight: FontWeight.bold,
                                                fontSize: blockSizeHorizontal(
                                                        context) *
                                                    5,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              position: TimelineItemPosition.left,
                              iconBackground: mediumPurpleColor,
                              icon: Icon(
                                FontAwesomeIcons.heart,
                                color: backgroundColor,
                                size: blockSizeHorizontal(context) * 5,
                              ),
                            ),
                            TimelineModel(
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    15,
                                  ),
                                ),
                                elevation: 4,
                                child: Padding(
                                  padding: EdgeInsets.all(
                                    blockSizeHorizontal(context) * 5,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        provider.historyViewTranslate(
                                          'body.card3.dateTimeText',
                                        ),
                                        style: TextStyle(
                                          color: lynchColor,
                                          fontSize:
                                              blockSizeHorizontal(context) * 4,
                                        ),
                                      ),
                                      Text(
                                        provider.historyViewTranslate(
                                          'body.card3.title',
                                        ),
                                        style: TextStyle(
                                          color: accentColor,
                                          fontSize:
                                              blockSizeHorizontal(context) * 6,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          CircleAvatar(
                                            radius:
                                                blockSizeHorizontal(context) *
                                                    6,
                                            backgroundColor:
                                                lightDodgerBlueColor,
                                            child: Text(
                                              '14K',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: textColorWhite,
                                                fontWeight: FontWeight.bold,
                                                fontSize: blockSizeHorizontal(
                                                        context) *
                                                    4.5,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width:
                                                blockSizeHorizontal(context) *
                                                    3,
                                          ),
                                          CircleAvatar(
                                            radius:
                                                blockSizeHorizontal(context) *
                                                    6,
                                            backgroundColor: mediumPurpleColor,
                                            child: Text(
                                              '3',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: textColorWhite,
                                                fontWeight: FontWeight.bold,
                                                fontSize: blockSizeHorizontal(
                                                        context) *
                                                    5,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              position: TimelineItemPosition.left,
                              iconBackground: lightDodgerBlueColor,
                              icon: Icon(
                                Icons.healing,
                                color: backgroundColor,
                                size: blockSizeHorizontal(context) * 5,
                              ),
                            ),
                          ],
                          position: provider
                                      .getLocalizationDelegate(context)
                                      .currentLocale ==
                                  Locale('ar')
                              ? TimelinePosition.Right
                              : TimelinePosition.Left,
                        ),
                      ),
                    ),
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
