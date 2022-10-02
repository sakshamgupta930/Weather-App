import 'package:flutter/material.dart';
import 'package:musam_app/Activity/home.dart';
import 'package:musam_app/Activity/loading.dart';

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
