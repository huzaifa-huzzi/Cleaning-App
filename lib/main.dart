import 'package:cleaning_app/Resources/Routes.dart';
import 'package:cleaning_app/Resources/TTextTheme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Cleaning App',
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      routerConfig: Routes.router,
    );
  }
}
