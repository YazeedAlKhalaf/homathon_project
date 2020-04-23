import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homathon_project/src/providers/history_provider.dart';
import 'package:homathon_project/src/ui/shared/app_colors.dart';
import 'package:homathon_project/src/ui/shared/ui_helpers.dart';
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
        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'History',
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
            child: Container(
              decoration: BoxDecoration(
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
              height: screenHeight(context),
              child: Padding(
                padding: EdgeInsets.all(
                  blockSizeHorizontal(context) * 5,
                ),
                child: Timeline(
                  children: [
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '9:00 (25 min)',
                                style: TextStyle(
                                  color: lynchColor,
                                  fontSize: blockSizeHorizontal(context) * 4,
                                ),
                              ),
                              Text(
                                'Shopping',
                                style: TextStyle(
                                  color: accentColor,
                                  fontSize: blockSizeHorizontal(context) * 6,
                                ),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '9:25 (47 min)',
                                style: TextStyle(
                                  color: lynchColor,
                                  fontSize: blockSizeHorizontal(context) * 4,
                                ),
                              ),
                              Text(
                                'Meeting at Mile-End',
                                style: TextStyle(
                                  color: accentColor,
                                  fontSize: blockSizeHorizontal(context) * 6,
                                ),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '9:25 (47 min)',
                                style: TextStyle(
                                  color: lynchColor,
                                  fontSize: blockSizeHorizontal(context) * 4,
                                ),
                              ),
                              Text(
                                'Meeting at Mile-End',
                                style: TextStyle(
                                  color: accentColor,
                                  fontSize: blockSizeHorizontal(context) * 6,
                                ),
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
                      isLast: true,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '9:00 (25 min)',
                                style: TextStyle(
                                  color: lynchColor,
                                  fontSize: blockSizeHorizontal(context) * 4,
                                ),
                              ),
                              Text(
                                'Shopping',
                                style: TextStyle(
                                  color: accentColor,
                                  fontSize: blockSizeHorizontal(context) * 6,
                                ),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '9:25 (47 min)',
                                style: TextStyle(
                                  color: lynchColor,
                                  fontSize: blockSizeHorizontal(context) * 4,
                                ),
                              ),
                              Text(
                                'Meeting at Mile-End',
                                style: TextStyle(
                                  color: accentColor,
                                  fontSize: blockSizeHorizontal(context) * 6,
                                ),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '9:25 (47 min)',
                                style: TextStyle(
                                  color: lynchColor,
                                  fontSize: blockSizeHorizontal(context) * 4,
                                ),
                              ),
                              Text(
                                'Meeting at Mile-End',
                                style: TextStyle(
                                  color: accentColor,
                                  fontSize: blockSizeHorizontal(context) * 6,
                                ),
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
                      isLast: true,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '9:00 (25 min)',
                                style: TextStyle(
                                  color: lynchColor,
                                  fontSize: blockSizeHorizontal(context) * 4,
                                ),
                              ),
                              Text(
                                'Shopping',
                                style: TextStyle(
                                  color: accentColor,
                                  fontSize: blockSizeHorizontal(context) * 6,
                                ),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '9:25 (47 min)',
                                style: TextStyle(
                                  color: lynchColor,
                                  fontSize: blockSizeHorizontal(context) * 4,
                                ),
                              ),
                              Text(
                                'Meeting at Mile-End',
                                style: TextStyle(
                                  color: accentColor,
                                  fontSize: blockSizeHorizontal(context) * 6,
                                ),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '9:25 (47 min)',
                                style: TextStyle(
                                  color: lynchColor,
                                  fontSize: blockSizeHorizontal(context) * 4,
                                ),
                              ),
                              Text(
                                'Meeting at Mile-End',
                                style: TextStyle(
                                  color: accentColor,
                                  fontSize: blockSizeHorizontal(context) * 6,
                                ),
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
                      isLast: true,
                    ),
                  ],
                  position: TimelinePosition.Left,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
