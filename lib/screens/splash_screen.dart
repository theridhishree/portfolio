import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentImage = 0;

  final List<String> images = [
    "assets/images/ss1.jpg",

    "assets/images/ss2.jpg",

    "assets/images/ss3.jpg",
  ];

  @override
  void initState() {
    super.initState();

    startSplash();
  }

  void startSplash() async {
    for (int i = 0; i < images.length; i++) {
      await Future.delayed(const Duration(seconds: 1));

      if (mounted) {
        setState(() {
          currentImage = i;
        });
      }
    }

    await Future.delayed(const Duration(seconds: 1));

    if (mounted) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Stack(
        children: [
          /// IMAGE
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 700),

            switchInCurve: Curves.easeInOut,

            switchOutCurve: Curves.easeInOut,

            child: Image.asset(
              images[currentImage],

              key: ValueKey(currentImage),

              fit: BoxFit.cover,

              width: double.infinity,

              height: double.infinity,

              gaplessPlayback: true,
            ),
          ),

          /// DARK OVERLAY
          Container(color: Colors.black.withOpacity(0.3)),

          /// TEXT
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  "Ridhi Shree",

                  style: TextStyle(
                    fontSize: 38,

                    fontWeight: FontWeight.bold,

                    color: Colors.white,

                    letterSpacing: 2,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "Portfolio",

                  style: TextStyle(
                    fontSize: 22,

                    color: Colors.white70,

                    letterSpacing: 4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
