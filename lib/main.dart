import 'package:code_generator/generated_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Generated App'),
        ),
        body: Center(
          child: GeneratedWidget(),
        ),
      ),
    );
  }
}
