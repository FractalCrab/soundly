import 'package:flutter/material.dart';
import 'package:soundly/screens/feed.dart';
import 'package:soundly/screens/auth.dart';
import 'package:soundly/screens/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soundly',
      themeMode: ThemeMode.dark,
      theme: ThemeData(textTheme: TextTheme()),
      home: AuthPage(),
    );
  }
}
