// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widget_layout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WidgetLayout _$WidgetLayoutFromJson(Map<String, dynamic> json) => WidgetLayout(
      dx: (json['dx'] as num?)?.toDouble() ?? 0.0,
      dy: (json['dy'] as num?)?.toDouble() ?? 0.0,
      height: (json['height'] as num?)?.toDouble() ?? 60.0,
      width: (json['width'] as num?)?.toDouble() ?? 60.0,
      isAbsolutePosition: json['isAbsolutePosition'] as bool? ?? false,
      isAbsoluteSize: json['isAbsoluteSize'] as bool? ?? false,
      padding: json['padding'] == null
          ? const WidgetPadding()
          : WidgetPadding.fromJson(json['padding'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WidgetLayoutToJson(WidgetLayout instance) =>
    <String, dynamic>{
      'dx': instance.dx,
      'dy': instance.dy,
      'height': instance.height,
      'width': instance.width,
      'isAbsolutePosition': instance.isAbsolutePosition,
      'isAbsoluteSize': instance.isAbsoluteSize,
      'padding': instance.padding.toJson(),
    };
