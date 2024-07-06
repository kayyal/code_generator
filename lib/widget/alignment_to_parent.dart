import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'alignment_to_parent.g.dart';

@JsonSerializable()
class AlignmentToParent {
  final double x;
  final double y;

  AlignmentToParent({
    required this.x,
    required this.y,
  });

  factory AlignmentToParent.fromJson(Map<String, dynamic> json) =>
      _$AlignmentToParentFromJson(json);

  Map<String, dynamic> toJson() => _$AlignmentToParentToJson(this);

  Alignment toAlignment() {
    return Alignment(x, y);
  }
}
