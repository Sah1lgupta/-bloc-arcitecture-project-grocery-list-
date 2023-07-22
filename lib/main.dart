import 'package:flutter/material.dart';
import 'package:flutterbloctesting/feature/home/ui/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(

        body: Home(),
      ),
    );
  }
}
