// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widget_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WidgetInfo _$WidgetInfoFromJson(Map<String, dynamic> json) => WidgetInfo(
      key: json['key'] as String,
      widgetType: $enumDecode(_$WidgetTypeEnumMap, json['widgetType']),
      widgetLayout:
          WidgetLayout.fromJson(json['widgetLayout'] as Map<String, dynamic>),
      widgetStyle:
          WidgetStyle.fromJson(json['widgetStyle'] as Map<String, dynamic>),
      textInfo: json['textInfo'] == null
          ? null
          : TextInfo.fromJson(json['textInfo'] as Map<String, dynamic>),
      buttonInfo: json['buttonInfo'] == null
          ? null
          : ButtonInfo.fromJson(json['buttonInfo'] as Map<String, dynamic>),
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => WidgetInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      alignedWithParent: json['alignedWithParent'] == null
          ? null
          : AlignmentToParent.fromJson(
              json['alignedWithParent'] as Map<String, dynamic>),
    )..image = json['image'] == null
        ? null
        : WidgetImage.fromJson(json['image'] as Map<String, dynamic>);

Map<String, dynamic> _$WidgetInfoToJson(WidgetInfo instance) =>
    <String, dynamic>{
      'key': instance.key,
      'widgetType': _$WidgetTypeEnumMap[instance.widgetType]!,
      'widgetLayout': instance.widgetLayout.toJson(),
      'widgetStyle': instance.widgetStyle.toJson(),
      'textInfo': instance.textInfo?.toJson(),
      'buttonInfo': instance.buttonInfo?.toJson(),
      'image': instance.image?.toJson(),
      'alignedWithParent': instance.alignedWithParent?.toJson(),
      'children': instance.children?.map((e) => e.toJson()).toList(),
    };

const _$WidgetTypeEnumMap = {
  WidgetType.text: 'text',
  WidgetType.container: 'container',
  WidgetType.button: 'button',
};
