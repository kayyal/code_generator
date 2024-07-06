// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

import 'widget_rgb_color.dart';

part 'widget_shadow.g.dart';

@JsonSerializable(explicitToJson: true)
@CopyWith(copyWithNull: true)
class WidgetShadow {
  double blurRadius;
  int blurStyle;
  WidgetRgbColor color;
  double offsetX;
  double offsetY;
  double spreadRadius;

  WidgetShadow(
      {required this.blurRadius,
      this.blurStyle = 0,
      required this.color,
      required this.offsetX,
      required this.offsetY,
      required this.spreadRadius});

  factory WidgetShadow.fromJson(Map<String, dynamic> json) =>
      _$WidgetShadowFromJson(json);

  Map<String, dynamic> toJson() => _$WidgetShadowToJson(this);
}
