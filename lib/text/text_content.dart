// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'text_content.g.dart';

@JsonSerializable()
@CopyWith(copyWithNull: true)
class TextContent {
  String text;

  TextContent({required this.text});

  factory TextContent.fromJson(Map<String, dynamic> json) =>
      _$TextContentFromJson(json);

  Map<String, dynamic> toJson() => _$TextContentToJson(this);
}
