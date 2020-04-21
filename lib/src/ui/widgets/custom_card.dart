import 'package:flutter/material.dart';
import 'package:homathon_project/src/ui/shared/app_colors.dart';
import 'package:homathon_project/src/ui/shared/ui_helpers.dart';

class CustomCard extends StatelessWidget {
  final EdgeInsets padding;
  final double elevation;

  final Color leadingContainerColor;
  final EdgeInsets leadingContainerPadding;
  final IconData leadingIcon;
  final Color leadingIconColor;

  final String titleText;
  final TextStyle titleTextStyle;

  final String subtitleText;
  final TextStyle subtitleTextStyle;

  final IconData trailingIcon;
  final Color trailingIconColor;

  final Function onTap;
  final Function onLongPress;

  final ShapeBorder shape;

  CustomCard({
    this.padding,
    this.elevation,
    this.leadingContainerColor,
    this.leadingContainerPadding,
    @required this.leadingIcon,
    this.leadingIconColor,
    @required this.titleText,
    this.titleTextStyle,
    this.subtitleText,
    this.subtitleTextStyle,
    this.trailingIcon,
    this.trailingIconColor,
    this.onTap,
    this.onLongPress,
    this.shape,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: blockSizeHorizontal(context) * 4,
            vertical: blockSizeHorizontal(context) * 3,
          ),
      child: Card(
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                50,
              ),
            ),
        elevation: elevation ?? 3,
        child: ListTile(
          onTap: onTap,
          onLongPress: onLongPress,
          leading: Container(
            padding: leadingContainerPadding ??
                EdgeInsets.all(
                  blockSizeHorizontal(context) * 2,
                ),
            decoration: BoxDecoration(
              color: leadingContainerColor ?? primaryColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              leadingIcon,
              color: leadingIconColor ?? textColorWhite,
            ),
          ),
          title: Text(
            titleText,
            style: titleTextStyle ??
                TextStyle(
                  fontSize: blockSizeHorizontal(context) * 5,
                  fontWeight: FontWeight.bold,
                ),
          ),
          subtitle: Text(
            subtitleText ?? 'Learn More',
            style: subtitleTextStyle ??
                TextStyle(
                  fontSize: blockSizeHorizontal(context) * 3.5,
                ),
          ),
          trailing: Icon(
            trailingIcon ?? Icons.arrow_forward_ios,
            color: trailingIconColor ?? Colors.grey,
          ),
        ),
      ),
    );
  }
}
