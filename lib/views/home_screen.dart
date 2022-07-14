// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mvvm_with_map/utills/Routes/routes_name.dart';

import '../utills/utills.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Home Page im"),
        ),
        body: InkWell(
          onTap: () {
            Utills.snackBar("Bye Sourabh i'm snackbar", context);
            Navigator.pushNamed(context, RoutesName.login);
            //or  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          child: Center(child: Text("home page ")),
        ),
        drawer: Drawer());
  }
}
