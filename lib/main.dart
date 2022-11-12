import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const GetMaterialApp(
      home: HomeScreen(),
      title: 'Weather',
      debugShowCheckedModeBanner: false,
    );
  }
}
