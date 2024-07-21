import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            Container(
              key: Key('widget1'),
              width: constraints.maxWidth * 0.3,
              height: constraints.maxHeight * 0.3,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 0, 0, 1.0),
              ),
              padding: EdgeInsets.only(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
              ),

              child: 
                Container(
                  key: Key('widget2'),
                  width: constraints.maxWidth * 0.2,
                  height: constraints.maxHeight * 0.2,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 255, 0, 1.0),
                  ),
                  padding: EdgeInsets.only(
                    left: 0.0,
                    top: 0.0,
                    right: 0.0,
                    bottom: 0.0,
                  ),

                ),
            ),
              child: 
                Container(
                  key: Key('widget2'),
                  width: constraints.maxWidth * 0.2,
                  height: constraints.maxHeight * 0.2,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 255, 0, 1.0),
                  ),
                  padding: EdgeInsets.only(
                    left: 0.0,
                    top: 0.0,
                    right: 0.0,
                    bottom: 0.0,
                  ),

                ),
          },
        ),
      ),
    );
  }
}
