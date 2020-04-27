import 'package:flutter/material.dart';

class DialogRequest {
  final String title;
  final String description;
  final String buttonTitle;
  final String cancelTitle;

  /// `flareAnimation` can either be
  /// `success` or `fail` or `idle`
  final String flareAnimation;

  DialogRequest({
    @required this.title,
    @required this.description,
    @required this.buttonTitle,
    this.cancelTitle,
    this.flareAnimation,
  });
}

class DialogResponse {
  final String fieldOne;
  final String fieldTwo;
  final bool confirmed;

  DialogResponse({
    this.fieldOne,
    this.fieldTwo,
    this.confirmed,
  });
}
