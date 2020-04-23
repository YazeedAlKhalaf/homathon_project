import 'package:homathon_project/src/ui/shared/app_colors.dart';
import 'package:homathon_project/src/ui/shared/ui_helpers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String url;
  final GestureTapCallback onTap;
  final double width;
  final double height;

  CachedImage({
    @required this.url,
    this.onTap,
    this.height,
    this.width,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width ?? screenWidth(context) * 0.65,
        height: height ?? screenWidth(context) * 0.65,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            screenWidth(context) * 0.015,
          ),
          child: CachedNetworkImage(
              imageUrl: url,
              placeholder: (BuildContext context, String url) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(
                      primaryColor,
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
