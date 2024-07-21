import 'dart:convert';
import 'package:code_generator/widget/widget_padding.dart';
import 'package:code_generator/widget_type.dart';
import '/widget/widget_info.dart';
import '/widget/widget_layout.dart';

class WidgetGenerator {
  String generateCode(String jsonInput) {
    try {
      List<WidgetInfo> widgetInfoList = _parseJsonInput(jsonInput);
      return _generateFullCode(widgetInfoList);
    } catch (e, stackTrace) {
      print("Error: $e\nStack trace: $stackTrace");
      return "Error generating code: $e";
    }
  }

  List<WidgetInfo> _parseJsonInput(String jsonInput) {
    List<dynamic> jsonData = json.decode(jsonInput);
    List<Map<String, dynamic>> jsonDataMaps =
        List<Map<String, dynamic>>.from(jsonData);
    return jsonDataMaps.map((item) => WidgetInfo.fromJson(item)).toList();
  }

  String _generateFullCode(List<WidgetInfo> widgetInfoList) {
    StringBuffer code = StringBuffer();
    _generateCommonParts(code);
    _generateWidgetClass(code, widgetInfoList);
    return code.toString();
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
    if (widgetInfoList.length == 1) {
      _generateWidgetTree(
          code, widgetInfoList[0], "            ", "constraints");
    } else {
      _generateLayoutWidget(
          code, widgetInfoList, "            ", "constraints");
    }
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

  void _generateWidgetTree(StringBuffer code, WidgetInfo widgetInfo,
      String indent, String constraints) {
    _generateWidget(code, widgetInfo, indent, constraints);

    if (widgetInfo.children != null && widgetInfo.children!.isNotEmpty) {
      code.writeln("$indent  child: ");
      if (widgetInfo.children!.length == 1) {
        _generateWidgetTree(
            code, widgetInfo.children![0], "$indent    ", constraints);
      } else {
        _generateLayoutWidget(
            code, widgetInfo.children!, "$indent    ", constraints);
      }
    }
  }

  void _generateWidget(StringBuffer code, WidgetInfo widgetInfo, String indent,
      String constraints) {
    final generators = {
      WidgetType.container: _generateContainer,
      WidgetType.text: _generateText,
      WidgetType.button: _generateButton,
    };

    final generator = generators[widgetInfo.widgetType];
    if (generator != null) {
      generator(code, widgetInfo, indent, constraints);
    } else {
      code.writeln(
          "$indent// Unsupported widget type: ${widgetInfo.widgetType}");
    }
  }

  void _generateContainer(StringBuffer code, WidgetInfo widgetInfo,
      String indent, String constraints) {
    code.write('''
${indent}Container(
$indent  key: Key('${widgetInfo.key}'),
${_generateSize(widgetInfo.widgetLayout, "$indent  ", constraints)}
${_generateContainerDecoration(widgetInfo, "$indent  ")}
''');

    if (widgetInfo.children != null && widgetInfo.children!.isNotEmpty) {
      code.writeln("$indent  child: ");
      if (widgetInfo.children!.length == 1) {
        _generateWidgetTree(
            code, widgetInfo.children![0], "$indent    ", constraints);
      } else {
        _generateLayoutWidget(
            code, widgetInfo.children!, "$indent    ", constraints);
      }
    }

    code.writeln("$indent),");
  }

  String _generateSize(WidgetLayout layout, String indent, String constraints) {
    if (layout.isAbsoluteSize) {
      return '''
${indent}width: ${layout.width},
${indent}height: ${layout.height},''';
    } else {
      return '''
${indent}width: $constraints.maxWidth * ${layout.width},
${indent}height: $constraints.maxHeight * ${layout.height},''';
    }
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
    if (widgetInfo.widgetLayout.padding != const WidgetPadding()) {
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
    code.writeln('''${indent}Stack(
${indent}  children: [''');

    for (var widgetInfo in widgetInfoList) {
      code.writeln('''${indent}    Positioned(
${indent}      left: ${widgetInfo.widgetLayout.dx},
${indent}      top: ${widgetInfo.widgetLayout.dy},
${indent}      child: ''');

      _generateWidgetTree(code, widgetInfo, "$indent        ", constraints);

      code.writeln('''${indent}    ),''');
    }

    code.writeln('''${indent}  ],
${indent}),''');
  }

  void _generateRowOrColumn(StringBuffer code, List<WidgetInfo> widgetInfoList,
      String indent, String constraints, bool isRow) {
    code.writeln("${indent}${isRow ? 'Row' : 'Column'}(");
    code.writeln("$indent  children: [");
    for (var widgetInfo in widgetInfoList) {
      if (widgetInfo.widgetLayout.isAbsoluteSize) {
        _generateWidgetTree(code, widgetInfo, "$indent    ", constraints);
      } else {
        _generateFlexibleWidget(
            code, widgetInfo, "$indent    ", constraints, isRow);
      }
    }
    code.writeln("$indent  ],");
    code.writeln("$indent),");
  }

  void _generateRow(StringBuffer code, List<WidgetInfo> widgetInfoList,
      String indent, String constraints) {
    _generateRowOrColumn(code, widgetInfoList, indent, constraints, true);
  }

  void _generateColumn(StringBuffer code, List<WidgetInfo> widgetInfoList,
      String indent, String constraints) {
    _generateRowOrColumn(code, widgetInfoList, indent, constraints, false);
  }

  void _generateFlexibleWidget(
    StringBuffer code,
    WidgetInfo widgetInfo,
    String indent,
    String constraints,
    bool isRow, {
    int maxFlex = 10,
    bool useExpanded = false,
  }) {
    double flexBasis = _calculateFlexBasis(widgetInfo, isRow);
    int flex = _calculateFlex(flexBasis, maxFlex);

    String widget = useExpanded ? 'Expanded' : 'Flexible';

    code.writeln('$indent$widget(');

    if (!useExpanded) {
      code.writeln('$indent  flex: $flex,');
    }

    if (widgetInfo.widgetLayout.isAbsoluteSize) {
      code.writeln('$indent  fit: FlexFit.loose,');
    }

    code.writeln('$indent  child: ');
    _generateWidgetTree(code, widgetInfo, '$indent    ', constraints);
    code.writeln('$indent),');
  }

  double _calculateFlexBasis(WidgetInfo widgetInfo, bool isRow) {
    return isRow
        ? widgetInfo.widgetLayout.width
        : widgetInfo.widgetLayout.height;
  }

  int _calculateFlex(double flexBasis, int maxFlex) {
    return (flexBasis * maxFlex).round().clamp(1, maxFlex);
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
