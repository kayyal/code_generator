// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_style_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextStyleInfo _$TextStyleInfoFromJson(Map<String, dynamic> json) =>
    TextStyleInfo(
      color: TextRGBColor.fromJson(json['color'] as Map<String, dynamic>),
      size: (json['size'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      underline: json['underline'] as bool,
    );

Map<String, dynamic> _$TextStyleInfoToJson(TextStyleInfo instance) =>
    <String, dynamic>{
      'color': instance.color.toJson(),
      'size': instance.size,
      'weight': instance.weight,
      'underline': instance.underline,
    };
