import 'package:flutter/material.dart';
import 'package:my_texi/common/color_extension.dart';
import 'package:my_texi/view/login/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Taxi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "NunitoSans",
        scaffoldBackgroundColor: TColor.bg,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: TColor.primary),
        useMaterial3: true,
      ),
      home: const SplashView(),
    );
  }
}

