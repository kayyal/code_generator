// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

import 'text_rgb_color.dart';

part 'text_style_info.g.dart';

@JsonSerializable(explicitToJson: true)
@CopyWith(copyWithNull: true)
class TextStyleInfo {
  final TextRGBColor color;
  final double size;
  final double weight;
  final bool underline;

  TextStyleInfo(
      {required this.color,
      required this.size,
      required this.weight,
      required this.underline});

  factory TextStyleInfo.fromJson(Map<String, dynamic> json) =>
      _$TextStyleInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TextStyleInfoToJson(this);
}

FontWeight calculateFontWeight(double weight) {
  if (weight <= 100) {
    return FontWeight.w100;
  } else if (weight <= 200) {
    return FontWeight.w200;
  } else if (weight <= 300) {
    return FontWeight.w300;
  } else if (weight <= 400) {
    return FontWeight.w400;
  } else if (weight <= 500) {
    return FontWeight.w500;
  } else if (weight <= 600) {
    return FontWeight.w600;
  } else if (weight <= 700) {
    return FontWeight.w700;
  } else if (weight <= 800) {
    return FontWeight.w800;
  } else {
    return FontWeight.w900;
  }
}
