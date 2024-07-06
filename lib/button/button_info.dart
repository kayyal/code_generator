import 'button_action.dart';
import 'button_rgb_color.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

import 'button_color_style.dart';

part 'button_info.g.dart';

@JsonSerializable(explicitToJson: true)
@CopyWith(copyWithNull: true)
class ButtonInfo {
  final ButtonActionInfo action;
  final ButtonColorStyle colorStyle;

  ButtonInfo({
    required this.action,
    required this.colorStyle,
  });

  factory ButtonInfo.fromJson(Map<String, dynamic> json) =>
      _$ButtonInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ButtonInfoToJson(this);
}
