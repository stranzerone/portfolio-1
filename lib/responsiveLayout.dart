import 'package:flutter/material.dart';

class Responsive extends StatefulWidget {
  Responsive({required this.desktopbody, required this.mobilebody});
  final Widget mobilebody;
  final Widget desktopbody;

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, Constraints) {
      if (Constraints.maxWidth < 750) {
        return widget.mobilebody;
      } else {
        return widget.desktopbody;
      }
    });
  }
}
