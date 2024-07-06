// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'widget_rgb_color.g.dart';

@JsonSerializable()
@CopyWith(copyWithNull: true)
class WidgetRgbColor {
  final int r;
  final int g;
  final int b;
  final double opacity;

  const WidgetRgbColor(
      {required this.r,
      required this.g,
      required this.b,
      required this.opacity});

  factory WidgetRgbColor.fromJson(Map<String, dynamic> json) =>
      _$WidgetRgbColorFromJson(json);

  Map<String, dynamic> toJson() => _$WidgetRgbColorToJson(this);
}
