// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextInfo _$TextInfoFromJson(Map<String, dynamic> json) => TextInfo(
      content: TextContent.fromJson(json['content'] as Map<String, dynamic>),
      style: TextStyleInfo.fromJson(json['style'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TextInfoToJson(TextInfo instance) => <String, dynamic>{
      'content': instance.content.toJson(),
      'style': instance.style.toJson(),
    };
