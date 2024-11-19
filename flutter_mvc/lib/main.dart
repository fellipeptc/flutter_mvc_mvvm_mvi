import 'package:flutter/material.dart';
import 'package:flutter_mvc/configs/custom_theme.dart';
import 'package:flutter_mvc/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: CustomTheme.black,
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: CustomTheme.elevatedButtonStyle,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: CustomTheme.black,
        ),
      ),
      home: const HomeView(),
    );
  }
}
