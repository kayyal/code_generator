// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'button_rgb_color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ButtonRgbColor _$ButtonRgbColorFromJson(Map<String, dynamic> json) =>
    ButtonRgbColor(
      r: json['r'] as int,
      g: json['g'] as int,
      b: json['b'] as int,
      opacity: (json['opacity'] as num).toDouble(),
    );

Map<String, dynamic> _$ButtonRgbColorToJson(ButtonRgbColor instance) =>
    <String, dynamic>{
      'r': instance.r,
      'g': instance.g,
      'b': instance.b,
      'opacity': instance.opacity,
    };
