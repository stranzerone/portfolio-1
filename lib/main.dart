import 'package:flutter/material.dart';
import 'package:portfolio/desktopBody.dart';
import 'package:portfolio/mobileBody.dart';
import 'package:portfolio/responsiveLayout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Your App Title',
        theme: ThemeData(
            // Your theme data
            ),
        home: Responsive(desktopbody: MainApp(), mobilebody: MobileApp()));
  }
}
