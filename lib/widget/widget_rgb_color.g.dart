// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widget_rgb_color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WidgetRgbColor _$WidgetRgbColorFromJson(Map<String, dynamic> json) =>
    WidgetRgbColor(
      r: json['r'] as int,
      g: json['g'] as int,
      b: json['b'] as int,
      opacity: (json['opacity'] as num).toDouble(),
    );

Map<String, dynamic> _$WidgetRgbColorToJson(WidgetRgbColor instance) =>
    <String, dynamic>{
      'r': instance.r,
      'g': instance.g,
      'b': instance.b,
      'opacity': instance.opacity,
    };
