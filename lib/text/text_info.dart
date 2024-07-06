// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

import 'text_content.dart';
import 'text_style_info.dart';

part 'text_info.g.dart';

@JsonSerializable(explicitToJson: true)
@CopyWith(copyWithNull: true)
class TextInfo {
  final TextContent content;
  final TextStyleInfo style;

  TextInfo({required this.content, required this.style});

  factory TextInfo.fromJson(Map<String, dynamic> json) =>
      _$TextInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TextInfoToJson(this);
}
