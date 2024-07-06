// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

import 'widget_corner.dart';
import 'widget_rgb_color.dart';
import 'widget_shadow.dart';

part 'widget_style.g.dart';

@JsonSerializable(explicitToJson: true)
@CopyWith(copyWithNull: true)
class WidgetStyle {
  WidgetRgbColor color;
  WidgetCorner corner;
  List<WidgetShadow> shadows;

  WidgetStyle(
      {this.color = const WidgetRgbColor(r: 20, g: 30, b: 70, opacity: 1),
      WidgetCorner? corner,
      List<WidgetShadow>? shadows})
      : corner = corner ?? WidgetCorner(),
        shadows = shadows ?? List<WidgetShadow>.empty(growable: true);

  factory WidgetStyle.fromJson(Map<String, dynamic> json) =>
      _$WidgetStyleFromJson(json);

  Map<String, dynamic> toJson() => _$WidgetStyleToJson(this);
}
