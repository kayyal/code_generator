// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'widget_padding.g.dart';

@JsonSerializable()
@CopyWith(copyWithNull: true)

/// [Build Area] [Core Application] [Core] | [Models] [Widget]: WidgetPadding
class WidgetPadding {
  final double left;
  final double right;
  final double top;
  final double bottom;

  const WidgetPadding(
      {this.left = 0.0, this.right = 0.0, this.top = 0.0, this.bottom = 0.0});

  factory WidgetPadding.fromJson(Map<String, dynamic> json) =>
      _$WidgetPaddingFromJson(json);

  Map<String, dynamic> toJson() => _$WidgetPaddingToJson(this);
}
