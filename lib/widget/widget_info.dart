// ignore: depend_on_referenced_packages
import '/button/button_info.dart';
import '/widget/alignment_to_parent.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:code_generator/widget_type.dart';

import '../text/text_info.dart';
import 'widget_image.dart';
import 'widget_layout.dart';
import 'widget_style.dart';

part 'widget_info.g.dart';

@JsonSerializable(explicitToJson: true)
@CopyWith()
class WidgetInfo {
  final String key;
  final WidgetType widgetType;
  WidgetLayout widgetLayout;
  WidgetStyle widgetStyle;
  TextInfo? textInfo;
  ButtonInfo? buttonInfo;
  WidgetImage? image;
  AlignmentToParent? alignedWithParent;
  List<WidgetInfo>? children;
  // button up  / for figureing out the touchable info

  WidgetInfo({
    required this.key,
    required this.widgetType,
    required this.widgetLayout,
    required this.widgetStyle,
    this.textInfo,
    this.buttonInfo,
    this.children,
    this.alignedWithParent,
  });

  factory WidgetInfo.fromJson(Map<String, dynamic> json) =>
      _$WidgetInfoFromJson(json);

  Map<String, dynamic> toJson() => _$WidgetInfoToJson(this);
}
