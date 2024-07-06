// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'text_rgb_color.g.dart';

@JsonSerializable()
@CopyWith(copyWithNull: true)
class TextRGBColor {
  final int r;
  final int g;
  final int b;

  const TextRGBColor({required this.r, required this.g, required this.b});

  factory TextRGBColor.fromJson(Map<String, dynamic> json) =>
      _$TextRGBColorFromJson(json);

  Map<String, dynamic> toJson() => _$TextRGBColorToJson(this);
}
