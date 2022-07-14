// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:mvvm_with_map/utills/Routes/routes.dart';
import 'package:mvvm_with_map/utills/Routes/routes_name.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(),
      initialRoute: RoutesName.login, //calling login page by default
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
