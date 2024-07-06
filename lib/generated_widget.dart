import 'dart:io';

import 'package:code_generator/json_strings.dart';
import 'package:code_generator/widget_generator.dart';
import 'package:flutter/material.dart';

class GeneratedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetGenerator generator = WidgetGenerator();

    String generatedCode = generator.generateCode(JsonString.nestedJson);
    print(generatedCode);

    // Normally, you would need a Dart parser to dynamically parse the generated code string,
    // but for demonstration purposes, you can output the generated code to the console or a file.
    File('generated_app.dart').writeAsStringSync(generatedCode);
    print('Generated code saved to generated_app.dart');

    // Since dynamic code execution is not straightforward in Flutter,
    // you can manually copy the generated code into your project to see the result.

    return Text("Check console for generated code.");
  }
}
