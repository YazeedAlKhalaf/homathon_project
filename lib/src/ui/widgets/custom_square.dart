import 'package:flutter/material.dart';
import 'package:homathon_project/src/ui/shared/app_colors.dart';
import 'package:homathon_project/src/ui/shared/ui_helpers.dart';

class CustomSquare extends StatelessWidget {
  final Function onTap;
  final EdgeInsets padding;

  final IconData iconData;
  final double iconSize;
  final Color iconColor;

  final String text;
  final TextStyle textStyle;
  final TextAlign textAlign;

  CustomSquare({
    @required this.onTap,
    this.padding,
    @required this.iconData,
    this.iconSize,
    this.iconColor,
    @required this.text,
    this.textStyle,
    this.textAlign,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: blockSizeHorizontal(context) * 7,
              vertical: blockSizeHorizontal(context) * 5,
            ),
        child: Column(
          children: <Widget>[
            Icon(
              iconData,
              color: iconColor ?? pictonBlueColor,
              size: iconSize ?? blockSizeHorizontal(context) * 8,
            ),
            SizedBox(
              height: blockSizeHorizontal(context) * 5,
            ),
            Text(
              text,
              textAlign: textAlign ?? TextAlign.center,
              style: textStyle ??
                  TextStyle(
                    color: lynchColor,
                    fontSize: blockSizeHorizontal(context) * 5,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
