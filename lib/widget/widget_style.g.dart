// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widget_style.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WidgetStyle _$WidgetStyleFromJson(Map<String, dynamic> json) => WidgetStyle(
      color: json['color'] == null
          ? const WidgetRgbColor(r: 20, g: 30, b: 70, opacity: 1)
          : WidgetRgbColor.fromJson(json['color'] as Map<String, dynamic>),
      corner: json['corner'] == null
          ? null
          : WidgetCorner.fromJson(json['corner'] as Map<String, dynamic>),
      shadows: (json['shadows'] as List<dynamic>?)
          ?.map((e) => WidgetShadow.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WidgetStyleToJson(WidgetStyle instance) =>
    <String, dynamic>{
      'color': instance.color.toJson(),
      'corner': instance.corner.toJson(),
      'shadows': instance.shadows.map((e) => e.toJson()).toList(),
    };
