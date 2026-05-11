import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../widgets/certification_section.dart';
import '../widgets/about_section.dart';
import '../widgets/project_section.dart';
import '../widgets/skills_section.dart';

class MobileHome extends StatefulWidget {
  const MobileHome({super.key});

  @override
  State<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
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
      appBar: AppBar(
        title: Text(titles[currentIndex]),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 208, 208, 208),
      ),

      body: pages[currentIndex],

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromARGB(255, 208, 208, 208),

        color: Colors.black,

        buttonBackgroundColor: Colors.black,

        animationDuration: const Duration(milliseconds: 300),

        height: 60,

        index: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        //Bottomnav items
        items: const [
          Icon(Icons.person, color: Colors.white),
          Icon(Icons.apps, color: Colors.white),
          Icon(Icons.developer_mode, color: Colors.white),
          Icon(Icons.workspace_premium, color: Colors.white),
        ],
      ),
    );
  }
}
