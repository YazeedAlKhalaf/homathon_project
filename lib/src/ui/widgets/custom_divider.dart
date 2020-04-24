import 'package:flutter/material.dart';
import 'package:homathon_project/src/ui/shared/app_colors.dart';
import 'package:homathon_project/src/ui/shared/ui_helpers.dart';

class CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: blockSizeHorizontal(context) * 2,
      width: double.infinity,
      decoration: BoxDecoration(
        color: primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              color: Color(0xff665EFF),
            ),
          ),
          Expanded(
            child: Container(
              color: Color(0xff5773FF),
            ),
          ),
          Expanded(
            child: Container(
              color: Color(0xff3497FD),
            ),
          ),
          Expanded(
            child: Container(
              color: Color(0xff3ACCE1),
            ),
          ),
        ],
      ),
    );
  }
}
