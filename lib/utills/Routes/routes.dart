// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:mvvm_with_map/utills/Routes/routes_name.dart';
import 'package:mvvm_with_map/views/home_screen.dart';
import 'package:mvvm_with_map/views/login_screen.dart';

class Routes {
  // static MaterialPageRoute generateRoute(RouteSettings settings) { or 
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext) => HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext) => LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text("No Routes found"),
            ),
          );
        });
    }
  }
}
