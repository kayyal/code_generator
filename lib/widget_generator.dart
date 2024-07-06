import 'dart:convert';
import 'package:code_generator/widget_type.dart';
import '/widget/widget_info.dart';
import '/widget/widget_layout.dart';

class WidgetGenerator {
  String generateCode(String jsonInput) {
    try {
      List<dynamic> jsonData = json.decode(jsonInput);
      List<Map<String, dynamic>> jsonDataMaps =
          List<Map<String, dynamic>>.from(jsonData);
      List<WidgetInfo> widgetInfoList =
          jsonDataMaps.map((item) => WidgetInfo.fromJson(item)).toList();

      StringBuffer code = StringBuffer();
      _generateCommonParts(code);
      _generateWidgetClass(code, widgetInfoList);

      return code.toString();
    } catch (e, stackTrace) {
      print("Error: $e\nStack trace: $stackTrace");
      return "Error generating code: $e";
    }
  }

  void _generateCommonParts(StringBuffer code) {
    code.write('''
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
''');
  }

  void _generateWidgetClass(
      StringBuffer code, List<WidgetInfo> widgetInfoList) {
    code.write('''
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
''');
    _generateLayoutWidget(code, widgetInfoList, "            ", "constraints");
    code.write('''
          },
        ),
      ),
    );
  }
}
''');
  }

  void _generateLayoutWidget(StringBuffer code, List<WidgetInfo> widgetInfoList,
      String indent, String constraints) {
    if (_shouldUseStack(widgetInfoList)) {
      _generateStack(code, widgetInfoList, indent, constraints);
    } else if (_shouldUseColumn(widgetInfoList)) {
      _generateColumn(code, widgetInfoList, indent, constraints);
    } else {
      _generateRow(code, widgetInfoList, indent, constraints);
    }
  }

  bool _shouldUseStack(List<WidgetInfo> widgets) {
    for (int i = 0; i < widgets.length; i++) {
      for (int j = i + 1; j < widgets.length; j++) {
        if (_widgetsOverlap(widgets[i], widgets[j])) return true;
      }
    }
    return false;
  }

  bool _widgetsOverlap(WidgetInfo a, WidgetInfo b) {
    return (a.widgetLayout.dx < b.widgetLayout.dx + b.widgetLayout.width &&
        a.widgetLayout.dx + a.widgetLayout.width > b.widgetLayout.dx &&
        a.widgetLayout.dy < b.widgetLayout.dy + b.widgetLayout.height &&
        a.widgetLayout.dy + a.widgetLayout.height > b.widgetLayout.dy);
  }

  bool _shouldUseColumn(List<WidgetInfo> widgets) {
    widgets.sort((a, b) => a.widgetLayout.dy.compareTo(b.widgetLayout.dy));
    for (int i = 1; i < widgets.length; i++) {
      if (widgets[i].widgetLayout.dy <
          widgets[i - 1].widgetLayout.dy + widgets[i - 1].widgetLayout.height) {
        return false;
      }
    }
    return true;
  }

  void _generateWidget(StringBuffer code, WidgetInfo widgetInfo, String indent,
      String constraints) {
    switch (widgetInfo.widgetType) {
      case WidgetType.container:
        _generateContainer(code, widgetInfo, indent, constraints);
        break;
      case WidgetType.text:
        _generateText(code, widgetInfo, indent, constraints);
        break;
      case WidgetType.button:
        _generateButton(code, widgetInfo, indent, constraints);
        break;
      default:
        code.writeln(
            "$indent// Unsupported widget type: ${widgetInfo.widgetType}");
    }
  }

  void _generateContainer(StringBuffer code, WidgetInfo widgetInfo,
      String indent, String constraints) {
    code.write('''
${indent}Positioned(
${_generatePosition(widgetInfo.widgetLayout, "$indent  ", constraints)}
$indent  child: Container(
$indent    key: Key('${widgetInfo.key}'),
${_generateSize(widgetInfo.widgetLayout, "$indent    ", constraints)}
${_generateContainerDecoration(widgetInfo, "$indent    ")}
''');
    if (widgetInfo.children != null && widgetInfo.children!.isNotEmpty) {
      code.writeln("$indent    child: ");
      _generateLayoutWidget(
          code, widgetInfo.children!, "$indent      ", constraints);
    }
    code.write('''
$indent  ),
$indent),
''');
  }

