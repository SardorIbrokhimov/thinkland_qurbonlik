import 'package:flutter/material.dart';

/// add Padding Property to widget
extension WidgetPaddingX on Widget {
  Widget paddingAll(double padding) =>
      Padding(padding: EdgeInsets.all(padding), child: this);

  Widget paddingSymmetric({
    double horizontal = 0.0,
    double vertical = 0.0,
  }) =>
      Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontal,
            vertical: vertical,
          ),
          child: this);

  Widget paddingOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      Padding(
          padding: EdgeInsets.only(
              top: top, left: left, right: right, bottom: bottom),
          child: this);

  Widget get paddingZero => Padding(
        padding: EdgeInsets.zero,
        child: this,
      );

  /// paddingLTRB EdgeInsets.fromLTRB(left, top, right, bottom)
  Widget paddingLTRB(double left, double top, double right, double bottom) =>
      Padding(
        padding: EdgeInsets.fromLTRB(left, top, right, bottom),
        child: this,
      );

  /// Transform.rotate
  Widget rotateX(double angle) {
    return Transform.rotate(
      angle: angle,
      alignment: Alignment.center,
      child: this,
    );
  }
}

/// Add margin property to widget
extension WidgetMarginX on Widget {
  Widget marginAll(double margin) =>
      Container(margin: EdgeInsets.all(margin), child: this);

  Widget marginSymmetric({double horizontal = 0.0, double vertical = 0.0}) =>
      Container(
          margin: EdgeInsets.symmetric(
            horizontal: horizontal,
            vertical: vertical,
          ),
          child: this);

  Widget marginOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      Container(
          margin: EdgeInsets.only(
            top: top,
            left: left,
            right: right,
            bottom: bottom,
          ),
          child: this);
  Widget marginLTRB(
    double left,
    double top,
    double right,
    double bottom,
  ) =>
      Container(
        margin: EdgeInsets.fromLTRB(left, top, right, bottom),
        child: this,
      );

  Widget get marginZero => Container(
        margin: EdgeInsets.zero,
        child: this,
      );
}

extension WidgetBackground on Widget {
  Widget tabBar() => Container(
        alignment: Alignment.bottomCenter,
        child: this,
      );
}

extension WidgetAlign on Widget {
  /// Align wraped bottomCenter
  Widget get bottomCenter => Align(
        alignment: Alignment.bottomCenter,
        child: this,
      );

  /// Align wraped bottomLeft
  Widget get bottomLeft => Align(
        alignment: Alignment.bottomLeft,
        child: this,
      );

  /// Align wraped bottomRight
  Widget get bottomRight => Align(
        alignment: Alignment.bottomRight,
        child: this,
      );

  /// Align wraped center
  Widget get center => Align(
        alignment: Alignment.center,
        child: this,
      );

  /// Align wraped centerLeft
  Widget get centerLeft => Align(
        alignment: Alignment.centerLeft,
        child: this,
      );

  /// Align wraped centerRight
  Widget get centerRight => Align(
        alignment: Alignment.centerRight,
        child: this,
      );

  /// Align wraped topCenter
  Widget get topCenter => Align(
        alignment: Alignment.topCenter,
        child: this,
      );

  /// Align wraped topLeft
  Widget get topLeft => Align(
        alignment: Alignment.topLeft,
        child: this,
      );

  /// Align wraped topRight
  Widget get topRight => Align(
        alignment: Alignment.topRight,
        child: this,
      );
}
