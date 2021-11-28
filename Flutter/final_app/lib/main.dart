import 'package:flutter/material.dart';
import 'Views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Final',
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
