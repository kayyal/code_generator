// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widget_corner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WidgetCorner _$WidgetCornerFromJson(Map<String, dynamic> json) => WidgetCorner(
      topRight: (json['topRight'] as num?)?.toDouble() ?? 0.0,
      topLeft: (json['topLeft'] as num?)?.toDouble() ?? 0.0,
      bottomRight: (json['bottomRight'] as num?)?.toDouble() ?? 0.0,
      bottomLeft: (json['bottomLeft'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$WidgetCornerToJson(WidgetCorner instance) =>
    <String, dynamic>{
      'topRight': instance.topRight,
      'topLeft': instance.topLeft,
      'bottomRight': instance.bottomRight,
      'bottomLeft': instance.bottomLeft,
    };
