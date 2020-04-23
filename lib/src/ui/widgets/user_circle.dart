import 'package:flutter/material.dart';
import 'package:homathon_project/src/ui/shared/app_colors.dart';

class UserCircle extends StatelessWidget {
  final Widget image;
  final double width;
  final double height;
  final GestureTapCallback onTap;

  UserCircle({
    @required this.image,
    @required this.width,
    @required this.height,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: lynchColor,
        ),
        child: Align(
          alignment: Alignment.center,
          child: ClipOval(
            child: image,
          ),
        ),
      ),
    );
  }
}
