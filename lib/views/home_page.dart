import 'package:flutter/material.dart';
import 'mobile_home.dart';
import 'desktop_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  ///hello
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 800) {
          return MobileHome();
        } else {
          return DesktopHome();
        }
      },
    );
  }
}
