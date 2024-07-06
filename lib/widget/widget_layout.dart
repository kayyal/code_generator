// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

import 'widget_padding.dart';

part 'widget_layout.g.dart';

@JsonSerializable(explicitToJson: true)
@CopyWith(copyWithNull: true)

/// [Build Area] [Core Application] [Core] | [Models] [Widget]: WidgetLayouts
class WidgetLayout {
  double dx;
  double dy;
  double height;
  double width;
  bool isAbsolutePosition;
  bool isAbsoluteSize;
  WidgetPadding padding;

  WidgetLayout({
    this.dx = 0.0,
    this.dy = 0.0,
    this.height = 60.0,
    this.width = 60.0,
    this.isAbsolutePosition = false,
    this.isAbsoluteSize = false,
    this.padding = const WidgetPadding(),
  });

  get isNewCreated => dx == 0.0 && dy == 0.0;

  factory WidgetLayout.fromJson(Map<String, dynamic> json) =>
      _$WidgetLayoutFromJson(json);

  Map<String, dynamic> toJson() => _$WidgetLayoutToJson(this);
}
