// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'button_color_style.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ButtonColorStyle _$ButtonColorStyleFromJson(Map<String, dynamic> json) =>
    ButtonColorStyle(
      focusedColor:
          ButtonRgbColor.fromJson(json['focusedColor'] as Map<String, dynamic>),
      hoveredColor:
          ButtonRgbColor.fromJson(json['hoveredColor'] as Map<String, dynamic>),
      pressedColor:
          ButtonRgbColor.fromJson(json['pressedColor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ButtonColorStyleToJson(ButtonColorStyle instance) =>
    <String, dynamic>{
      'focusedColor': instance.focusedColor.toJson(),
      'hoveredColor': instance.hoveredColor.toJson(),
      'pressedColor': instance.pressedColor.toJson(),
    };
