import 'button_rgb_color.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'button_color_style.g.dart';

@JsonSerializable(explicitToJson: true)
@CopyWith(copyWithNull: true)
class ButtonColorStyle {
  final ButtonRgbColor focusedColor;
  final ButtonRgbColor hoveredColor;
  final ButtonRgbColor pressedColor;

  ButtonColorStyle(
      {required this.focusedColor,
      required this.hoveredColor,
      required this.pressedColor});

  factory ButtonColorStyle.fromJson(Map<String, dynamic> json) =>
      _$ButtonColorStyleFromJson(json);
  Map<String, dynamic> toJson() => _$ButtonColorStyleToJson(this);
}
