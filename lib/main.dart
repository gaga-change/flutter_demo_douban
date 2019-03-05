import 'package:flutter/material.dart';
import './widget/HomePage.dart';
import './widget/DetailPage.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
      routes: <String, WidgetBuilder> {
        '/detail': (BuildContext context) => DetailPage()
      },
    );
  }
}
