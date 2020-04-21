import 'package:homathon_project/src/ui/shared/app_colors.dart';
import 'package:homathon_project/src/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

class BusyOverlay extends StatelessWidget {
  final Widget child;
  final String title;
  final bool show;

  const BusyOverlay({
    this.child,
    this.title = 'Please wait...',
    this.show = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      child: Stack(
        children: <Widget>[
          child,
          show
              ? IgnorePointer(
                  ignoring: true,
                  child: Opacity(
                    opacity: 1.0,
                    child: Container(
                      width: screenWidth(context),
                      height: screenHeight(context),
                      alignment: Alignment.center,
                      color: Color.fromARGB(
                        200,
                        0,
                        0,
                        0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(
                              primaryColor,
                            ),
                          ),
                          SizedBox(
                            height: blockSizeHorizontal(context) * 5,
                          ),
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: blockSizeHorizontal(context) * 5,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
