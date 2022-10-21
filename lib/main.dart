import 'package:flutter/material.dart';
import 'package:mausam_app/Activity/home.dart';
import 'package:mausam_app/Activity/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/loading': (context) => Loading()
    },
  ));
}
