import 'package:flutter/material.dart';
import 'package:homathon_project/src/ui/shared/app_colors.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final Color buttonColor;
  final Color circularProgressColor;
  final bool isBusy;

  RoundedButton({
    @required this.text,
    @required this.onPressed,
    this.padding,
    @required this.fontSize,
    this.fontWeight = FontWeight.bold,
    this.textColor = textColorWhite,
    this.buttonColor = primaryColor,
    this.circularProgressColor = textColorWhite,
    this.isBusy = false,
  });
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: padding,
      color: buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          50,
        ),
      ),
      child: !isBusy
          ? Text(
              text,
              style: TextStyle(
                color: textColor,
                fontWeight: fontWeight,
                fontSize: fontSize,
              ),
            )
          : CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(
                circularProgressColor,
              ),
            ),
      onPressed: onPressed,
    );
  }
}
