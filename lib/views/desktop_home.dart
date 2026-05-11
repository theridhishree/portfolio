import 'package:flutter/material.dart';

import '../widgets/about_section.dart';
import '../widgets/project_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/desktop_navbar.dart';
import '../widgets/certification_section.dart';

class DesktopHome extends StatefulWidget {
  const DesktopHome({super.key});

  @override
  State<DesktopHome> createState() => _DesktopHomeState();
}

class _DesktopHomeState extends State<DesktopHome> {
  int currentIndex = 0;

  final List<String> titles = ["About", "Projects", "Skills", "Certifications"];

  final List<Widget> pages = [
    AboutSection(),
    ProjectSection(),
    SkillsSection(),
    CertificationSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const DesktopNavbar(),

            Expanded(
              child: Center(
                child: SizedBox(width: 1200, child: pages[currentIndex]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
