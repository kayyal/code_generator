// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'widget_corner.g.dart';

@JsonSerializable(explicitToJson: true)
@CopyWith(copyWithNull: true)

/// [Build Area] [Core Application] [Core] | [Models] [Widget]: Corner
class WidgetCorner {
  double topRight;
  double topLeft;
  double bottomRight;
  double bottomLeft;

  WidgetCorner(
      {this.topRight = 0.0,
      this.topLeft = 0.0,
      this.bottomRight = 0.0,
      this.bottomLeft = 0.0});

  factory WidgetCorner.fromJson(Map<String, dynamic> json) =>
      _$WidgetCornerFromJson(json);

  Map<String, dynamic> toJson() => _$WidgetCornerToJson(this);
}
