// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'button_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ButtonInfo _$ButtonInfoFromJson(Map<String, dynamic> json) => ButtonInfo(
      action: ButtonActionInfo.fromJson(json['action'] as Map<String, dynamic>),
      colorStyle:
          ButtonColorStyle.fromJson(json['colorStyle'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ButtonInfoToJson(ButtonInfo instance) =>
    <String, dynamic>{
      'action': instance.action.toJson(),
      'colorStyle': instance.colorStyle.toJson(),
    };
