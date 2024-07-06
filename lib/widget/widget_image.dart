// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'widget_image.g.dart';

@JsonSerializable()
@CopyWith(copyWithNull: true)
class WidgetImage {
  final String imagePath;

  WidgetImage({required this.imagePath});

  factory WidgetImage.fromJson(Map<String, dynamic> json) =>
      _$WidgetImageFromJson(json);

  Map<String, dynamic> toJson() => _$WidgetImageToJson(this);
}
