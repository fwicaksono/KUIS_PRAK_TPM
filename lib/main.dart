import 'package:flutter/material.dart';
//import 'package:kuis_123200160/list_data.dart';
import 'package:kuis_123200160/coret2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HalamanListDisease(),
    );
  }
}