  String _generatePosition(
      WidgetLayout layout, String indent, String constraints) {
    return '''
${indent}left: $constraints.maxWidth * ${layout.dx},
${indent}top: $constraints.maxHeight * ${layout.dy},''';
  }

  String _generateSize(WidgetLayout layout, String indent, String constraints) {
    return '''
${indent}width: $constraints.maxWidth * ${layout.width},
${indent}height: $constraints.maxHeight * ${layout.height},''';
  }

  String _generateContainerDecoration(WidgetInfo widgetInfo, String indent) {
    StringBuffer decoration = StringBuffer();
    if (widgetInfo.widgetStyle.color != null) {
      decoration.write('''
${indent}decoration: BoxDecoration(
$indent  color: Color.fromRGBO(${widgetInfo.widgetStyle.color!.r}, ${widgetInfo.widgetStyle.color!.g}, ${widgetInfo.widgetStyle.color!.b}, ${widgetInfo.widgetStyle.color!.opacity}),
$indent),
''');
    }
    if (widgetInfo.widgetLayout.padding != null) {
      decoration.write('''
${indent}padding: EdgeInsets.only(
$indent  left: ${widgetInfo.widgetLayout.padding.left},
$indent  top: ${widgetInfo.widgetLayout.padding.top},
$indent  right: ${widgetInfo.widgetLayout.padding.right},
$indent  bottom: ${widgetInfo.widgetLayout.padding.bottom},
$indent),
''');
    }
    return decoration.toString();
  }

  void _generateStack(StringBuffer code, List<WidgetInfo> widgetInfoList,
      String indent, String constraints) {
    code.writeln("${indent}Stack(");
    code.writeln("$indent  children: [");
    for (var widgetInfo in widgetInfoList) {
      _generateWidget(code, widgetInfo, "$indent    ", constraints);
    }
    code.writeln("$indent  ],");
    code.writeln("$indent),");
  }

  void _generateRow(StringBuffer code, List<WidgetInfo> widgetInfoList,
      String indent, String constraints) {
    code.writeln("${indent}Row(");
    code.writeln("$indent  children: [");
    for (var widgetInfo in widgetInfoList) {
      _generateWidget(code, widgetInfo, "$indent    ", constraints);
    }
    code.writeln("$indent  ],");
    code.writeln("$indent),");
  }

  void _generateColumn(StringBuffer code, List<WidgetInfo> widgetInfoList,
      String indent, String constraints) {
    code.writeln("${indent}Column(");
    code.writeln("$indent  children: [");
    for (var widgetInfo in widgetInfoList) {
      _generateWidget(code, widgetInfo, "$indent    ", constraints);
    }
    code.writeln("$indent  ],");
    code.writeln("$indent),");
  }

  void _generateText(StringBuffer code, WidgetInfo widgetInfo, String indent,
      String constraints) {
    code.write('''
${indent}Text(
$indent  '${widgetInfo.textInfo?.content ?? ''}',
$indent  key: Key('${widgetInfo.key}'),
$indent  style: TextStyle(
${_generateTextStyle(widgetInfo, "$indent    ")}
$indent  ),
$indent),
''');
  }

  String _generateTextStyle(WidgetInfo widgetInfo, String indent) {
    StringBuffer style = StringBuffer();
    if (widgetInfo.textInfo?.style.size != null) {
      style.writeln("${indent}fontSize: ${widgetInfo.textInfo!.style.size},");
    }
    if (widgetInfo.textInfo?.style.weight != null) {
      style.writeln(
          "${indent}fontWeight: FontWeight.${widgetInfo.textInfo!.style.weight.toString().split('.').last},");
    }
    if (widgetInfo.textInfo?.style.color != null) {
      style.writeln(
          "${indent}color: Color.fromRGBO(${widgetInfo.textInfo!.style.color!.r}, ${widgetInfo.textInfo!.style.color!.g}, ${widgetInfo.textInfo!.style.color!.b}),");
    }
    return style.toString();
  }

  void _generateButton(StringBuffer code, WidgetInfo widgetInfo, String indent,
      String constraints) {
    code.write('''
${indent}ElevatedButton(
$indent  key: Key('${widgetInfo.key}'),
$indent  onPressed: () {},
$indent  child: Text('${widgetInfo.textInfo?.content ?? 'Button'}'),
$indent),
''');
  }
}
