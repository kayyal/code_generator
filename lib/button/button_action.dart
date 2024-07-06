import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'button_action.g.dart';

@JsonSerializable()
@CopyWith(copyWithNull: true)
class ButtonActionInfo {
  final String onPressed;

  ButtonActionInfo({required this.onPressed});

  factory ButtonActionInfo.fromJson(Map<String, dynamic> json) =>
      _$ButtonActionInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ButtonActionInfoToJson(this);
}
