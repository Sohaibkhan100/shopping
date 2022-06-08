import 'package:flutter/material.dart';
import 'package:shopping/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Color.fromARGB(255, 187, 25, 47)),
        debugShowCheckedModeBanner: false,
        title: 'shopping',
        home: Home());
  }
}
