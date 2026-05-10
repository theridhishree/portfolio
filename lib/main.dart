import 'package:flutter/material.dart';
import 'package:portfolio/views/mobile_home.dart';
import 'views/home_page.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {'/home': (context) => const MobileHome()},
      theme: ThemeData(useMaterial3: true),
      title: 'My Portfolio',
      home: const SplashScreen(),
    );
  }
}
