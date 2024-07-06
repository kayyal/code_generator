// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widget_shadow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WidgetShadow _$WidgetShadowFromJson(Map<String, dynamic> json) => WidgetShadow(
      blurRadius: (json['blurRadius'] as num).toDouble(),
      blurStyle: json['blurStyle'] as int? ?? 0,
      color: WidgetRgbColor.fromJson(json['color'] as Map<String, dynamic>),
      offsetX: (json['offsetX'] as num).toDouble(),
      offsetY: (json['offsetY'] as num).toDouble(),
      spreadRadius: (json['spreadRadius'] as num).toDouble(),
    );

Map<String, dynamic> _$WidgetShadowToJson(WidgetShadow instance) =>
    <String, dynamic>{
      'blurRadius': instance.blurRadius,
      'blurStyle': instance.blurStyle,
      'color': instance.color.toJson(),
      'offsetX': instance.offsetX,
      'offsetY': instance.offsetY,
      'spreadRadius': instance.spreadRadius,
    };
