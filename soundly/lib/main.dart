import 'package:flutter/material.dart';
import 'package:soundly/feed.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soundly',
      
      home: Feed(),
    );
  }
}
